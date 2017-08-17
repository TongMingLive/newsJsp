$(document).ready(function(e) {
	$(':checkbox').radiocheck();
	$(".rig_btn").click(function(){location.href='register.jsp'});
	$("body").append('<!-- 底部自动生成 -->'+
        '<footer class="bottom">'+
			'<div class="container text-center">'+
				'<hr/>'+
			'<div class="row footer">'+
			'</div>'+
				'<a>关于我们</a><b style="margin: 10px">|</b>' +
				'<a href="#" data-toggle="modal" data-target="#myModal">后台管理</a><b style="margin: 10px">|</b>' +
				'<a href="http://www.miitbeian.gov.cn/" target="_blank">赣ICP备16004902号-1</a>'+
				'<hr/>'+
			'</div>'+
        '</footer>'
	);
	
	/*gps active判断开始*/
	//alert(window.location.host); //获取协议    localhost:8080
	//alert(window.location.protocol); //获取请求协议    http:
	//alert(window.location.href); //获取整个url   http://localhost:8080/news/newspage/1xxx.jsp
	var p = window.location.protocol.length+2; //获取到   http:// 的长度
	var pl = window.location.host.length+p+7;//真实地址不一致 上线务必更改此步逻辑
	var pl2 = window.location.host.length+p+15;
	var h = window.location.href;
	var s = h.substring(pl,pl+1);   // 取子字符串。
	var sn = h.substring(pl2,pl2+1);
	if(s == "#" || s == "i" || s == ""){
		$("#gps li").eq(0).attr("class","active");
	}else if(sn!=null && !isNaN(sn)){
		$("#gps li").eq(sn).attr("class","active");
	}
	/*gps active判断结束*/
});

//头部登陆表单验证
function validateName(){
	//用户名不能为空验证
	var name=$("[name=uname]").eq(0).val();			
	if(name==""){
		alert("用户名不能为空");
		return false;
	}			
	return true;
}		
function validatePwd(){
	//验证密码
	var pwd=$("[name=upwd]").eq(0).val();
	if(pwd.length<5){
		alert("密码长度必须大于4位");
		return false;
	}
	return true;
}		
function validate(){
	if(validateName()&&validatePwd()){
		return true;
	}else{
		return false;
	}
}
