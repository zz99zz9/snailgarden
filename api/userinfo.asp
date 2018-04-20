<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/conn.asp"-->
<%dim opid,userinfo
opid=Request("opid")
userinfo=Request("userinfo")
if opid="" then opid=0
if userinfo="" then userinfo=0
'if opid="" or userinfo="" then
' response.write("用户信息错误")
' else
%>
<%'验证数据库中是否有Openid,无则存，有则改
set rs=server.CreateObject("adodb.recordset")
     sql="select * from [user] where wxid='"&opid&"'"
	 rs.open sql,conn,1,1	 
	 if rs.eof then
	 	'用户不存在，存入用户信息
         response.write ("add添加")
   	 else
        '用户已存在，修改用户信息
         response.write ("mod修改")
     end if
'end if

%>
