<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <%@include file="linkCss.jsp" %>
    <title>
        添加主题
    </title>

</head>

<body>
<%@include file="top.jsp" %>
<%

%>
<!-- 没有登录不能访问 -->
<%if (user == null) {%>
<script>alert('您没有登录，请登录后访问!');
location.href = 'index.jsp'</script>
<%} else if (user.getUsertype() == 0) {%>
<script>alert('抱歉，您不是管理员，无法进入该后台');
location.href = 'index.jsp'</script>
<%} else {%>

<h3 class="text-center">添加主题</h3>

<div class="row" style="margin:3% 5% 50px">
    <div class="col-md-2 text-center" style="background:#ecf0f1; padding:14px 0px 5px; border-radius:3px">
        <p><a href="admin.jsp">编辑新闻</a></p>
        <p><a href="newspush.jsp">添加新闻</a></p>
        <p><a href="topicpush.jsp">添加主题</a></p>
        <p><a href="topicUpdate.jsp">编辑主题</a></p>
    </div>

    <form action="/TopicPushServlet">
        <div class="col-md-8">
            <input class="form-control" placeholder="请输入栏目名称" name="tname">
        </div>
        <div class="col-md-2">
                <button class="btn btn-info" type="submit">添加</button>
        </div>
    </form>
</div>

<%}%>

<%@include file="linkScript.jsp" %>
</body>
</html>