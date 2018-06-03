<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<% 

Response.ContentType = "text/JSON"
%>
<!--#include file="../inc/Json.asp"-->
<%

Dim Jsons
Set Jsons = jsObject()
Jsons("Name") = 1
Jsons("Age") = 10





Response.write Jsons.jsString




Set Jsons = Nothing

%>