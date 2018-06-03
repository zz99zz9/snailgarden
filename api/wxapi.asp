<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/Json.asp"-->
<!--#include file="../inc/conn.asp"-->
<%dim APP_ID,secret,js_code,rant_type
APP_ID=Request("appid")
APP_SECRET=Request("secret")
rescode=request("js_code")
rant_type=request("rant_type")
%>
<%=APP_ID%>
    <script src="../sgadmin/xgwl/js/jquery-3.1.1.min.js"></script>
<script >
//https://api.weixin.qq.com/sns/jscode2session
/*
   appid: <%=APP_ID%>,
            secret: <%=APP_SECRET%>,
            js_code: <%=rescode%>,
            rant_type: <%=rant_type%>
            */
	 $.post("https://api.weixin.qq.com/sns/jscode2session",{
	           appid: "<%=APP_ID%>",
            secret: "<%=APP_SECRET%>",
            js_code: "<%=rescode%>",
            rant_type: "<%=rant_type%>"},
           // dataType:"jsonp",
    function(data,status){

	  if(status=="success"){

		  //var jsObjstr =JSON.parse(data);

          console.log(data);
	  }
	});

</script>
<%'https://snailgarden.shxgwl.com/api/wxapi.asp?js_code=01137oFB07lINe2qBUBB0KJAFB037oFF&appid=wx28c6e95caccd13c8&secret=2ee2a7f3ee8fcbe00e08bb9db971302d&grant_type=authorization_code
%>
