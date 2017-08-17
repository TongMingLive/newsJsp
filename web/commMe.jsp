<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.dao.CommentsDao" %>
<%@ page import="com.news.bean.Comments" %>
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
<%	CommentsDao commentsDao = new CommentsDao();
	List<Comments> commentsList = new ArrayList<>();
	if(user == null){%>
<script>alert('您没有登录，请登录后访问!');location.href='index.jsp'</script>
<%}else {
	    if (user.getUsertype() == 0){
			commentsList = commentsDao.selectAllUserComments(user.getUserid());
  		}else {
			commentsList = commentsDao.selectAllComments();
%>
<h3 class="text-center">评论管理</h3>

<div class="row" style="margin:3% 5% 50px">
	<div class="col-md-10">
		<table class="table table-hover">
			<tr>
				<th>评论内容</th>
				<th>评论人</th>
				<th>评论时间</th>
				<th>操作</th>
			</tr>
			<%for (int c = 0;c<commentsList.size();c++){%>
			<tr>
				<td><a href="newsread.jsp?nid=<%=commentsList.get(c).getNewsid()%>"><%=commentsList.get(c).getCommentspage()%></a></td>
				<td><%=commentsList.get(c).getUserName()%></td>
				<td><%=commentsList.get(c).getCommentstime().toString().substring(0,10)%></td>
				<td>
					<a href="#" data-toggle='modal' data-target='#deletemod<%=commentsList.get(c).getCommentsid()%>'>
						删除
					</a>
					<div class="modal bs-example-modal-sm" id="deletemod<%=commentsList.get(c).getCommentsid()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="myModalLabel">提示：</h4>
								</div>
								<div class="modal-body">
									确定删除该条评论？<br/><br/>"<%=commentsList.get(c).getCommentspage()%>"
								</div>
								<div class="modal-footer">
									<form action="commDele.jsp">
										<input type="text" value="<%=commentsList.get(c).getCommentsid()%>" hidden="hidden" name="cid"/>
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
<%}}%>
<%@include file="linkScript.jsp"%>
</body>
</html>