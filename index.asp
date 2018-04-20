<%dim opid,userinfo
opid=Request("opid")
userinfo=Request("userinfo")
%>
<%if name="name" then%>
<%=opid%>0
<%else%>
<%=opid%><br>1
<%=userinfo%>
<%end if%>
