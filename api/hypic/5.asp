<%set hyxppic=server.createobject("scripting.dictionary")
set hyxppic2=server.createobject("scripting.dictionary")
set hyxppic3=server.createobject("scripting.dictionary")
set hyxppic4=server.createobject("scripting.dictionary")
set hyxppic5=server.createobject("scripting.dictionary")
set hyxppic6=server.createobject("scripting.dictionary")

set rs1=server.CreateObject("adodb.recordset")
     sql1="select count(*) as counts from [g-img] where fid="&rs("uid")&" and jg=5"
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

hyxppic.add "img",p1pic
hyxppic.add "tit",p1tit
hyxppic2.add "img",p2pic
hyxppic2.add "tit",p2tit
hyxppic3.add "img",p3pic
hyxppic3.add "tit",p3tit
hyxppic4.add "img",p4pic
hyxppic4.add "tit",p4tit
hyxppic5.add "img",p5pic
hyxppic5.add "tit",p5tit
hyxppic6.add "img",p6pic
hyxppic6.add "tit",p6tit
	 select case ii 
	 case 0 
	 hyxppics = Array()
	 case 1
	 hyxppics = Array(hyxppic)
	 case 2
	  hyxppics = Array(hyxppic,hyxppic2)
	  	  case 3
	  hyxppics = Array(hyxppic,hyxppic2,hyxppic3)
	  	  case 4
	  hyxppics = Array(hyxppic,hyxppic2,hyxppic3,hyxppic4)
	  	  case 5
	  hyxppics = Array(hyxppic,hyxppic2,hyxppic3,hyxppic4,hyxppic5)
	  case 6
	  hyxppics = Array(hyxppic,hyxppic2,hyxppic3,hyxppic4,hyxppic5,hyxppic6)
	  end select
      %>