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
		修改密码
	</title>
	
</head>

<body>
<%@include file="top.jsp"%>
<%if(user == null){%>
<script>alert('您没有登录，请登录后访问!');location.href='index.jsp'</script>
<%}else {%>
<div class="row" style="margin:20px 20px 0px 20px">
	<div class="col-md-2"><h3>密码修改</h3></div>
    <div class="col-md-6" style="margin-top:20px">
    	<form action="UserPasswordUpdateServlet" id="register">
            <input value="<%=user.getUserid()%>" type="hidden" name="uid"/>
            <div class="form-group has-feedback">
                <label for="exampleInputPsw">原密码</label>
                <input type="password"class="form-control" rows="8" name="exampleInputPsw" placeholder="请输入原密码">
                <p class="help-block">密码长度6-15位</p>
            </div>
          <div class="form-group has-feedback">
            <label for="exampleInputPsw">新密码</label>
            <input type="password"class="form-control" rows="8" name="exampleInputPsw1" placeholder="请输入新密码">
            <p class="help-block">密码长度6-15位</p>
          </div>
          <div class="form-group has-feedback">
            <label for="exampleInputPsw">确认密码</label>
            <input type="password"class="form-control" rows="8" name="exampleInputPsw2" placeholder="请再次输入新密码">
            <p class="help-block"></p>
          </div>

          <button type="submit" class="btn btn-info">修改</button>
        </form>
    </div>
</div>

<%@include file="linkScript.jsp"%>
<script>
//用户注册表单验证
function checkOld(){
    var obj = $("input[name=exampleInputPsw]");
    obj.find("~span").remove();
    if(obj.val()=="" || obj.val().length<6 || obj.val().length>15 ){obj.parent().removeClass("has-warning");
        obj.parent().removeClass("has-success");obj.parent().addClass("has-error");
        obj.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'+
            '<span id="inputError2Status" class="sr-only">(error)</span>');
        return false;
    }else if(obj.val() != <%=user.getUserpassword()%>){
        obj.parent().removeClass("has-success");obj.parent().addClass("has-error");
        obj.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'+
            '<span id="inputError2Status" class="sr-only">(error)</span>');
        return false;
    }else{obj.parent().removeClass("has-error");obj.parent().addClass("has-success");
        obj.parent().removeClass("has-warning");
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

	$("input[name=exampleInputPsw]").bind('input propertychange', function() {
		checkOld();
	});
	$("input[name=exampleInputPsw1]").bind('input propertychange', function() {
		checkPasw();
	});
	$("input[name=exampleInputPsw2]").bind('input propertychange', function() {
		checkPas();
	});
	
	$("#register").submit(function(){
		if(checkOld()&checkPasw()&checkPas()){
			return true;	
		}else{
			return false;
		}
	});
	
	$("input[name=exampleInputPsw],input[name=exampleInputPsw1],input[name=exampleInputPsw2]").click(
		function(e) {$(this).select();}
	);
});
</script>
<%}%>
</body>
</html>