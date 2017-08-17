<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//退出登陆  session失效
	session.invalidate();
	String url = request.getHeader("REFERER");
	response.sendRedirect(url);
%>