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
		IT新闻网 每日科技推送，每日IT新闻——让你站在科技的前沿！
	</title>
</head>

<body>
<%@include file="top.jsp"%>

<%
  NewsDao newsDao = new NewsDao();
  List<News> news0 = newsDao.selectNewsByType(12);
  List<News> news1 = newsDao.selectNewsByType(1);
  List<News> news2 = newsDao.selectNewsByType(2);
  List<News> news3 = newsDao.selectNewsByType(3);
  List<News> news4 = newsDao.selectNewsByType(4);
%>

<!--Start News push-->
<div style="margin:10px 2%;" class="row">
    <div class="col-md-8">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="http://qiniu.marvel.ac.cn/img/logo/102421-106.jpg" alt="test1">
              <div class="carousel-caption" style="margin-bottom: 10px">
                苹果宣称今年将进军生活家居产业，小米表示欲哭无泪<br>
              </div>
            </div>
            <div class="item">
              <img src="http://qiniu.marvel.ac.cn/img/logo/112572-106.jpg" alt="test2">
              <div class="carousel-caption" style="margin-bottom: 10px">
                微软表示今年九月与各大高校达成合作协议<br>
              </div>
            </div>
          </div>

          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        <!--End News push-->
        <div style="background:#ecf0f1;padding:10px;border-radius:5px;margin-top: 10px">
            <a href="selectTopic.jsp?tid=12&page=0">
                <h5>综合<span class='label label-danger pull-right'>MORE</span></h5>
            </a>
            <%for (int d=0;d<12;d++){%>
            <h6>
                <a href="newsread.jsp?nid=<%=news0.get(d).getNewsid()%>&tid=<%=news0.get(d).getNewstype()%>" title="<%=news0.get(d).getNewstitle()%>"><%=news0.get(d).getNewstitle()%></a>
                <span class='pull-right'><%=news0.get(d).getNewstime().toString().substring(0,10)%></span>
            </h6>
            <%}%>
        </div>
    </div>
    <div class="col-md-4">
        <a href="selectTopic.jsp?tid=1&page=1">
            <h5><%=topicList.get(1).getTopicname()%><span class='label label-danger pull-right'>MORE</span></h5>
        </a>
        <%for (int a=0;a<4;a++){%>
        <h6>
            <a href="newsread.jsp?nid=<%=news1.get(a).getNewsid()%>&tid=<%=news1.get(a).getNewstype()%>" title="<%=news1.get(a).getNewstitle()%>"><%=news1.get(a).getNewstitle()%></a>
            <span class='pull-right'><%=news1.get(a).getNewstime().toString().substring(0,10)%></span>
        </h6>
        <%}%>
        <a href="selectTopic.jsp?tid=2&page=2">
            <h5><%=topicList.get(2).getTopicname()%><span class='label label-danger pull-right'>MORE</span></h5>
        </a>
        <%for (int b=0;b<4;b++){%>
        <h6>
            <a href="newsread.jsp?nid=<%=news2.get(b).getNewsid()%>&tid=<%=news2.get(b).getNewstype()%>" title="<%=news2.get(b).getNewstitle()%>"><%=news2.get(b).getNewstitle()%></a>
            <span class='pull-right'><%=news2.get(b).getNewstime().toString().substring(0,10)%></span>
        </h6>
        <%}%>
        <a href="selectTopic.jsp?tid=3&page=3">
            <h5><%=topicList.get(3).getTopicname()%><span class='label label-danger pull-right'>MORE</span></h5>
        </a>
        <%for (int c=0;c<4;c++){%>
        <h6>
            <a href="newsread.jsp?nid=<%=news3.get(c).getNewsid()%>&tid=<%=news3.get(c).getNewstype()%>" title="<%=news3.get(c).getNewstitle()%>"><%=news3.get(c).getNewstitle()%></a>
            <span class='pull-right'><%=news3.get(c).getNewstime().toString().substring(0,10)%></span>
        </h6>
        <%}%>
        <a href="selectTopic.jsp?tid=4&page=4">
            <h5><%=topicList.get(4).getTopicname()%><span class='label label-danger pull-right'>MORE</span></h5>
        </a>
        <%for (int d=0;d<4;d++){%>
        <h6>
            <a href="newsread.jsp?nid=<%=news4.get(d).getNewsid()%>&tid=<%=news4.get(d).getNewstype()%>" title="<%=news4.get(d).getNewstitle()%>"><%=news4.get(d).getNewstitle()%></a>
            <span class='pull-right'><%=news4.get(d).getNewstime().toString().substring(0,10)%></span>
        </h6>
        <%}%>
    </div>
</div>
<!--Strat news-->

<div style="margin:20px 5%;" class="row">
	<div class="col-md-2" style="padding-top:10px">

    </div>

</div>
<!--END news-->

<%@include file="linkScript.jsp"%>
<script>
    //根据屏幕大小限制新闻标题字符个数 移除部分省略号  … 表示
    function widthSize(){
        var width = document.body.clientWidth;
        $("div[class*='col-md-'] h6 a").each(function(){
            var maxwidth=0;//设置最大文字个数
            if(width<350){	maxwidth = 10;
            }else if(width<370){	maxwidth = 12;
            }else if(width<400){	maxwidth = 13;
            }else if(width<420){	maxwidth = 14;
            }else if(width<460){	maxwidth = 17;
            }else if(width>600 && width<992){	maxwidth = 27;
            }else if(width>991 && width<1100){	maxwidth = 11;
            }else{	maxwidth = 14;}

            if($(this).text().length>maxwidth){
                $(this).text($(this).text().substring(0,maxwidth));
                $(this).html($(this).html()+"…");
            }
        });
    }
    $(document).ready(function(){
        widthSize();
        $(window).resize(function(){widthSize()});
    });
</script>
</body>
</html>