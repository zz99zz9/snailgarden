
<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">


              <!-- page start -->

                            <!--成功失败提示-->
<div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>内容修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row ">
                  <div class="col-lg-12">
                      <section class="panel pb50">
                          <header class="panel-heading mb50">
                              信息修改
                          </header>
                      <form name="myform" id="myform">    
                      <%
Dim PID
ID=Trim(Request.QueryString("ID"))

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [user] where id="&ID,conn,1,3
if oRs.Eof then
'无数据
End if
%>
    <div class="form-group row">
    <label for="rname" class="col-sm-2 control-label text-right xglab">姓名</label>
    <div class="col-sm-7">
      <input type="text" name="rname" class="form-control" id="rname" value="<%=oRs("rname")%>">
    </div>
  </div>


          <div class="form-group row">
    <label for="rtel" class="col-sm-2 control-label text-right xglab">电话</label>
    <div class="col-sm-7 ">
      <input name="rtel" type="text" id="rtel" class="form-control col-sm-6" value="<%=oRs("rtel")%>">
    </div>
  </div>
  <div class="form-group row">
      <label for="nickName" class="col-sm-2 control-label text-right xglab">微信昵称</label>
      <div class="col-sm-7 ">
        <label for="nickName" class="control-label text-right xglab"><%=oRs("nickName")%></label>
      </div>
    </div>
      <div class="form-group row">
      <label for="nickName" class="col-sm-2 control-label text-right xglab">城市</label>
      <div class="col-sm-7 ">
        <label for="nickName" class="control-label text-right xglab"><%=oRs("province")%>-<%=oRs("city")%></label>
      </div>
    </div>



<div class="row">
<div class="col-lg-offset-2 col-lg-7">
<button class="btn btn-danger save" type="button" style="margin:15px auto;">保存</button>
<input id="action" value="mod" type="hidden">
<input id="id" value="<%=oRs("id")%>" type="hidden">

</div>
  </div>
</form>
<!--列表结束-->
                      </section>
                  </div>
              </div>

              <!--  page end  -->
          </section>
      </section>
      <!--main content end-->
  </section>

<!--#include file="inc/xgfooter.asp"-->
<!--#include file="inc/windows.asp"-->
  <script type="text/javascript">
//导航菜单

<%if classid>19 and classid<>25 then%>

$(".nav7").addClass('active');
$(".nav7-<%=classid%>").addClass('active');
<%elseif classid>15 and classid<>25 then%>

$(".nav5").addClass('active');
$(".nav5-<%=classid%>").addClass('active');
<%else%>
$(".nav4").addClass('active');
$(".nav4-<%=classid%>").addClass('active');
<%end if%>

</script>
<script type="text/javascript" src="ajax/user.js"></script>
