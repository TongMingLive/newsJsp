<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.bean.Users" %>
<%@ page import="com.news.dao.CommentsDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	Users user = (Users)session.getAttribute("users");
	if(user!=null){
		String cid = request.getParameter("cid");
		if(cid!=null){
			int id = Integer.parseInt(cid);
			CommentsDao commentsDao = new CommentsDao();
			int row = commentsDao.deleteComments(id);
			if(row!=0){%>
				<script>alert('删除成功');</script>
				<%String url = request.getHeader("REFERER");
				response.sendRedirect(url);	
			}else{%>
				<script>alert('删除评论出现未知错误，请再试一次');location.href="-1"</script>
			<%}
		}else{%>
			<script>location.href='index.jsp'</script>
		<%}
	}else{%>
		<script>location.href='index.jsp'</script>
	<%}
%>
