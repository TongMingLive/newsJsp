package com.news.bean;

import java.sql.Timestamp;

public class Comments {
  private int commentsid;
  private Timestamp commentstime;
  private String commentspage;
  private int userid;
  private int newsid;
  private String userName;

  public int getCommentsid() {
    return commentsid;
  }

  public void setCommentsid(int commentsid) {
    this.commentsid = commentsid;
  }

  public Timestamp getCommentstime() {
    return commentstime;
  }

  public void setCommentstime(Timestamp commentstime) {
    this.commentstime = commentstime;
  }

  public String getCommentspage() {
    return commentspage;
  }

  public void setCommentspage(String commentspage) {
    this.commentspage = commentspage;
  }

  public int getUserid() {
    return userid;
  }

  public void setUserid(int userid) {
    this.userid = userid;
  }

  public int getNewsid() {
    return newsid;
  }

  public void setNewsid(int newsid) {
    this.newsid = newsid;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }
}
