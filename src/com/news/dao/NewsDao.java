package com.news.dao;

import com.news.bean.News;
import com.news.db.DbHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tong- on 2017/4/12.
 */
public class NewsDao {

    private List<News> getNewsList(String sql){
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<News> list = new ArrayList<>();
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    News news = new News();
                    news.setNewsid(rs.getInt("newsId"));
                    news.setNewstitle(rs.getString("newsTitle"));
                    news.setUsername(rs.getString("userName"));
                    news.setNewstime(rs.getTimestamp("newsTime"));
                    news.setNewspage(rs.getString("newsPage"));
                    news.setNewsreadnum(rs.getInt("newsReadnum"));
                    news.setNewstype(rs.getInt("newsType"));
                    news.setTopicname(rs.getString("topicName"));
                    list.add(news);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //插入新闻
    public int insertNews(String newsTitle,int userId,String newsPage,int newsType){
        String sql = "insert into news(newsTitle,userId,newsPage,newsType) values('"+newsTitle+"',"+userId+",'"+newsPage+"',"+newsType+")";
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //查看某条新闻
    public News selectNewsById(int newsId){
        String sql = "SELECT n.*,u.userName,t.topicName FROM news n,users u,topic t WHERE n.userId = u.userId AND n.newsType = t.topicId AND n.newsId = "+newsId;
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        News news = new News();
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                if (rs.next()) {
                    news.setNewsid(rs.getInt("newsId"));
                    news.setNewstitle(rs.getString("newsTitle"));
                    news.setUsername(rs.getString("userName"));
                    news.setNewstime(rs.getTimestamp("newsTime"));
                    news.setNewspage(rs.getString("newsPage"));
                    news.setNewsreadnum(rs.getInt("newsReadnum"));
                    news.setNewstype(rs.getInt("newsType"));
                    news.setTopicname(rs.getString("topicName"));
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return news;
    }

    //查看某系列文章
    public List<News> selectNewsByType(int newsType){
        String sql = "SELECT n.*,u.userName,t.topicName FROM news n,users u,topic t WHERE n.userId = u.userId AND n.newsType = t.topicId AND n.newsType = "+newsType+" ORDER BY newsTime desc";
        System.out.println(sql);
        List<News> list = getNewsList(sql);
        return list;
    }

    //根据搜索结果查看文章
    public List<News> selectNewsByKey(String key){
        String sql = "SELECT n.*,u.userName,t.topicName FROM news n,users u,topic t WHERE n.userId = u.userId AND n.newsType = t.topicId AND (n.newsTitle LIKE '%"+key+"%' OR n.newsPage LIKE '%"+key+"%' OR u.userName LIKE '%"+key+"%' OR topicName LIKE '%"+key+"%') ORDER BY newsTime desc";
        System.out.println(sql);
        List<News> list = getNewsList(sql);
        return list;
    }

    //查看所有文章
    public List<News> selectNewsAll(){
        String sql = "SELECT n.*,u.userName,t.topicName FROM news n,users u,topic t WHERE n.userId = u.userId AND n.newsType = t.topicId ORDER BY newsTime desc";
        System.out.println(sql);
        List<News> list = getNewsList(sql);
        return list;
    }

    //阅读后增加文章阅读量
    public int updateNewsReadnum(int newsId){
        String sql = "update news set newsReadnum = newsReadnum+1 where newsId ="+newsId;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //删除文章
    public int deleteNews(int newsId){
        String sql = "delete from news where newsId = "+newsId;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //修改文章
    public int updateNews(int newsId,String newsTitle,String newsPage,int newsType){
        String sql = "update news set newsTitle = '"+newsTitle+"',newsPage = '"+newsPage+"',newsType = "+newsType+" where newsId = "+newsId;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

}
