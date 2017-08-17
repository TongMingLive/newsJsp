package com.news.servlet;

import com.news.dao.NewsDao;
import com.news.dao.TopicDao;

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
@WebServlet(name = "TopicUpdateServlet",urlPatterns = "/TopicUpdateServlet")
public class TopicUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        int tid = Integer.parseInt(request.getParameter("tid"));
        String tname = request.getParameter("tname");

        TopicDao dao = new TopicDao();
        int r = dao.updateTopic(tname,tid);
        if (r>0){
            out.println("<script>alert('修改成功');location.href='topicUpdate.jsp'</script>");
        }else {
            out.println("<script>alert('修改失败');location.href='topicUpdate.jsp'</script>");
        }
    }
}
