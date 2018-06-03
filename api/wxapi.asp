<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/Json.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
'''''''''''''''''''''''''''''''''''''''''
'     api_login.asp
'     与微信服务器发生通讯
'''''''''''''''''''''''''''''''''''''''''

'常量配置
'微信API地址
WX_LOGIN_API = "https://api.weixin.qq.com/sns/jscode2session"
'AppID(小程序ID)
WX_APIID = "wx28c6e95caccd13c8"
'AppSecret(小程序密钥)
WX_APPSECRET = "2ee2a7f3ee8fcbe00e08bb9db971302d"
'grant_type
WX_GRANT_TYPE = "authorization_code"
'JSCODE，接收小程序通过wx.request()传过来的code
JSCODE = request("js_code")

If JSCODE = "" Then 
    Response.Write "非法请求。"
    Response.End 
End If

'组装完整的LOGIN_API
WX_LOGIN_API = WX_LOGIN_API & "?appid=" & WX_APIID 
WX_LOGIN_API = WX_LOGIN_API & "&secret=" & WX_APPSECRET 
WX_LOGIN_API = WX_LOGIN_API & "&js_code=" & JSCODE
WX_LOGIN_API = WX_LOGIN_API & "&grant_type=" & WX_GRANT_TYPE

'获取返回的信息
strGetBackInfo=getHTTPPage(WX_LOGIN_API) 
'Response.Write strGetBackInfo

''''下面是ASP远程调用接口的函数
'''''''''''
' 远程获取接口的函数群
'
'''''''''''
Server.ScriptTimeOut=9999999 
Function getHTTPPage(Path) 
    'on error resume next
    t = GetBody(Path) 
    getHTTPPage=BytesToBstr(t,"GB2312") 
End function 

Function Newstring(wstr,strng) 
    Newstring=Instr(lcase(wstr),lcase(strng)) 
    if Newstring<=0 then Newstring=Len(wstr) 
End Function 

Function BytesToBstr(body,Cset) 
    dim objstream 
    set objstream = Server.CreateObject("adodb.stream") 
    objstream.Type = 1 
    objstream.Mode =3 
    objstream.Open 
    objstream.Write body 
    objstream.Position = 0 
    objstream.Type = 2 
    objstream.Charset = Cset 
    BytesToBstr = objstream.ReadText 
    objstream.Close 
    set objstream = nothing 
End Function 

Function GetBody(url) 
    on error resume next 
    Set Retrieval = CreateObject("Microsoft.XMLHTTP") 
    With Retrieval 
    .Open "Get", url, False, "", "" 
    .Send 
    GetBody = .ResponseBody 
    End With 
    Set Retrieval = Nothing 
End Function
%>

<%
'''''''''''''''''
'
' ASP读取Json的函数群
'
'''''''''''''''''
Dim sc4Json 
Sub InitScriptControl
Set sc4Json = Server.CreateObject("MSScriptControl.ScriptControl")
    sc4Json.Language = "JavaScript"
    sc4Json.AddCode "var itemTemp=null;function getJSArray(arr, index){itemTemp=arr[index];}"
End Sub 
 
Function getJSONObject(strJSON)
    sc4Json.AddCode "var jsonObject = " & strJSON
    Set getJSONObject = sc4Json.CodeObject.jsonObject
End Function 
 
Sub getJSArrayItem(objDest,objJSArray,index)
    On Error Resume Next
    sc4Json.Run "getJSArray",objJSArray, index
    Set objDest = sc4Json.CodeObject.itemTemp
    If Err.number=0 Then Exit Sub
    objDest = sc4Json.CodeObject.itemTemp
End Sub

 
Dim objTest
Call InitScriptControl
Set objTest = getJSONObject(strGetBackInfo)
%>
<%
response.write objTest
' Response.ContentType = "text/JSON"
' Dim Jsons
' Set Jsons = jsObject()

' Jsons("session_key")=<%=objTest.session_key%>
' Jsons("openid")=<%=objTest.openid%>

' Response.write Jsons.jsString

' Set Jsons = Nothing
%>
