package com.news.dao;

import com.news.bean.Users;
import com.news.db.DbHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tong- on 2017/4/12.
 */
public class UserDao {

    //查询所有用户
    public List<Users> selectAllUsers(){
        String sql = "select * from users";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        List<Users> list = new ArrayList<>();
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    Users users = new Users();
                    users.setUserid(rs.getInt("userId"));
                    users.setUsername(rs.getString("userName"));
                    users.setUserpassword(rs.getString("userPassword"));
                    users.setUsertype(rs.getInt("userType"));
                    list.add(users);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return list;
    }

    //查询用户名重复
    public boolean selectUserName(String userName){
        String sql = "select * from users where userName = '"+userName+"'";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        boolean b = false;
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                if (rs.next()) {
                    b = true;
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return b;
    }

    //用户登录
    public Users loginUser(String userName, String userPassword){
        String sql = "select * from users where userName = '"+userName+"' and userPassword = '"+userPassword+"'";
        System.out.println(sql);
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        Users user =new Users();
        try {
            con = DbHelper.getconnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                if (rs.next()) {
                    user.setUserid(rs.getInt("userId"));
                    user.setUsername(rs.getString("userName"));
                    user.setUserpassword(rs.getString("userPassword"));
                    user.setUsertype(rs.getInt("userType"));
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DbHelper.closeConnectionAndStatement(rs,con,st);
        }
        return user;
    }

    //用户注册
    public int registUser(String userName, String userPassword){
        String sql = "INSERT INTO users(userName, userPassword) VALUES ('"+userName+"','"+userPassword+"')";
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //修改用户权限
    public int updateUserType(int userId,int userType){
        String sql = "update users set userType = "+userType+" where userId = "+userId;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

    //修改密码
    public int updateUserPassword(int userId,String userPassword){
        String sql = "update users set userPassword = '"+userPassword+"' where userId = "+userId;
        System.out.println(sql);
        return DbHelper.executeSql(sql);
    }

}
