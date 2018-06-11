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
end if

response.ContentType="text/json"
dim j

'多重嵌套的JSON,要使用Dictionary才能实现
set j=new json
j.toResponse=false
set hytz=server.createobject("scripting.dictionary")
set hy=server.createobject("scripting.dictionary")
set hysd=server.createobject("scripting.dictionary")


'花园特征
hytz.add "txt",p1txt
hytz.add "img",p1pic
'花园水电
''花园水电pic


set hysdpic=server.createobject("scripting.dictionary")
set hysdpic2=server.createobject("scripting.dictionary")
set hysdpic3=server.createobject("scripting.dictionary")
set hysdpic4=server.createobject("scripting.dictionary")
set hysdpic5=server.createobject("scripting.dictionary")
set hysdpic6=server.createobject("scripting.dictionary")

set rs1=server.CreateObject("adodb.recordset")
     sql1="select count(*) as count from [g-img] where fid='"&rs("uid")&"' and jg=4"
	 rs1.open sql1,conn,1,1	 
	 ii=rs1("count")
	 
set rs1=server.CreateObject("adodb.recordset")
     sql1="select * from [g-img] where fid='"&rs("uid")&"' and jg=4"
	 rs1.open sql1,conn,1,1	 

hysdpic.add "img",rs1("file")
hysdpic.add "tit",rs1("tit")
rs1.movenext
hysdpic2.add "img",rs1("file")
hysdpic2.add "tit",rs1("tit")
hysdpic3.add "img","3.jpg"
hysdpic3.add "tit","标题3"
hysdpic4.add "img","4.jpg"
hysdpic4.add "tit","标题4"
hysdpic5.add "img","2.jpg"
hysdpic5.add "tit","标题2"
hysdpic6.add "img","3.jpg"
hysdpic6.add "tit","标题3"

hysdpics = Array(hysdpic,hysdpic2,hysdpic3,hysdpic4,hysdpic5,hysdpic6)

'dim hysdpics()


''花园水电合成
hysd.add "txt","花园水电"
hysd.add "pic",hysdpics
'花园数据合成
hy.add "hytz",hytz
hy.add "hynz","花园泥作"
hy.add "hymz","花园木作"
hy.add "hysd",hysd




a=j.toJSON(empty,hy,false)
response.write a
' Response.ContentType = "text/JSON"
' Dim Jsons
' set hytz=jsObject()
' hytz("img")="hytz.img"
' hytz("txt")="花园特征2"
' hytzs=hytz.jsString
' set hytz=Nothing
' Set Jsons = jsObject()
' Set hytz = jsObject()
' Jsons("hytz") = hytzs
' Jsons("hynz") = "花园泥作2"
' Jsons("hymz") = "花园木作2"
' Jsons("hysd") = "{ txt: '水电说明', pic: [{ img: '1.jpg', tit: '标题' }, { img: '2.jpg', tit: '标题' }]}"
' Jsons("hyxp") = "{ txt: '小品说明', pic: [{ img: '1.jpg', tit: '标题' }, { img: '2.jpg', tit: '标题' }]}"
' Jsons("hyqm") = "{ txt: '乔木说明', pic: [{ img: '1.jpg', tit: '标题' }, { img: '2.jpg', tit: '标题' }]}"
' Jsons("hygm") = "{ txt: '灌木说明', pic: [{ img: '1.jpg', tit: '标题' }, { img: '2.jpg', tit: '标题' }]}"
' Jsons("hyhj") = "{ txt: '花境说明', pic: [{ img: '1.jpg', tit: '标题' }, { img: '2.jpg', tit: '标题' }]}"
' Response.write Jsons.jsString

' Set Jsons = Nothing
' Set hytz = Nothing
%>