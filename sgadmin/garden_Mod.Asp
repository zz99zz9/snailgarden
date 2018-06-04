
<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <!-- page start -->
<%dim id
id=request.QueryString("id")
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [garden] where uid="&id,conn,1,3
if oRs.Eof then
'无数据
End if%>
                            <!--成功失败提示-->
<div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>栏目内容修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row ">
                  <div class="col-lg-12">
                      <section class="panel pb50">
                          <header class="panel-heading mb50">
                              信息发布
                          </header>
                      <form name="myform" id="myform">    



    <div class="form-group row">
    <label for="p1txt" class="col-sm-2 control-label text-right xglab">花园特征介绍</label>
    <div class="col-sm-7">
      <input type="text" name="p1txt" class="form-control" id="p1txt" value="<%=oRs("p1txt")%>" >
    </div>
  </div>

      <div class="form-group row">
    <label for="p1pic" class="col-sm-2 control-label text-right xglab">特征图片</label>
    <div class="col-sm-7 row">
      <div class="col-sm-8"><input name="p1pic" type="text" id="p1pic" class="form-control col-sm-6" value="<%=oRs("p1pic")%>"></div>
        <div class="col-sm-3"><input type="button" name="Submit12" value="上传PDF" class="form-control col-sm-2" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=p1pic&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></div>
    </div>
  </div>
    <div class="form-group row">
    <label for="p2txt" class="col-sm-2 control-label text-right xglab">花园泥作</label>
    <div class="col-sm-7">
      <input type="text" name="p2txt" class="form-control" id="p2txt" value="<%=oRs("p2txt")%>">
    </div>
  </div>
      <div class="form-group row">
    <label for="p3txt" class="col-sm-2 control-label text-right xglab">花园木作</label>
    <div class="col-sm-7">
      <input type="text" name="p3txt" class="form-control" id="p3txt" value="<%=oRs("p3txt")%>">
    </div>
  </div>
        <div class="form-group row">
    <label for="p4txt" class="col-sm-2 control-label text-right xglab">花园水电</label>
    <div class="col-sm-7">
      <input type="text" name="p4txt" class="form-control" id="p4txt" value="<%=oRs("p4txt")%>">
    </div>
  </div>

  <div class="form-group row">
    <label for="p5txt" class="col-sm-2 control-label text-right xglab">花园小品</label>
    <div class="col-sm-7">
    <input name="p5txt" type="text" id="p5txt" class="form-control col-sm-6" value="<%=oRs("p5txt")%>">
    </div>
  </div>
    <div class="form-group row">
        <label for="p6txt" class="col-sm-2 control-label text-right xglab">花园乔木</label>
        <div class="col-sm-7 ">
          <input name="p6txt" type="text" id="p6txt" class="form-control col-sm-6" value="<%=oRs("p6txt")%>">
        </div>
      </div>
        <div class="form-group row">
        <label for="p7txt" class="col-sm-2 control-label text-right xglab">花园灌木</label>
        <div class="col-sm-7 ">
          <input name="p7txt" type="text" id="p7txt" class="form-control col-sm-6" value="<%=oRs("p7txt")%>">
        </div>
      </div>
       <div class="form-group row">
        <label for="p8txt" class="col-sm-2 control-label text-right xglab">花园花境</label>
        <div class="col-sm-7 ">
          <input name="p8txt" type="text" id="p8txt" class="form-control col-sm-6" value="<%=oRs("p8txt")%>">
        </div>
      </div>
       <div class="form-group row">
        <label for="p9txt" class="col-sm-2 control-label text-right xglab">花园花絮</label>
        <div class="col-sm-7 ">
          <input name="p9txt" type="text" id="p9txt" class="form-control col-sm-6" value="<%=oRs("p9txt")%>">
        </div>
      </div>
        <div class="form-group row">
    <label for="uptime" class="col-sm-2 control-label text-right xglab">更新时间</label>
    <div class="col-sm-10 row">
    <div class="col-sm-4 input-group">
      <input type="text" name="uptime" class="form-control" id="uptime" value="<%=now()%>" >
    </div>
    </div>
  </div>

<div class="row">
<div class="col-lg-offset-2 col-lg-7">
<button class="btn btn-danger save" type="button" style="margin:15px auto;">保存</button>
<input id="action" value="mod" type="hidden">
<input id="uid" value="<%=ors("uid")%>" type="hidden">
<input id="id" value="<%=ors("id")%>" type="hidden">
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

<%if classid>15 and classid<>25 then%>

$(".nav5").addClass('active');
$(".nav5-<%=classid%>a").addClass('active');
<%else%>
$(".nav4").addClass('active');
$(".nav4-<%=classid%>a").addClass('active');
<%end if%>
</script>
<script type="text/javascript" src="ajax/garden.js"></script>
