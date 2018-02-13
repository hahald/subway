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
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>欢迎使用</title>

    <style type="text/css">
        .center{text-align: center;}
        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }
        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .form button {
            font-family: "Microsoft YaHei","Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            cursor: pointer;
        }
        .form button:hover,.form button:active,.form button:focus {
            background: #43A047;
        }
        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }
        .form .message a {
            color: #4CAF50;
            text-decoration: none;
        }
        .form .register-form {
            display: none;
        }
        .container {
            position: relative;
            z-index: 1;
            max-width: 300px;
            margin: 0 auto;
        }
        .container:before, .container:after {
            content: "";
            display: block;
            clear: both;
        }
        .container .info {
            margin: 50px auto;
            text-align: center;
        }
        .container .info h1 {
            margin: 0 0 15px;
            padding: 0;
            font-size: 36px;
            font-weight: 300;
            color: #1a1a1a;
        }
        .container .info span {
            color: #4d4d4d;
            font-size: 12px;
        }
        .container .info span a {
            color: #000000;
            text-decoration: none;
        }
        .container .info span .fa {
            color: #EF3B3A;
        }
        body {
            background: #009EC8; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #009EC8, #afd9ee);
            background: -moz-linear-gradient(right, #009EC8, #afd9ee);
            background: -o-linear-gradient(right, #009EC8, #afd9ee);
            background: linear-gradient(to left, #009EC8, #afd9ee);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        .shake_effect{
            -webkit-animation-name: shake;
            animation-name: shake;
            -webkit-animation-duration: 1s;
            animation-duration: 1s;
        }
        @-webkit-keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

        @keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }
        p.center{
            color: #fff;font-family: "Microsoft YaHei";
        }
    </style>

</head>
<body>
<div class="htmleaf-container">
    <div id="wrapper" class="login-page">
        <div id="login_form" class="form">
            <%--<form class="register-form">--%>
                <%--<input type="text" placeholder="用户编号" id="userid"/>--%>
                <%--<input type="password" placeholder="密码" id="userpwd" />--%>
                <%--<button id="create">创建账户</button>--%>
                <%--<p class="message">已经有了一个账户? <a href="#">立刻登录</a></p>--%>
                <%----%>
            <%--</form>--%>
            <form class="login-form">
                <input type="text" placeholder="用户编号" id="userid"/>
                <input type="password" placeholder="密码" id="userpwd"/>
                <button id="login">登　录</button>
                <p class="message">还没有账户? <a href="#">立刻创建</a></p>
                <p class="message" id="message"></p>
            </form>

        </div>
    </div>

</div>

<script src="/static/common/js/jquery-1.9.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var name="";
    var pass="";
    function check_login()
    {

        var msg = "";
        name=$("#userid").val().trim();
        pass=$("#userpwd").val().trim();

        if (name == ""){
            msg = "用户名不能为空！";
            $("#userid").focus();
        }else if (pass == ""){
            msg = "密码不能为空！";
            $("#userpwd").focus();
        }
        // else if (!/^\w{6,20}$/.test(trim(pass))){
        //     msg = "密码格式不正确！";
        //     $("#userpwd").focus();
        // }

        if (msg != ""){
            alert(msg);
        }else{
            $.ajax({
                url: '<%=basePath%>wao/login',
                type: 'post',
                dataType: 'json',
                data: {
                    uid: name,
                    pwd: pass
                },success:function (data) {
                    if(data.flag=='yeah'){
                        $("#message").hide()
                        window.location.href="open?page=main"/*tpa=http://***index.html*/;
                    }else{
                        $("#message").text(data.tip)
                        $("#message").show();
                    }
                }})
        }



    }

    $(function(){

        $("#login").click(function(){
            check_login();
            return false;
        });
        $('.message a').click(function () {
            $('form').animate({
                height: 'toggle',
                opacity: 'toggle'
            }, 'slow');
        });

        $("#guest").click(function () {

            window.location.href="wao/center"

        });

    })
</script>
</body>
</html>