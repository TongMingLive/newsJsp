<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户登录</h4>
            </div>
            <form action="loginDispose.jsp" onsubmit="return validate()">
                <div class="modal-body">
                    <div class="login-form">
                        <div class="form-group">
                            <input type="text" class="form-control login-field" name="uname" placeholder="请输入用户名">
                            <label class="login-field-icon fui-user" for="login-name"></label>
                            <p class="help-block">只能输入字母或数字，6-20个字符</p>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control login-field" name="upwd" placeholder="请输入密码">
                            <label class="login-field-icon fui-lock" for="login-pass"></label>
                            <p class="help-block">密码长度6-15位</p>
                        </div>
                        <div class="from-checkbox">
                            <label class="checkbox" for="checkbox0">
                                <span class="icon"></span>
                                <span class="icon-to-fade"></span>
                                <input id="checkbox0" type="checkbox" value="true"/>
                                一周内免登陆，公共场所请勿勾选我
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary rig_btn">注册账号</button>
                    <button type="submit" class="btn btn-info">登陆</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="//cdn.bootcss.com/flat-ui/2.3.0/js/vendor/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="//cdn.bootcss.com/flat-ui/2.3.0/js/flat-ui.min.js"></script>

<script src="//cdn.bootcss.com/flat-ui/2.3.0/js/vendor/respond.min.js"></script>

<script src="js/alertBoot.js"></script>