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
		后台管理
	</title>
</head>

<body>
<%@include file="top.jsp"%>
<%if(user == null){%>
<script>alert('您没有登录，请登录后访问!');location.href='index.jsp'</script>
<%}else if (user.getUsertype() == 0){%>
<script>alert('抱歉，您不是管理员，无法进入该后台');location.href='index.jsp'</script>
<%}else {%>

<h3 class="text-center">栏目管理</h3>

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
        	<th class="text-center">栏目名</th>
            <th class="text-center">操作</th>
        </tr>
		<%for (int c = 0;c<topicList.size();c++){%>
		<form action="/TopicUpdateServlet">
		  <tr>
            <td>
				<input type="hidden" value="<%=topicList.get(c).getTopicid()%>" name="tid">
				<input class="form-control" value="<%=topicList.get(c).getTopicname()%>" name="tname">
			</td>
            <td>
	            <button class="btn btn-info" type="submit">修改</button>
				<%if(topicList.get(c).getTopicid()>4){%>
					<a href="/TopicDeleteServlet?tid=<%=topicList.get(c).getTopicid()%>" class="btn btn-danger" type="submit">删除</a>
				<%}%>
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