<%set hysdpic=server.createobject("scripting.dictionary")
set hysdpic2=server.createobject("scripting.dictionary")
set hysdpic3=server.createobject("scripting.dictionary")
set hysdpic4=server.createobject("scripting.dictionary")
set hysdpic5=server.createobject("scripting.dictionary")
set hysdpic6=server.createobject("scripting.dictionary")

set rs1=server.CreateObject("adodb.recordset")
     sql1="select count(*) as counts from [g-img] where fid="&rs("uid")&" and jg=4"
	 rs1.open sql1,conn,1,1	 
	 ii=rs1("counts")
	 
set rs1=server.CreateObject("adodb.recordset")
     sql1="select top "&ii&" * from [g-img] where fid="&rs("uid")&" and jg=4"
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

hysdpic.add "img",p1pic
hysdpic.add "tit",p1tit
hysdpic2.add "img",p2pic
hysdpic2.add "tit",p2tit
hysdpic3.add "img",p3pic
hysdpic3.add "tit",p3tit
hysdpic4.add "img",p4pic
hysdpic4.add "tit",p4tit
hysdpic5.add "img",p5pic
hysdpic5.add "tit",p5tit
hysdpic6.add "img",p6pic
hysdpic6.add "tit",p6tit
	 select case ii 
	 case 0 
	 hysdpics = Array()
	 case 1
	 hysdpics = Array(hysdpic)
	 case 2
	  hysdpics = Array(hysdpic,hysdpic2)
	  	  case 3
	  hysdpics = Array(hysdpic,hysdpic2,hysdpic3)
	  	  case 4
	  hysdpics = Array(hysdpic,hysdpic2,hysdpic3,hysdpic4)
	  	  case 5
	  hysdpics = Array(hysdpic,hysdpic2,hysdpic3,hysdpic4,hysdpic5)
	  case 6
	  hysdpics = Array(hysdpic,hysdpic2,hysdpic3,hysdpic4,hysdpic5,hysdpic6)
	  end select
      %>