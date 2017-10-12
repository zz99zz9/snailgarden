<%dim opid,userinfo
opid=Request("signature")
userinfo=Request("userinfo")
%>
<%if name="name" then%>
<%=opid%>-1
<%else%>
<%=opid%><br>
<%=userinfo%>
<%end if%>
