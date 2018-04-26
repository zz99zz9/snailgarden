<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/conn.asp"-->
<%dim wxid,uname,tel
wxid=request("openid") 
uname=request("username")
tel=request("tel")



if wxid="" then
 response.write("信息错误")
 else
 
%>
<%'验证数据库中是否有Openid,无则存，有则改
set rs=server.CreateObject("adodb.recordset")
     sql="select * from [feedback] where wxid='"&wxid&"'"
	 rs.open sql,conn,1,1	 
	 if rs.eof then
	 	'用户不存在，存入用户信息

        conn.execute"INSERT INTO [feedback] (wxid,uname,tel) VALUES ('"&wxid&"','"&uname&"','"&tel&"')"
       response.write("{'has':'0'}")
   	 else
        '用户已存在，修改用户信息
          conn.execute"update [feedback] set uname='"&uname&"',tel='"&tel&"',uptime='"&now()&"' where wxid='"&wxid&"'"
          response.write("{'has':'1'}")
          end if
end if

%>
