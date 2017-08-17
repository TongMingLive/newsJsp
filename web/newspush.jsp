<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
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
		新闻发布
	</title>

</head>

<body>
<%@include file="top.jsp"%>
<%

%>
<!-- 没有登录不能访问 -->
<%if(user == null){%>
<script>alert('您没有登录，请登录后访问!');location.href='index.jsp'</script>
<%}else if (user.getUsertype() == 0){%>
<script>alert('抱歉，您不是管理员，无法进入该后台');location.href='index.jsp'</script>
<%}else {%>

<div class="row" style="margin:-20px 0 20px">
	<div class="col-md-2"><h3>新闻发布</h3></div>
    <div class="col-md-6" style="margin-top:20px">
    	<form action="NewsPushServlet" name="form2">
          <input type="hidden" name="uid" value="<%=user.getUserid()%>"/>
          <div class="form-group">
            <label>新闻主题</label>
            <select class="form-control" name="tid">
              <%for (int l = 0;l<topicList.size();l++){%>
            	<option value="<%=topicList.get(l).getTopicid()%>"><%=topicList.get(l).getTopicname()%></option>
              <%}%>
			</select>
            <label for="exampleInputTitle">新闻标题</label>
            <input type="text" class="form-control" name="title" placeholder="请输入新闻标题">
            <p class="help-block">请填写6字以上，20字以下标题</p>
          </div>
          <div class="form-group">
            <label for="exampleInputBody">新闻正文</label>
            <textarea class="form-control" rows="8" name="content" placeholder="请输入新闻正文"></textarea>
            <p class="help-block">请务必认真填写并遵守相关法律法规</p>
          </div>
          <div class="from-checkbox">
			<label class="checkbox" for="checkbox1">
			  <span class="icon"></span>
			  <span class="icon-to-fade"></span>
			  <input id="checkbox1" type="checkbox" value="true"/>
			  	我同意<a href="#">《新闻发布规则》</a>
			</label>
		  </div>
          <button type="submit" class="btn btn-info">发布</button>
        </form>
    </div>
</div>

<%}%>

<%@include file="linkScript.jsp"%>
</body>
</html>