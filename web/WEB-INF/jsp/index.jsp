       <%--
  Created by IntelliJ IDEA.
  User: DXG
  Date: 2018/1/2
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String uri=basePath.substring(0,basePath.length()-1)+request.getServletPath();
    if(request.getPathInfo() != null){
        uri += request.getPathInfo();
    }
    pageContext.setAttribute("uri", uri);
    pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>小姨子~系统</title>
  <link rel="shortcut icon" href="static/images/favicon.ico" type="image/x-icon" />
  <meta name="author" content="DeathGhost" />
  <link rel="stylesheet" type="text/css" href="static/common/css/login.css"/>
  <style>
    body{height:100%;background:#009EC8;overflow:hidden;}
    canvas{z-index:-1;position:absolute;}
  </style>
</head>
<body>
<dl class="admin_login">
  <dt>
    <strong>小姨子~系统</strong>
   <%-- <em>Management System</em>--%>
  </dt>
    <dd style="height: 20px;">
        <label id="message" style="display: none;color: red"></label>
    </dd>
  <dd class="user_icon">
    <input type="text" placeholder="请输入账号" id="loginname" class="login_txtbx"/>
  </dd>
  <dd class="pwd_icon">
    <input type="password" placeholder="请输入密码" id="pwd" class="login_txtbx"/>
  </dd>
 <%-- <dd class="val_icon">
    <div class="checkcode">
      <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
      <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
    </div>
    <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
  </dd>--%>
  <dd>
    <input type="button" value="登录" class="submit_btn"/>
  </dd>
  <%--<dd>
   &lt;%&ndash; <p>© 2015-2016 jq22 版权所有</p>
    <p>陕B2-8998988-1</p>&ndash;%&gt;
  </dd>--%>
</dl>
<script src="static/common/js/jquery-1.9.0.min.js"></script>
<script src="static/common/js/login/verificationNumbers.js" ></script>
<script src="static/common/js/login/Particleground.js"></script>
<script>
    $(document).ready(function() {
        //粒子背景特效
        $('body').particleground({
            dotColor: '#00D5FF',
            lineColor: '#00D5FF'
        });

        $(document).keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        /*   //验证码
         createCode();*/
        //测试提交，对接程序删除即可
        $(".submit_btn").click(function(){
            login()
        });
    });

    function login() {
        $.ajax({
            url: '<%=basePath%>wao/login',
            type: 'post',
            dataType: 'json',
            data: {
                loginname: $("#loginname").val(),
                pwd: $("#pwd").val()
            },success:function (data) {
                if(data.flag=='yeah'){
                    $("#message").hide()
                    window.location.href="commonAction/openJsp?page=index"/*tpa=http://***index.html*/;
                }else{
                    $("#message").text(data.tip)
                    $("#message").show();
                }
            }})
    }
</script>
</body>
</html>
