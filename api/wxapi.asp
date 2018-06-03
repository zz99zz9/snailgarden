<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/Json.asp"-->
<!--#include file="../inc/conn.asp"-->
<%dim APP_ID,secret,js_code,rant_type
APP_ID=Request("appid")
APP_SECRET=Request("secret")
rescode=request("js_code")
rant_type=request("rant_type")
%>
<script >

		
	 $.post("https://api.weixin.qq.com/sns/jscode2session",{
	        appid: <%=APP_ID%>,
            secret: <%=APP_SECRET%>,
            js_code: <%=rescode%>,
            rant_type: <%=rant_type%>},
    function(data,status){

	  if(status=="success"){

		  var jsObjstr =JSON.parse(data);
          console.log(jsObjstr);
	  }
	});

</script>

    <script src="../xgwl/js/jquery-3.1.1.min.js"></script>