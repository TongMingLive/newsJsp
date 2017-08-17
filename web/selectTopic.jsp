<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.dao.NewsDao" %>
<%@ page import="com.news.bean.News" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		Nature新闻网 每日科技推送，每日IT新闻——让你站在科技的前沿！
	</title>
</head>

<body>
<%@include file="top.jsp"%>
<!--Start News push-->

<%
  response.setContentType("text/html");
  response.setCharacterEncoding("utf-8");
  request.setCharacterEncoding("utf-8");

  List<News> list = new ArrayList<>();
  if (tid == null){%>
<script>location.href='index.jsp'</script>
  <%}else {
    int topicId = Integer.parseInt(tid);
    NewsDao newsDao = new NewsDao();
    list = newsDao.selectNewsByType(topicId);
    String pages = request.getParameter("page");
    int pag = Integer.parseInt(pages);
  %>

  <div style="margin: 20px;text-align: center" class="row">
    <h5><%=topicList.get(pag).getTopicname()%></h5>
    <div class="col-md-10">
      <%if (list.size() == 0){%>
      <h6>暂无该板块内容</h6>
      <%}else {
        for (int i=0;i<list.size();i++){%>
      <h6>
        <a href="newsread.jsp?nid=<%=list.get(i).getNewsid()%>&tid=<%=tid%>" title="<%=list.get(i).getNewstitle()%>"><%=list.get(i).getNewstitle()%></a>
        <span class='pull-right'><%=list.get(i).getNewstime().toString().substring(0,10)%></span>
        <span class='pull-right' style="margin-right: 20px"><%=list.get(i).getUsername()%></span>
      </h6>
      <%}}%>
    </div>
  </div>
<%}%>

<%@include file="linkScript.jsp"%>
<script>
    //根据屏幕大小限制新闻标题字符个数 移除部分省略号  … 表示
    function widthSize(){
        var width = document.body.clientWidth;
        $("div[class*='col-md-'] h6 a").each(function(){
            var maxwidth=0;//设置最大文字个数
            if(width<350){	maxwidth = 11;
            }else if(width<370){	maxwidth = 13;
            }else if(width<400){	maxwidth = 14;
            }else if(width<420){	maxwidth = 15;
            }else if(width<460){	maxwidth = 18;
            }else if(width>600){	maxwidth = 28;
            }else{	maxwidth = 15;}

            if($(this).text().length>maxwidth){
                $(this).text($(this).text().substring(0,maxwidth));
                $(this).html($(this).html()+"…");
            }
        });
    }
    window.onload = function(){
        widthSize();
        $(window).resize(function(){widthSize()});
    };
</script>
</body>
</html>