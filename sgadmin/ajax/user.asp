<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%
	  id=request("id")
	  rname=request("rname")
	  rtel=request("rtel")
      action=trim(request("action"))

		
select case action

Case "mod"

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [user] where id="&id,conn,1,3

ors("rname")=rname
ors("rtel")=rtel

oRs.Update
oRs.close
set oRs=Nothing
response.write ("mod")
Case "del"
conn.execute "delete from [user] where Id="&Trim(id)
response.write ("del")
end select
%>