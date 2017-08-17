package com.news.bean;

import java.sql.Timestamp;

public class News {
  private int newsid;
  private String newstitle;
  private int userid;
  private Timestamp newstime;
  private String newspage;
  private int newsreadnum;
  private int newstype;
  private String username;
  private String topicname;

  public int getNewsid() {
    return newsid;
  }

  public void setNewsid(int newsid) {
    this.newsid = newsid;
  }

  public String getNewstitle() {
    return newstitle;
  }

  public void setNewstitle(String newstitle) {
    this.newstitle = newstitle;
  }

  public int getUserid() {
    return userid;
  }

  public void setUserid(int userid) {
    this.userid = userid;
  }

  public Timestamp getNewstime() {
    return newstime;
  }

  public void setNewstime(Timestamp newstime) {
    this.newstime = newstime;
  }

  public String getNewspage() {
    return newspage;
  }

  public void setNewspage(String newspage) {
    this.newspage = newspage;
  }

  public int getNewsreadnum() {
    return newsreadnum;
  }

  public void setNewsreadnum(int newsreadnum) {
    this.newsreadnum = newsreadnum;
  }

  public int getNewstype() {
    return newstype;
  }

  public void setNewstype(int newstype) {
    this.newstype = newstype;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getTopicname() {
    return topicname;
  }

  public void setTopicname(String topicname) {
    this.topicname = topicname;
  }
}
