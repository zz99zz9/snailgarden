<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/Json.asp"-->
<!--#include file="../inc/conn.asp"-->
<%dim appid
appid=Request("APP_ID")



Response.ContentType = "text/JSON"
Dim Jsons
Set Jsons = jsObject()
Jsons("wxapi") = "https://api.weixin.qq.com/"
'Jsons("has1") = has1

Response.write Jsons.jsString

Set Jsons = Nothing
%>