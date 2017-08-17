<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.dao.UserDao" %>
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
		后台管理
	</title>
</head>

<body>
<%@include file="top.jsp"%>
<%if(user == null){%>
<script>alert('您没有登录，请登录后访问!');location.href='index.jsp'</script>
<%}else if (user.getUsertype() != -1){%>
<script>alert('抱歉，您不是超级管理员，无法进入该后台');location.href='index.jsp'</script>
<%}else {
	UserDao userDao = new UserDao();
	List<Users> usersList = userDao.selectAllUsers();
%>

<h3 class="text-center">权限管理</h3>

<div class="row" style="margin:3% 5% 50px">
	<div class="col-md-2 text-center" style="background:#ecf0f1; padding:14px 0px 5px; border-radius:3px">
		<p><a href="admin.jsp">编辑新闻</a></p>
		<p><a href="newspush.jsp">添加新闻</a></p>
		<p><a href="topicpush.jsp">添加主题</a></p>
		<p><a href="topicUpdate.jsp">编辑主题</a></p>
	</div>
	<div class="col-md-10">
  	  <table class="table table-hover text-center">
    	<tr>
        	<th class="text-center">id</th>
			<th class="text-center">用户名</th>
			<th class="text-center">权限</th>
            <th class="text-center">操作</th>
        </tr>
		<%for (int c = 1;c<usersList.size();c++){%>
		<form action="/UserTypeUpdateServlet">
		  <tr>
			<td>
				<input type="hidden" value="<%=usersList.get(c).getUserid()%>" name="uid">
				<%=usersList.get(c).getUserid()%>
			</td>
            <td>
				<%=usersList.get(c).getUsername()%>
			</td>
			<td>
				<select class="form-control" name="type">
					<%if (usersList.get(c).getUsertype() == 1){%>
					<option value="0">用户</option>
					<option value="1" selected="selected">管理员</option>
					<%}else {%>
					<option value="0" selected="selected">用户</option>
					<option value="1">管理员</option>
					<%}%>
				</select>
			</td>
            <td>
	            <button class="btn btn-info" type="submit">修改</button>
	        </td>
          </tr>
		</form>
		<%}%>
	  </table>
  </div>
</div>
<%}%>
<%@include file="linkScript.jsp"%>
</body>
</html>