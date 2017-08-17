package com.news.servlet;

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
@WebServlet(name = "TopicPushServlet",urlPatterns = "/TopicPushServlet")
public class TopicPushServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        String tname = request.getParameter("tname");

        TopicDao dao = new TopicDao();
        int r = dao.insertTopic(tname);
        if (r>0){
            out.println("<script>alert('添加成功');location.href='topicUpdate.jsp'</script>");
        }else {
            out.println("<script>alert('添加失败');location.href='topicpush.jsp'</script>");
        }
    }
}
