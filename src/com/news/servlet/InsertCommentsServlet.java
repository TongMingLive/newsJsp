package com.news.servlet;

import com.news.dao.CommentsDao;

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
@WebServlet(name = "InsertCommentsServlet",urlPatterns = "/InsertCommentsServlet")
public class InsertCommentsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        String nid = request.getParameter("nid");
        String uid = request.getParameter("uid");
        String content = request.getParameter("content");
        if(nid!=null || uid!=null) {
            int idn = Integer.parseInt(nid);
            int idu = Integer.parseInt(uid);
            CommentsDao dao = new CommentsDao();
            int r = dao.insertNewsComments(idu,idn,content);
            if (r>0){
                out.println("<script>alert('发表成功');</script>");
                String url = request.getHeader("REFERER");
                response.sendRedirect(url);
            }else {
                out.println("<script>alert('发表评论出现未知错误，请再试一次');</script>");
                String url = request.getHeader("REFERER");
                response.sendRedirect(url);
            }
        }else{
            out.println("<script>location.href='index.jsp'</script>");
        }
    }
}
