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
sql="select * From [user] "
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
                              新闻列表
                          </header>
                          
<!--列表开始-->

<!--以后补一个类别切换-->
<form>
<table class="table table-striped border-top table-hover" id="sample_1">
<thead>
          <tr > 
          
            <th width="40" class="hidden-phone"><strong>ID</strong></td>
            <th width="60" class="hidden-phone"><strong>昵称</strong></td>
            <th width="60" class="hidden-phone"><strong>电话</strong></td>
            <th width="70" class="hidden-phone"><strong>城市</strong></td>
            <th width="50" class="hidden-phone"><strong>登录时间</strong></td>
<th width="40" class="hidden-phone"><strong>花园</strong></td>
            <th width="48" ><strong>操作</strong></td>
          </tr></thead>
          <tbody>
          <%do while not rs.eof
          sql="select * From [garden] where wxid='"&rs("wxid")&"'"
Set rs1= Server.CreateObject("ADODB.Recordset")
rs1.open sql,conn,1,1
	 if rs1.eof then
     garden=0
     else
     garden=1
     end if
     rs1.close
     set rs1=nothing
     %>
          <tr > 
            <td class="hidden-phone"><%=rs("id")%></td>
            <td class="hidden-phone"><%=rs("rname")%>[<%=rs("nickName")%>]</td>
            <td class="hidden-phone"><%=rs("rtel")%></td>
            <td><%=rs("province")%>-<%=rs("city")%></td>
            <td class="hidden-phone"><%= rs("lasttime") %></td>
            <td class="hidden-phone"><%if garden=1 then%><a href="garden_mod.asp?ID=<%=rs("id")%>" class="btn btn-success btn-xs">管理花园</a><%else%><a href="garden_add.asp?ID=<%=rs("id")%>" class="btn btn-success btn-xs">创建花园</a> <%end if%></td>
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
<%
     rs.close
     set rs=nothing
     %>
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
conn.execute "delete from [user] where id="&Trim(delid)
response.Redirect("user_List.Asp?sta=del")
end if
%>
  <script type="text/javascript">
//导航菜单



$(".nav2").addClass('active');
$(".nav2-1").addClass('active');

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
