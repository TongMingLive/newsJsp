<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <%@include file="linkCss.jsp"%>
	<title>
		账户注册
	</title>
	
</head>

<body>
<%@include file="top.jsp"%>
<div class="row" style="margin:20px 20px 0px 20px">
	<div class="col-md-2"><h3>用户注册</h3></div>
    <div class="col-md-6" style="margin-top:20px">
    	<form action="RegisterServlet" id="register">
    	
          <div class="form-group has-feedback">
            <label for="exampleInputTitle">用户名</label>
            <input type="text" class="form-control" name="exampleInputName" placeholder="请输入用户名">
            <p class="help-block">只能输入字母或数字，6-20个字符</p>
          </div>
          <div class="form-group has-feedback">
            <label for="exampleInputPsw">密码</label>
            <input type="password"class="form-control" rows="8" name="exampleInputPsw1" placeholder="请输入密码">
            <p class="help-block">密码长度6-15位</p>
          </div>
          <div class="form-group has-feedback">
            <label for="exampleInputPsw">确认密码</label>
            <input type="password"class="form-control" rows="8" name="exampleInputPsw2" placeholder="请再次输入密码">
            <p class="help-block"></p>
          </div>

          <button type="submit" class="btn btn-info">我同意以下条款并提交</button>
          <div class="alert alert-success">
			Nature新闻网内所有内容并不反映任何Nature新闻网及其所属公司之意见及观点，
			Nature新闻网所转载、链接的内容，出于传递更多信息之目的，
			并不意味着赞同其观点或证实其内容真实性，请各位用户审慎判别使用。
		  </div>
        </form>
    </div>
</div>

<%@include file="linkScript.jsp"%>
<script>
//用户注册表单验证
function checkName(){
	var reg = /[0-9a-zA-Z]{4,16}/;
	var obj = $("input[name=exampleInputName]");
	obj.find("~span").remove();
	if(obj.val()=="" || !reg.test(obj.val()) || obj.val().length<6 || obj.val().length>20){obj.parent().removeClass("has-success");obj.parent().addClass("has-error");
		obj.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'+
 				  '<span id="inputError2Status" class="sr-only">(error)</span>');
 		return false;
 	}else{obj.parent().removeClass("has-error");obj.parent().addClass("has-success");
 		obj.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>'+
  				  '<span id="inputSuccess2Status" class="sr-only">(success)</span>');
 		return true;
 	}
}
function checkPasw(){
	var obj = $("input[name=exampleInputPsw1]");
	obj.find("~span").remove();
	if(obj.val()=="" || obj.val().length<6 || obj.val().length>15){obj.parent().removeClass("has-warning");
		obj.parent().removeClass("has-success");obj.parent().addClass("has-error");
		obj.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'+
 				  '<span id="inputError2Status" class="sr-only">(error)</span>');
 		return false;
 	}else if(obj.val().length<10){obj.parent().removeClass("has-success");
 		obj.parent().removeClass("has-error");obj.parent().addClass("has-warning");
 		obj.after('<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>'+
  				  '<span id="inputWarning2Status" class="sr-only">(warning)</span>');
  		return true;
 	}else{obj.parent().removeClass("has-error");obj.parent().addClass("has-success");
 		obj.parent().removeClass("has-warning");
 		obj.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>'+
  				  '<span id="inputSuccess2Status" class="sr-only">(success)</span>');
 		return true;
 	}
}
function checkPas(){
	var obj1 = $("input[name=exampleInputPsw1]");
	var obj2 = $("input[name=exampleInputPsw2]");
	obj2.find("~span").remove();
	if(obj2.val()=="" || obj1.val()!=obj2.val() ){obj2.parent().removeClass("has-success");obj2.parent().addClass("has-error");
		obj2.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'+
 				  '<span id="inputError2Status" class="sr-only">(error)</span>');
 		return false;
 	}else{obj2.parent().removeClass("has-error");obj2.parent().addClass("has-success");
 		obj2.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>'+
  				  '<span id="inputSuccess2Status" class="sr-only">(success)</span>');
 		return true;
 	}
}

$(document).ready(function(e){

	$("input[name=exampleInputName]").bind('input propertychange', function() {
		checkName();
	});
	$("input[name=exampleInputPsw1]").bind('input propertychange', function() {
		checkPasw();
	});
	$("input[name=exampleInputPsw2]").bind('input propertychange', function() {
		checkPas();
	});
	
	$("#register").submit(function(){
		if(checkName()&checkPasw()&checkPas()){
			return true;	
		}else{
			return false;
		}
	});
	
	$("input[name=exampleInputName],input[name=exampleInputPsw1],input[name=exampleInputPsw2]").click(
		function(e) {$(this).select();}
	);
});
</script>
</body>
</html>