<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Json2.asp"-->
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
     sql="select * from [garden] where wxid='"&opid&"'"
	 rs.open sql,conn,1,1	 
	 '花园特征
p1txt=rs("p1txt")
p1pic=rs("p1pic")
p2txt=rs("p2txt")
p3txt=rs("p3txt")
p4txt=rs("p4txt")
p5txt=rs("p5txt")
p6txt=rs("p6txt")
p7txt=rs("p7txt")
p8txt=rs("p8txt")
p9txt=rs("p9txt")
end if

response.ContentType="text/json"
dim j

'多重嵌套的JSON,要使用Dictionary才能实现
set j=new json
j.toResponse=false
set hytz=server.createobject("scripting.dictionary")
set hy=server.createobject("scripting.dictionary")
set hysd=server.createobject("scripting.dictionary")
set hyxp=server.createobject("scripting.dictionary")
set hyqm=server.createobject("scripting.dictionary")
set hygm=server.createobject("scripting.dictionary")
set hyhj=server.createobject("scripting.dictionary")
set hyhx=server.createobject("scripting.dictionary")

'花园特征
hytz.add "txt",p1txt
hytz.add "img",p1pic


'花园水电
%>
<!--#include file="hypic/4.asp"-->
<%
hysd.add "txt",p4txt
hysd.add "pic",hysdpics
'花园小品
%>
<!--#include file="hypic/5.asp"-->
<%
hyxp.add "txt",p5txt
hyxp.add "pic",hyxppics
'花园乔木
%>
<!--#include file="hypic/6.asp"-->
<%
hyqm.add "txt",p6txt
hyqm.add "pic",hyqmpics
'花园灌木
%>
<!--#include file="hypic/7.asp"-->
<%
hygm.add "txt",p7txt
hygm.add "pic",hygmpics
'花园花境
%>
<!--#include file="hypic/8.asp"-->
<%
hyhj.add "txt",p8txt
hyhj.add "pic",hyhjpics
'花园花絮
%>
<!--#include file="hypic/9.asp"-->
<%
hyhx.add "txt",p8txt
hyhx.add "pic",hyhxpics
'花园数据合成
hy.add "hytz",hytz
hy.add "hynz",p2txt
hy.add "hymz",p3txt
hy.add "hysd",hysd
hy.add "hyxp",hyxp
hy.add "hygm",hygm
hy.add "hyhj",hyhj
hy.add "hyhx",hyhx



a=j.toJSON(empty,hy,false)
response.write a

%>