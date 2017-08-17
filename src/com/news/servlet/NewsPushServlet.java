package com.news.servlet;

import com.news.dao.NewsDao;

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
@WebServlet(name = "NewsPushServlet",urlPatterns = "/NewsPushServlet")
public class NewsPushServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        int uid = Integer.parseInt(request.getParameter("uid"));
        int tid = Integer.parseInt(request.getParameter("tid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        NewsDao dao = new NewsDao();
        int r = dao.insertNews(title,uid,content,tid);
        if (r>0){
            out.println("<script>alert('发布成功');location.href='admin.jsp'</script>");
        }else {
            out.println("<script>alert('发布失败');location.href='admin.jsp'</script>");
        }
    }
}
