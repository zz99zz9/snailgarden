<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/Json.asp"-->
<!--#include file="../inc/conn.asp"-->
<%dim opid,userinfo
opid=Request("opid")


if opid="" then
 response.write("用户信息错误")
 else
' Set u = parseJSON(userinfo)  
'输出对象

%>


<%'验证数据库中是否有Openid,无则存，有则改
set rs=server.CreateObject("adodb.recordset")
     sql="select * from [hy] where wxid='"&opid&"'"
	 rs.open sql,conn,1,1	 
	 '花园特征
     hytz=
end if

Response.ContentType = "text/JSON"
Dim Jsons
Set Jsons = jsObject()
Jsons("has") = has


Response.write Jsons.jsString

Set Jsons = Nothing
%>