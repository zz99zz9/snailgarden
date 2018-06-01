$(".save").click(function(){

update();
});
/////////////
function update(){
uid=$("#uid").val();
action=$("#action").val();
    p1txt=$("#p1txt").val();
	p1pic=$("#p1pic").val();
    p2txt=$("#p2txt").val();
    p2pic=$("#p2pic").val();
	p3txt=$("#p3txt").val();
    p4txt=$("#p4txt").val();
    p4pic=$("#p4pic").val();
    p4pic1=$("#p4pic1").val();
    p5txt=$("#p5txt").val();
    p6txt=$("#p6txt").val();
    p7txt=$("#p7txt").val();
    p8txt=$("#p8txt").val();
    p9txt=$("#p9txt").val();
	

console.log(action);

  $.post("ajax/garden.asp",{
      uid:uid,
      action:action,
      p1txt:p1txt,
      p1pic:p1pic,
      p2txt:p2txt,
      p2pic:p2pic,
      p3txt:p3txt,
      p4txt:p4txt,
      p4pic:p4pic,
      p4pic1:p4pic1,
      p5txt:p5txt,
      p6txt:p6txt,
      p7txt:p7txt,
      p8txt:p8txt,
      p9txt:p9txt
	  },
	  
    function(data,status){
	  if(status=="success"){
	//	  console.log(data);
		   if(data=="add"){

		  location.href='garden_List.Asp?sta=add'
		  }else if(data=="mod"){

			  location.href='garden_List.Asp?sta=mod'
			  }else if(data=="del"){

			  location.href='garden_List.Asp?sta=del'
		  }
		/* */

		  }
    });
}