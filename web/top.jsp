<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.news.dao.TopicDao" %>
<%@ page import="com.news.bean.Topic" %>
<%@ page import="com.news.bean.Users" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //获取新闻标题
    TopicDao dao = new TopicDao();
    List<Topic> topicList = dao.selectAllTopic();
    Users user = (Users) session.getAttribute("users");
    String tid = request.getParameter("tid");
%>
<nav class="navbar navbar-default" id="navbar" role="navigation" style="border-radius:0px">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp"><img alt="Brand" src="http://qiniu.marvel.ac.cn/img/logo/NM%E9%80%8F%E5%BA%95%E9%BB%91.png" width="40" height="35"
                                                          style="margin:-4px -10px 0px 0px"></a>
            <a class="navbar-brand" href="index.jsp"><span style="color:#00ADEF">N</span>ature<span
                    style="color:#E70012">新</span>闻</a>
        </div>
        <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="gps" style="text-align:center;">
                <li><a href="index.jsp">首页<span class="sr-only">(current)</span></a></li>
                <%for (int i = 0; i < 3; i++) {
                    if ((i+1+"").equals(tid)){%>
                    <li class="active"><a href='selectTopic.jsp?tid=<%=topicList.get(i).getTopicid()%>&page=<%=i%>'><%=topicList.get(i).getTopicname()%></a></li>
                    <%}else {%>
                    <li><a href='selectTopic.jsp?tid=<%=topicList.get(i).getTopicid()%>&page=<%=i%>'><%=topicList.get(i).getTopicname()%></a></li>
                <%}}%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多 <b class="caret"></b></a>
                    <span class="dropdown-arrow"></span>
                    <ul class="dropdown-menu">
                        <%for (int j = 3; j < topicList.size(); j++) {%>
                        <li><a href='selectTopic.jsp?tid=<%=topicList.get(j).getTopicid()%>&page=<%=j%>'><%=topicList.get(j).getTopicname()%></a></li>
                        <%}%>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right" style="text-align:center;">
                <%if (user == null) {%>
                <li>
                    <button type='button' class='btn btn-info btn-sm text-right' data-toggle='modal'
                            data-target='#myModal' style='margin-top:8px'>
                        登陆&nbsp;<span class='glyphicon glyphicon-user'></span>
                    </button>
                    <button type='button' class='btn btn-primary btn-sm text-center rig_btn' style='margin-top:8px'>
                        注册&nbsp;<span class='glyphicon glyphicon-info-sign'></span>
                    </button>
                </li>
                <%} else {%>
                <li class='dropdown'>
                    <a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-expanded='false'>
                        <%=user.getUsername()%><span class='caret'></span>
                    </a>
                    <ul class='dropdown-menu' role='menu' style='text-align:center;'>
                        <li style='text-align:center;'>
                            <a href='commMe.jsp'>我的评论</a>
                        </li>
                        <%if (user.getUsertype() == 1 || user.getUsertype() == -1) {%>
                        <li style='text-align:center;'>
                            <a href='admin.jsp'>后台管理</a>
                        </li>
                        <li style='text-align:center;'>
                            <a href='newspush.jsp'>新闻发布</a>
                        </li>
                        <% if (user.getUsertype() == -1){%>
                        <li style='text-align:center;'>
                            <a href='userTypeUpdate.jsp'>用户授权</a>
                        </li>
                        <%}}%>
                        <li class='divider'></li>
                        <li style='text-align:center;'>
                            <a href='userPasswordUpdate.jsp'>修改密码</a>
                        </li>
                        <li style='text-align:center;'>
                            <a href='expLogin.jsp'>退出登陆</a>
                        </li>
                    </ul>
                </li>
                <%}%>
            </ul>

            <form class="navbar-form navbar-right" action="selectNews.jsp" role="search">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" name="key" id="navbarInput-01" type="search" placeholder="搜索">
                        <span class="input-group-btn">
                      <button type="submit" class="btn"><span class="fui-search"></span></button>
                    </span>
                    </div>
                </div>
            </form>

        </div>
    </div>
</nav>