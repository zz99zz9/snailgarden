<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/conn.asp"-->
<%dim opid,userinfo
opid=Request("opid")
userinfo=Request("userinfo")

if opid="" or userinfo="" then
 response.write("用户信息错误")
 else
 Set u = parseJSON(userinfo)  
%>
<%'验证数据库中是否有Openid,无则存，有则改
set rs=server.CreateObject("adodb.recordset")
     sql="select * from [user] where wxid='"&opid&"'"
	 rs.open sql,conn,1,1	 
	 if rs.eof then
	 	'用户不存在，存入用户信息
         response.write (u)
      '  conn.execute"INSERT INTO [user] (wxid,nickname,avatarurl,gender,province,city,tel,status,uptime,lasttime) VALUES ('"&opid&"','"&u.nickname&"','"&u.avatarurl&"','"&u.gender&"','"&u.province&"','"&u.city&"','"&u.tel&"','0','"&now()&"','"&now()&"')"
       
   	 else
        '用户已存在，修改用户信息
         response.write ("mod修改")
        '  conn.execute"update [user] set nickname='"&u.nickname&"',avatarurl='"&u.avatarurl&"',gender='"&u.gender&"',province='"&u.province&"',city='"&u.city&"',tel='"&u.tel&"',lasttime='"&now()&"' where wxid='"&opid&"'"
     end if
end if

%>
