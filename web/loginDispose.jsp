<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="com.news.dao.UserDao" %>
<%@ page import="com.news.bean.Users" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--处理页面 -->
<%	
	//取数据
	String name = request.getParameter("uname");
	String pwd = request.getParameter("upwd");
	String check = request.getParameter("check");

	UserDao dao = new UserDao();
	Users users = dao.loginUser(name,pwd);
	
	//逻辑判断
	if(users.getUserid()>0){
		//如果正确跳转到欢迎页面：重定向
		//response.sendRedirect("welcomelogin.jsp");
		//转发
		session.setAttribute("users", users);
		if (check == null || "".equals(check) || "null".equals(check)){
			String url1 = request.getHeader("REFERER");
			response.sendRedirect(url1);
		}else {
			response.sendRedirect("index.jsp");
		}
	}else{
		//如果错误跳转到错误页面
		//response.sendRedirect("errorlogin.jsp");
		//js弹窗跳转页面
	%>

			<script>
			alert('用户名或密码错误，请重新登陆');
			history.back();
			</script>
	<%}
%>