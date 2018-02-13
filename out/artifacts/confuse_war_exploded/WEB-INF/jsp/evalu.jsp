<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/30
  Time: 14:46
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
<html>
<head>
    <script src="/static/common/js/rating.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <script src="/static/common/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="/static/common/js/bootstrap.js"></script>
    <link href="/static/common/css/modern.css" rel="stylesheet">
    <link href="/static/common/css/modern-responsive.css" rel="stylesheet">
    <title>jQuery简单星级评价打分代码</title>
    <style type="text/css">
        *{
            margin: 0;
        }
        .box{
            width: 80%;
            margin:20px auto;
        }
        .list{
            margin: 0 50px;
            width: 30%;
            float: left;
        }
        a{
            font-size: 50px;
            text-decoration: none;
            color: lightgray;
        }
        span{
            font-size: 40px;
            padding-top: 10px;
            margin-left: 50px;
        }
        .c1{
            color: crimson;
        }
        .c2{
            color: orange;
        }
        .c3{
            color: #fde16d;
        }
        .c4{
            color: #fde16d;
        }
        .c5{
            color: #fde16d;
        }
        .c0{
            color: #fde16d;
        }
    </style>
    <script type="text/javascript" src="/static/common/js/jquery-1.9.0.min.js" ></script>
    <script type="text/javascript" src="/static/common/js/star_evaluate.js" ></script>
</head>
<body>
<div class="box">
    <div class="list">
        <a href="#" class="star1">★</a>
        <a href="#" class="star2">★</a>
        <a href="#" class="star3">★</a>
        <a href="#" class="star4">★</a>
        <a href="#" class="star5">★</a>
    </div>
    <span class="remark">请点击星星评价~</span>
</div>
<input id="hd" name="hd" type="hidden" />
<button type="submit" id="tj" class="btn btn-primary">提 交</button>
</body>
</html>

