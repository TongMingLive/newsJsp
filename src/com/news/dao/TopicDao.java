package com.news.dao;

import com.news.bean.Topic;
import com.news.db.DbHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tong- on 2017/4/12.
 */
public class TopicDao {

    //查询所有栏目
    public List<Topic> selectAllTopic(){
        String sql = "select * from topic ORDER BY topicId";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<Topic> list = new ArrayList<>();
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    Topic topic = new Topic();
                    topic.setTopicid(rs.getInt("topicId"));
                    topic.setTopicname(rs.getString("topicName"));
                    list.add(topic);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //添加栏目
    public int insertTopic(String topicName){
        String sql = "insert into topic(topicName) values('"+topicName+"')";
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //修改栏目
    public int updateTopic(String topicName,int tid){
        String sql = "update topic set topicName = '"+topicName+"' where topicId = "+tid;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //删除栏目
    public int deleteTopic(int tid){
        String sql = "delete from topic where topicId = "+tid;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //删除当前栏目下的所有新闻
    public int deleteNewsByType(int topicId){
        String sql = "delete from news where newsType = "+topicId;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

}
