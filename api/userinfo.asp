<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/Json.asp"-->
<!--#include file="../inc/conn.asp"-->
<%dim opid,userinfo
opid=Request("opid")
nickname=request("nickname") 
avatarurl=request("avatarurl") 
gender=request("gender") 
province=request("province") 
city=request("city") Í
tel=request("tel")

if opid="" then
 response.write("用户信息错误")
 else
' Set u = parseJSON(userinfo)  
'输出对象

%>


<%'验证数据库中是否有Openid,无则存，有则改
set rs=server.CreateObject("adodb.recordset")
     sql="select * from [user] where wxid='"&opid&"'"
	 rs.open sql,conn,1,1	 
	 if rs.eof then
	 	'用户不存在，存入用户信息
      '   response.write (nickname)
        conn.execute"INSERT INTO [user] (wxid,nickname,avatarurl,gender,province,city,tel,status,uptime,lasttime) VALUES ('"&opid&"','"&nickname&"','"&avatarurl&"','"&gender&"','"&province&"','"&city&"','"&tel&"','0','"&now()&"','"&now()&"')"
       has=0
   	 else
        '用户已存在，修改用户信息
      '   response.write ("mod修改")
          conn.execute"update [user] set nickname='"&nickname&"',avatarurl='"&avatarurl&"',gender='"&gender&"',province='"&province&"',city='"&city&"',tel='"&tel&"',lasttime='"&now()&"' where wxid='"&opid&"'"
          '判断此用户有没有花园
          set rs=server.CreateObject("adodb.recordset")
     sql="select * from [garden] where wxid='"&opid&"'"

'	 response.write sql
'	 response.end()
	 rs.open sql,conn,1,1	 
	 if rs.eof then
	 	has=2
  '   has1=sql
   	 else
     	has=1
   '   has1=sql
     end if


          end if
end if

Response.ContentType = "text/JSON"
Dim Jsons
Set Jsons = jsObject()
Jsons("has") = has
'Jsons("has1") = has1

Response.write Jsons.jsString

Set Jsons = Nothing
%>