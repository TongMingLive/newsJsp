package com.news.dao;

import com.news.bean.Comments;
import com.news.db.DbHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tong- on 2017/4/12.
 */
public class CommentsDao {

    private List<Comments> getList(String sql){
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<Comments> list = new ArrayList<>();
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    Comments comments = new Comments();
                    comments.setCommentsid(rs.getInt("commentsId"));
                    comments.setUserName(rs.getString("userName"));
                    comments.setCommentstime(rs.getTimestamp("commentsTime"));
                    comments.setCommentspage(rs.getString("commentsPage"));
                    comments.setNewsid(rs.getInt("newsId"));
                    list.add(comments);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //查看当前文章下的所有评论
    public List<Comments> selectNewsComments(int newsId){
        String sql = "SELECT c.*,u.userName FROM comments c,users u WHERE c.userId = u.userId AND newsId = "+newsId;
        System.out.println(sql);
        List<Comments> list = getList(sql);
        return list;
    }

    //发布评论
    public int insertNewsComments(int userId,int newsId,String commentsPage){
        String sql = "insert into comments(commentsPage,newsId,userId) values('"+commentsPage+"',"+newsId+","+userId+")";
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //查看当前文章下的评论数量
    public int selectNewsCommentsCount(int newsId) {
        String sql = "SELECT count(*) c FROM comments WHERE newsId = " + newsId;
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        int num = 0;
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                if (rs.next()) {
                    num = rs.getInt("c");
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return num;
    }

    //查看所有文章下的评论
    public List<Comments> selectAllComments(){
        String sql = "SELECT c.*,u.userName FROM comments c,users u WHERE c.userId = u.userId";
        System.out.println(sql);
        List<Comments> list = getList(sql);
        return list;
    }

    //查看所有个人评论
    public List<Comments> selectAllUserComments(int userId){
        String sql = "SELECT c.*,u.userName FROM comments c,users u WHERE c.userId = u.userId AND u.userId = "+userId;
        System.out.println(sql);
        List<Comments> list = getList(sql);
        return list;
    }

    //删除评论
    public int deleteComments(int commentsId){
        String sql = "delete from comments where commentsId = "+commentsId;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

}
