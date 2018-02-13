<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/9
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>卡操作结果</title>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h3>操作成功</h3>
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#card_add" id="goback">
    返回继续操作
</button>
<script>
    $(function(){
        $("#gobcak").click(function () {
            window.location.href = "open?page=model"
        });
    })
</script>
</body>
</html>
