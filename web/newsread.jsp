<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.bean.News" %>
<%@ page import="com.news.bean.Comments" %>
<%@ page import="com.news.dao.NewsDao" %>
<%@ page import="com.news.dao.CommentsDao" %>
<%
	News news = new News();
	NewsDao newsDao = new NewsDao();
	List<List<News>> newsList = new ArrayList<List<News>>();
	newsList.add(newsDao.selectNewsByType(1));
	newsList.add(newsDao.selectNewsByType(2));
	newsList.add(newsDao.selectNewsByType(3));
	newsList.add(newsDao.selectNewsByType(4));

	String nid = request.getParameter("nid");
	int count = 0;
	
	if(nid != null){
		int id = Integer.parseInt(nid);
		news = newsDao.selectNewsById(id);
		newsDao.updateNewsReadnum(id);
	}else{%>

		out.println("<script>location.href='index.jsp'</script>");
<%	}

	int num = 0;
	CommentsDao commentsDao = new CommentsDao();
	List<Comments> commentsList = new ArrayList<>();
	if(nid != null){
		int id = Integer.parseInt(nid);
		commentsList= commentsDao.selectNewsComments(id);
		num = commentsDao.selectNewsCommentsCount(id);
	}
	
	/*pageContext.setAttribute("news", news);
	pageContext.setAttribute("nid", nid);
	pageContext.setAttribute("count", count);
	pageContext.setAttribute("commList", commList);*/
%>
<!DOCTYPE HTML>
<html>
  <head>
	<%@include file="linkCss.jsp"%>
	
	<title>
		<%=news.getNewstitle()%>
	</title>

<style>
ul li{list-style:none}
p span{ margin-right:10px}
pre{ 
	background-color:transparent;
	border:none;white-space: pre-wrap;
	word-wrap: break-word;
	font-size:1em}
.modal_align{
display: table;
height: 100%;
margin: 0px auto
}
</style>

</head>

<body>
<%@include file="top.jsp"%>
<!--Strat news-->
<div style="margin:0px 3%" class="row">
	<div class="col-md-3 visible-md-block visible-lg-block">
    <%for(int j = 0;j<4;j++){%>
		<h5><%=topicList.get(j).getTopicname()%><span class='label label-danger pull-right'>NEW</span></h5>

   		<%for(int l = 0;l<4;l++){%>
       			<h6><a href='newsread.jsp?nid=<%=newsList.get(j).get(l).getNewsid()%>' title='<%=newsList.get(j).get(l).getNewstitle()%>'><%=newsList.get(j).get(l).getNewstitle()%></a><span class='pull-right'><%=newsList.get(j).get(l).getNewstime().toString().substring(0,10)%></span></h6>
	<%}}%>
    </div>
    <div class="col-md-9"  style="background:#ecf0f1;padding:5px 10px 10px;margin-top:-15px;margin-bottom:20px;border-radius:3px">
    	
        <h4 class="text-center"><%=news.getNewstitle()%></h4>
        <p class="text-center">
        	<b>作者：</b>
        	<span><%=news.getUsername()%></span>
        	<b>时间：</b>
        	<span><%=news.getNewstime()%></span>
			<b>阅读量：</b>
			<span><%=news.getNewsreadnum()+1%></span>
        </p>
		<img src="img/102421-106.jpg" alt="<%=news.getNewstitle()%>" class="img-responsive center-block">
        <pre><%=news.getNewspage()%></pre>
        
        <p><span class="label label-primary">发布评论</span></p>
        <%if (user == null){%>
            <p>
        	    您还未登陆，请
        	  <a href='#' data-toggle='modal' data-target='#myModal'>登陆</a>
        	    后参与评论
        	</p>
		<%}else{%>
          	<p>&nbsp;<%=user.getUsername()%></p>
			<form action="/InsertCommentsServlet">
				<input type="hidden" name="nid" value="<%=nid%>">
				<input type="hidden" name="uid" value="<%=user.getUserid()%>">
	           	<textarea class="form-control" rows="8" placeholder="由此输入评论" name="content"></textarea>
	           	<p class="help-block">评论最多输入500个字，请务必遵守相关法律法规</p>
	        	<button type="submit" class="btn btn-info pull-right">发表</button>
	        </form>
        <%}%>
        
        <p><span class="label label-primary">网友评论</span></p>
        <p style='color:#666'>全部评论(<b><%=num%></b>)</p>
        
        <%if (num == 0){%>
			<p>暂无评论，小伙伴们快来抢沙发吧~~~</p>
		<%}else{%>
		  	<table class="table table-condensed table-hover table-responsive">
		  	  <%for (int k = 0;k<commentsList.size();k++){%>
		  	  	<tr>
					<td>
						<a href="#">
							<img style="margin-top: 13px" class="img-circle center-block"
								 src="img/user.png" alt="<%=commentsList.get(k).getUserName()%>" width="90" height="90">
						</a>
					</td>
					<td>
						<h6>
							<span>“<%=commentsList.get(k).getUserName()%>”&nbsp;</span>
							<span>评论时间：<%=commentsList.get(k).getCommentstime()%></span>
						</h6>
				     <pre style="padding:0!important"><%=commentsList.get(k).getCommentspage()%></pre>
				     <%if (user != null){%>
				       <p class='text-right'>
				       <%if (user.getUsername().equals(commentsList.get(k).getUserName()) || user.getUsertype() == 1 ){%>
					       <button type='button' class='btn btn-danger btn-sm' 
					         data-toggle='modal' data-target='#deletemod<%=commentsList.get(k).getCommentsid()%>a'
					         data-target="bs-example-modal-sm">
								删除
					       </button>
					   <%}else {%>
					       <button type="button" class="btn btn-success btn-sm" 
						     data-toggle='modal' data-target='#deletemod<%=commentsList.get(k).getCommentsid()%>b'>
								回复
					       </button>
					   <%}%>
				       </p>
				     <%}%>
				  </td>
				</tr>
				<%if (user != null){%>
					<div class="modal bs-example-modal-sm" id="deletemod<%=commentsList.get(k).getCommentsid()%>a"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
						  <div class="modal-content">
							<div class="modal-header">
							  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							  <h5 class="modal-title" id="myModalLabel">提示：</h5>
							</div>
							<div class="modal-body">
								确定删除该条评论？
							</div>
							<div class="modal-footer">
							  <form action="commDele.jsp">
								<input type="text" value="<%=commentsList.get(k).getCommentsid()%>" hidden="hidden" name="cid"/>
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-primary">确定</button>
							  </form>
							</div>
						  </div>
						</div>
					  </div>

					  <div class="modal bs-example-modal-sm" id="deletemod<%=commentsList.get(k).getCommentsid()%>b" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						 <div class="modal-dialog">
						   <div class="modal-content">
							 <div class="modal-header">
							   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								 <h4 class="modal-title" id="myModalLabel2">回复评论：</h4>
							  </div>
							  <form action="/InsertCommentsServlet">
							  <div class="modal-body">
								<textarea class="form-control" rows="8" name="content">回复<%=commentsList.get(k).getUserName()%>：</textarea>
							  </div>
							  <div class="modal-footer">
								<input type="hidden" name="nid" value="<%=nid%>">
								<input type="hidden" name="uid" value="<%=user.getUserid()%>">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-primary">回复</button>
							  </div>
							  </form>
							</div>
						  </div>
					  </div>
				<%}}%>
		  	</table>
		  <%}%>
	</div>
</div>
<!--END news-->

<%@include file="linkScript.jsp"%>
<script>
//根据屏幕大小限制新闻标题字符个数 移除部分省略号  … 表示
function widthSize(){
	var width = document.body.clientWidth;
	$("div[class*='col-md-'] h6 a").each(function(){
		var maxwidth=10;//设置最大文字个数
		
		if($(this).text().length>maxwidth){
			$(this).text($(this).text().substring(0,maxwidth));
			$(this).html($(this).html()+"…");
		}
	});
}
$(document).ready(function(){
	widthSize();
	$(window).resize(function(){widthSize()});
	$(".modal fade").on("hidden.bs.modal", function() {
    $(this).removeData("bs.modal");
});
});
</script>
</body>
</html>