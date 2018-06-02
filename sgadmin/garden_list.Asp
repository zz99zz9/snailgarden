<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start -->
<%
dim i
dim sql,rs
classid=request.QueryString("Prod_Type")
sql="select * From [garden] "
sql=sql & " order by id desc"

Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
%>
             <!--成功失败提示-->
<div class="alert" id="alert" style="display:none;">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>栏目内容修改成功。</span>
                              </div>
 
                          <!----> 
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              花园列表
                          </header>
                          
<!--列表开始-->

<!--以后补一个类别切换-->
<form>
<table class="table table-striped border-top table-hover" id="sample_1">
<thead>
          <tr > 
          
            <th width="40" class="hidden-phone"><strong>ID</strong></td>
            <th width="60" class="hidden-phone"><strong>姓名</strong></td>
            <th width="60" class="hidden-phone"><strong>电话</strong></td>
            <th width="70" class="hidden-phone"><strong>小品</strong></td>
            <th width="70" class="hidden-phone"><strong>乔木</strong></td>
            <th width="70" class="hidden-phone"><strong>灌木</strong></td>
            <th width="70" class="hidden-phone"><strong>花境</strong></td>
            <th width="70" class="hidden-phone"><strong>花絮</strong></td>

            <th width="48" ><strong>操作</strong></td>
          </tr></thead>
          <tbody>
          <%do while not rs.eof%>
          <tr > 
            <td class="hidden-phone"><%=rs("id")%></td>
            <td class="hidden-phone"><%=rs("uid")%></td>
            <td class="hidden-phone"><%=rs("uid")%></td>
            <td><a class="btn btn-info btn-xs" href="Pic_list.asp?pro_id=47">
          <span class="glyphicon glyphicon-picture"></span> 8 </a> </td>
          <td><a class="btn btn-info btn-xs" href="Pic_list.asp?pro_id=47">
          <span class="glyphicon glyphicon-picture"></span> 8 </a> </td>
          <td><a class="btn btn-info btn-xs" href="Pic_list.asp?pro_id=47">
          <span class="glyphicon glyphicon-picture"></span> 8 </a> </td>
          <td><a class="btn btn-info btn-xs" href="Pic_list.asp?pro_id=47">
          <span class="glyphicon glyphicon-picture"></span> 8 </a> </td>
          <td><a class="btn btn-info btn-xs" href="Pic_list.asp?pro_id=47">
          <span class="glyphicon glyphicon-picture"></span> 8 </a> </td>

            <td > 
              <a href="user_mod.asp?ID=<%=rs("id")%>" class="btn btn-success btn-xs">修改</a> 
              <a href="?id=<%=rs("id")%>&Action=Del" onClick="return ConfirmDel();" class="btn btn-danger btn-xs">删除</a> </td>
          </tr>
          <%
	i=i+1
	  
	      rs.movenext
	loop
%>
          </tbody>
          </table>
        </table>
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
<%
action=request.QueryString("Action")
delid=request.QueryString("id")
if action="Del" then
conn.execute "delete from [garden] where id="&Trim(delid)
response.Redirect("garden_List.Asp?sta=del")
end if
%>
  <script type="text/javascript">
//导航菜单

<%if classid>19 and classid<>25 then%>

$(".nav7").addClass('active');
$(".nav7-<%=classid%>").addClass('active');
<%elseif classid>15 and classid<>25  then%>

$(".nav5").addClass('active');
$(".nav5-<%=classid%>").addClass('active');
<%else%>
$(".nav4").addClass('active');
$(".nav4-<%=classid%>").addClass('active');
<%end if%>
function ConfirmDel()
{
   if(confirm("确定要删除选中的内容吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
}
var sta='<%=request.QueryString("sta")%>';
if(sta=='add'){
			  		$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert span").html("数据添加成功!");
}else if(sta=='mod'){
			  		$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert span").html("数据修改成功!");
}else if(sta=='del'){
			  		$("#alert").fadeIn();
					$("#alert").addClass("alert-success");
					$("#alert span").html("数据删除成功!");
}
console.log(sta);
</script>
<script type="text/javascript" src="xgwl/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="xgwl/assets/data-tables/DT_bootstrap.js"></script>
<script src="xgwl/js/dynamic-table.js"></script>
t>
s"></script>
