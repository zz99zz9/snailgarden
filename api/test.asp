<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<%
dim arr : set arr=new ArrayList
arr.add "a" : arr.add "b" : arr.add "c"
Response.Write arr.count & "<br>"
for i=0 to arr.count-1
Response.Write arr.item(i) & "<br>"
next
set arr=nothing
%>