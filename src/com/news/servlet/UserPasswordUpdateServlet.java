package com.news.servlet;

import com.news.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by tong- on 2017/4/13.
 */
@WebServlet(name = "UserPasswordUpdateServlet",urlPatterns = "/UserPasswordUpdateServlet")
public class UserPasswordUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        int uid = Integer.parseInt(request.getParameter("uid"));
        String password = request.getParameter("exampleInputPsw1");

        UserDao userDao = new UserDao();
        int r = userDao.updateUserPassword(uid,password);
        if (r>0){
            HttpSession session =request.getSession();
            session.invalidate();
            out.println("<script>alert('修改成功,请重新登陆');location.href='index.jsp'</script>");
        }else {
            out.println("<script>alert('修改失败');location.href='userPasswordUpdate.jsp'</script>");
        }
    }
}
