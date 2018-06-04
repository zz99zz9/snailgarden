<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%
uid=request("uid")
action=request("action")
p1txt=request("p1txt")
p1pic=request("p1pic")
p2txt=request("p2txt")
p2pic=request("p2pic")
p3txt=request("p3txt")
p4txt=request("p4txt")
p4pic=request("p4pic")
p4pic1=request("p4pic1")
p5txt=request("p5txt")
p6txt=request("p6txt")
p7txt=request("p7txt")
p8txt=request("p8txt")
p9txt=request("p9txt")
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [user] where id="&uid,conn,1,1
If Not oRs.eof Then
wxid=ors("wxid")
End if
oRs.close
set oRs=Nothing
		
select case action

Case "add"
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [garden] ",conn,1,3

oRs.Addnew
oRs("uid")=Trim(uid)
oRs("wxid")=Trim(wxid)
oRs("p1txt")=Trim(p1txt)
oRs("p1pic")=Trim(p1pic)
oRs("p2txt")=Trim(p2txt)

oRs("p3txt")=Trim(p3txt)
oRs("p4txt")=Trim(p4txt)

oRs("p5txt")=Trim(p5txt)
oRs("p6txt")=Trim(p6txt)
oRs("p7txt")=Trim(p7txt)
oRs("p8txt")=Trim(p8txt)
oRs("p9txt")=Trim(p9txt)
oRs.Update

oRs.close
set oRs=Nothing

response.write ("add")

Case "mod"

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [garden] where uid="&uid,conn,1,3


oRs("wxid")=Trim(wxid)
oRs("p1txt")=Trim(p1txt)
oRs("p1pic")=Trim(p1pic)
oRs("p2txt")=Trim(p2txt)

oRs("p3txt")=Trim(p3txt)
oRs("p4txt")=Trim(p4txt)

oRs("p5txt")=Trim(p5txt)
oRs("p6txt")=Trim(p6txt)
oRs("p7txt")=Trim(p7txt)
oRs("p8txt")=Trim(p8txt)
oRs("p9txt")=Trim(p9txt)

oRs.Update

oRs.close
set oRs=Nothing
response.write ("mod")
Case "del"
conn.execute "delete from [garden] where uId="&Trim(uid)
response.write ("del")
end select
%>