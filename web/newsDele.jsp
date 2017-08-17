<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.bean.Users" %>
<%@ page import="com.news.dao.NewsDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	Users user = (Users)session.getAttribute("users");
	if(user!=null){
		String id = request.getParameter("nid");
		if(user.getUsertype() == 1){
			int nid = Integer.parseInt(id);
			NewsDao newsDao = new NewsDao();
			int row = newsDao.deleteNews(nid);
			if(row!=0){%>
				<script>alert('删除成功！');location.href='admin.jsp'</script>
<%			}else{%>
				<script>alert('新闻删除出现未知错误，请再试一次');</script>
<%			}
		}else{%>
			<script>location.href='index.jsp'</script>
<%		}
	}else{%>
		<script>location.href='index.jsp'</script>
<%	}%>
