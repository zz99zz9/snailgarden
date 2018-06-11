<%set hyhxpic=server.createobject("scripting.dictionary")
set hyhxpic2=server.createobject("scripting.dictionary")
set hyhxpic3=server.createobject("scripting.dictionary")
set hyhxpic4=server.createobject("scripting.dictionary")
set hyhxpic5=server.createobject("scripting.dictionary")
set hyhxpic6=server.createobject("scripting.dictionary")

set rs1=server.CreateObject("adodb.recordset")
     sql1="select count(*) as counts from [g-img] where fid="&rs("uid")&" and jg=9"
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

hyhxpic.add "img",p1pic
hyhxpic.add "tit",p1tit
hyhxpic2.add "img",p2pic
hyhxpic2.add "tit",p2tit
hyhxpic3.add "img",p3pic
hyhxpic3.add "tit",p3tit
hyhxpic4.add "img",p4pic
hyhxpic4.add "tit",p4tit
hyhxpic5.add "img",p5pic
hyhxpic5.add "tit",p5tit
hyhxpic6.add "img",p6pic
hyhxpic6.add "tit",p6tit
	 select case ii 
	 case 0 
	 hyhxpics = Array()
	 case 1
	 hyhxpics = Array(hyhxpic)
	 case 2
	  hyhxpics = Array(hyhxpic,hyhxpic2)
	  	  case 3
	  hyhxpics = Array(hyhxpic,hyhxpic2,hyhxpic3)
	  	  case 4
	  hyhxpics = Array(hyhxpic,hyhxpic2,hyhxpic3,hyhxpic4)
	  	  case 5
	  hyhxpics = Array(hyhxpic,hyhxpic2,hyhxpic3,hyhxpic4,hyhxpic5)
	  case 6
	  hyhxpics = Array(hyhxpic,hyhxpic2,hyhxpic3,hyhxpic4,hyhxpic5,hyhxpic6)
	  end select
      %>