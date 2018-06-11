<%set hyqmpic=server.createobject("scripting.dictionary")
set hyqmpic2=server.createobject("scripting.dictionary")
set hyqmpic3=server.createobject("scripting.dictionary")
set hyqmpic4=server.createobject("scripting.dictionary")
set hyqmpic5=server.createobject("scripting.dictionary")
set hyqmpic6=server.createobject("scripting.dictionary")

set rs1=server.CreateObject("adodb.recordset")
     sql1="select count(*) as counts from [g-img] where fid="&rs("uid")&" and jg=6"
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

hyqmpic.add "img",p1pic
hyqmpic.add "tit",p1tit
hyqmpic2.add "img",p2pic
hyqmpic2.add "tit",p2tit
hyqmpic3.add "img",p3pic
hyqmpic3.add "tit",p3tit
hyqmpic4.add "img",p4pic
hyqmpic4.add "tit",p4tit
hyqmpic5.add "img",p5pic
hyqmpic5.add "tit",p5tit
hyqmpic6.add "img",p6pic
hyqmpic6.add "tit",p6tit
	 select case ii 
	 case 0 
	 hyqmpics = Array()
	 case 1
	 hyqmpics = Array(hyqmpic)
	 case 2
	  hyqmpics = Array(hyqmpic,hyqmpic2)
	  	  case 3
	  hyqmpics = Array(hyqmpic,hyqmpic2,hyqmpic3)
	  	  case 4
	  hyqmpics = Array(hyqmpic,hyqmpic2,hyqmpic3,hyqmpic4)
	  	  case 5
	  hyqmpics = Array(hyqmpic,hyqmpic2,hyqmpic3,hyqmpic4,hyqmpic5)
	  case 6
	  hyqmpics = Array(hyqmpic,hyqmpic2,hyqmpic3,hyqmpic4,hyqmpic5,hyqmpic6)
	  end select
      %>