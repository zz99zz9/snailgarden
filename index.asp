<%name=Request(name)%>
<%if name="name" then%>
<%=name%>-1
<%else%>
<%=name%>-2
<%end if%>
wx.request({
  url: 'https://snailgarden.shxgwl.com/',
  data: {name:"111",password:"123",id:"123"},
  method: 'post', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
  // header: {}, // 设置请求的 header
 // dataType:JSON,//该语句会将服务器端的数据自动转为string类型
  success: function(res){
    // success
     
    console.log("返回数据为："+res.data.employees[1].firstName);
    console.log('submit success');
  },
  fail: function() {
    // fail
    console.log('submit fail');
  },
  complete: function() {
    // complete
    console.log('submit comlete');
  }
})