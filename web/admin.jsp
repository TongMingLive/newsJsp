<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.dao.NewsDao" %>
<%@ page import="com.news.bean.News" %>
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
<%}else {
    NewsDao newsDao = new NewsDao();
    List<News> newsList = newsDao.selectNewsAll();
%>

<h3 class="text-center">后台管理</h3>

<div class="row" style="margin:3% 5% 50px">
  <div class="col-md-2 text-center" style="background:#ecf0f1; padding:14px 0px 5px; border-radius:3px">
	<p><a href="admin.jsp">编辑新闻</a></p>
  	<p><a href="newspush.jsp">添加新闻</a></p>
	<p><a href="topicpush.jsp">添加主题</a></p>
    <p><a href="topicUpdate.jsp">编辑主题</a></p>
  </div>
  <div class="col-md-10">
  	<table class="table table-hover">
    	<tr>
        	<th>新闻标题</th>
            <th>作者</th>
            <th>操作</th>
        </tr>
		<%for (int c = 0;c<newsList.size();c++){%>
		  <tr>
        	<td><a href="newsread.jsp?nid=<%=newsList.get(c).getNewsid()%>&tid=<%=newsList.get(c).getNewstype()%>"><%=newsList.get(c).getNewstitle()%></a></td>
            <td><b>作者：</b><span><%=newsList.get(c).getUsername()%></span></td>
            <td>
	            <a href="newsupdate.jsp?nid=<%=newsList.get(c).getNewsid()%>">修改</a>
	            <a href="#" data-toggle='modal' data-target='#deletemod<%=newsList.get(c).getNewsid()%>'>
	            	删除
	            </a>
	            <div class="modal bs-example-modal-sm" id="deletemod<%=newsList.get(c).getNewsid()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			      <div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				          <h4 class="modal-title" id="myModalLabel">提示：</h4>
				      </div>
				      <div class="modal-body">
			          	确定删除该条新闻？<br/><%=newsList.get(c).getNewstitle()%>
			          </div>
			          <div class="modal-footer">
					   <form action="newsDele.jsp">
					   	<input type="text" value="<%=newsList.get(c).getNewsid()%>" hidden="hidden" name="nid"/>
		                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		                <button type="submit" class="btn btn-primary">确定</button>
		               </form>
		              </div>
			        </div>
			      </div>
			    </div>
	        </td>
          </tr>
		<%}%>
	</table>
	
	<%--<!--Strat 分页-->
        <nav class="text-center">
          <ul class="pagination">
		  <c:choose>
		    <c:when test="${pageNum<=1}">
		      <li class="disabled">
		        <a href="admin.jsp?pageIndex=1" aria-label="Previous">
		          <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
		    </c:when>
		  	<c:otherwise>
		      <li>
		        <a href="admin.jsp?pageIndex=${pageNum-1}" aria-label="Next">
                  <span aria-hidden="true">&laquo;</span>
                </a>
		      </li>
		    </c:otherwise>
		  </c:choose>
		  
		  <c:forEach begin="1" end="${total}" var="f">
		    <c:choose>
		      <c:when test="${f == pageNum}">
		      	<li class="active"><a href="admin.jsp?pageIndex=${f}">${f}</a></li>
		      </c:when>
		      <c:otherwise>
		      	<li><a href="admin.jsp?pageIndex=${f}">${f}</a></li>
		      </c:otherwise>
		    </c:choose>
		  </c:forEach>
    	  
		  <c:choose>
		    <c:when test="${pageNum >= total}">
		      <li class="disabled">
                <a href="admin.jsp?pageIndex=${total}" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
		    </c:when>
		  	<c:otherwise>
		      <li>
			    <a href="admin.jsp?pageIndex=${pageNum+1}" aria-label="Previous">
			      <span aria-hidden="true">&raquo;</span>
			    </a>
			  </li>
		    </c:otherwise>
		  </c:choose>
          </ul>
        </nav>
    <!--END 分页-->  --%>
	
  </div>
</div>
<%}%>
<%@include file="linkScript.jsp"%>
</body>
</html>