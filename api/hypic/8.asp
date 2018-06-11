<%set hyhjpic=server.createobject("scripting.dictionary")
set hyhjpic2=server.createobject("scripting.dictionary")
set hyhjpic3=server.createobject("scripting.dictionary")
set hyhjpic4=server.createobject("scripting.dictionary")
set hyhjpic5=server.createobject("scripting.dictionary")
set hyhjpic6=server.createobject("scripting.dictionary")

set rs1=server.CreateObject("adodb.recordset")
     sql1="select count(*) as counts from [g-img] where fid="&rs("uid")&" and jg=8"
	 rs1.open sql1,conn,1,1	 
	 ii=rs1("counts")
	 
set rs1=server.CreateObject("adodb.recordset")
     sql1="select * from [g-img] where fid="&rs("uid")&" and jg=5"
	 rs1.open sql1,conn,1,1	 

if ii>0 then
p1pic=rs1("file")
p1tit=rs1("tit")
rs1.movenext
end if
if ii>1 then
p2pic=rs1("file")
p2tit=rs1("tit")
rs1.movenext
end if
if ii>2 then
p3pic=rs1("file")
p3tit=rs1("tit")
rs1.movenext
end if
if ii>3 then
p4pic=rs1("file")
p4tit=rs1("tit")
rs1.movenext
end if
if ii>4 then
p5pic=rs1("file")
p5tit=rs1("tit")
rs1.movenext
end if
if ii>5 then
p6pic=rs1("file")
p6tit=rs1("tit")
end if

hyhjpic.add "img",p1pic
hyhjpic.add "tit",p1tit
hyhjpic2.add "img",p2pic
hyhjpic2.add "tit",p2tit
hyhjpic3.add "img",p3pic
hyhjpic3.add "tit",p3tit
hyhjpic4.add "img",p4pic
hyhjpic4.add "tit",p4tit
hyhjpic5.add "img",p5pic
hyhjpic5.add "tit",p5tit
hyhjpic6.add "img",p6pic
hyhjpic6.add "tit",p6tit
	 select case ii 
	 case 0 
	 hyhjpics = Array()
	 case 1
	 hyhjpics = Array(hyhjpic)
	 case 2
	  hyhjpics = Array(hyhjpic,hyhjpic2)
	  	  case 3
	  hyhjpics = Array(hyhjpic,hyhjpic2,hyhjpic3)
	  	  case 4
	  hyhjpics = Array(hyhjpic,hyhjpic2,hyhjpic3,hyhjpic4)
	  	  case 5
	  hyhjpics = Array(hyhjpic,hyhjpic2,hyhjpic3,hyhjpic4,hyhjpic5)
	  case 6
	  hyhjpics = Array(hyhjpic,hyhjpic2,hyhjpic3,hyhjpic4,hyhjpic5,hyhjpic6)
	  end select
      %>