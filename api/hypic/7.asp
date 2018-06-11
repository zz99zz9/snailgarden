<%set hygmpic=server.createobject("scripting.dictionary")
set hygmpic2=server.createobject("scripting.dictionary")
set hygmpic3=server.createobject("scripting.dictionary")
set hygmpic4=server.createobject("scripting.dictionary")
set hygmpic5=server.createobject("scripting.dictionary")
set hygmpic6=server.createobject("scripting.dictionary")

set rs1=server.CreateObject("adodb.recordset")
     sql1="select count(*) as counts from [g-img] where fid="&rs("uid")&" and jg=7"
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

hygmpic.add "img",p1pic
hygmpic.add "tit",p1tit
hygmpic2.add "img",p2pic
hygmpic2.add "tit",p2tit
hygmpic3.add "img",p3pic
hygmpic3.add "tit",p3tit
hygmpic4.add "img",p4pic
hygmpic4.add "tit",p4tit
hygmpic5.add "img",p5pic
hygmpic5.add "tit",p5tit
hygmpic6.add "img",p6pic
hygmpic6.add "tit",p6tit
	 select case ii 
	 case 0 
	 hygmpics = Array()
	 case 1
	 hygmpics = Array(hygmpic)
	 case 2
	  hygmpics = Array(hygmpic,hygmpic2)
	  	  case 3
	  hygmpics = Array(hygmpic,hygmpic2,hygmpic3)
	  	  case 4
	  hygmpics = Array(hygmpic,hygmpic2,hygmpic3,hygmpic4)
	  	  case 5
	  hygmpics = Array(hygmpic,hygmpic2,hygmpic3,hygmpic4,hygmpic5)
	  case 6
	  hygmpics = Array(hygmpic,hygmpic2,hygmpic3,hygmpic4,hygmpic5,hygmpic6)
	  end select
      %>