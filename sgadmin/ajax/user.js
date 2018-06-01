$(".save").click(function(){

update();
});
/////////////
function update(){


    rname=$("#rname").val();
	rtel=$("#rtel").val();
    id=$("#id").val();
    action=$("#action").val();



console.log(action);

  $.post("ajax/user.asp",{
rname:rname,
rtel:rtel,
id:id,
action:action
	  },
	  
    function(data,status){
	  if(status=="success"){
	//	  console.log(data);
		   if(data=="add"){

		  location.href='user_List.Asp?sta=add'
		  }else if(data=="mod"){

			  location.href='user_List.Asp?sta=mod'
			  }else if(data=="del"){

			  location.href='user_List.Asp?sta=del'
		  }
		/* */

		  }
    });
}