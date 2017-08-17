package com.news.servlet;

import com.news.bean.Users;
import com.news.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by tong- on 2017/4/13.
 */
@WebServlet(name = "RegisterServlet",urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        String userName = request.getParameter("exampleInputName");
        String userPassword = request.getParameter("exampleInputPsw1");

        UserDao dao = new UserDao();
        boolean b = dao.selectUserName(userName);
        if (b){
            out.print("<script>location.href='register.jsp';alert('注册失败，存在重复用户名');</script>");
        }else {
            int r = dao.registUser(userName,userPassword);
            if (r>0){
                out.print("<script>location.href='loginDispose.jsp?uname="+userName+"&upwd="+userPassword+"&check=true';alert('注册成功，前往首页');</script>");
            }else {
                out.print("<script>location.href='register.jsp';alert('注册失败，请重试');</script>");
            }
        }
    }
}
