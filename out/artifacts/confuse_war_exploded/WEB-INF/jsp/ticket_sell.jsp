<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/24
  Time: 14:51
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
    <title>售票</title>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span6">



            <select id="route_start">

            </select>

            <select id="route_end">

            </select>


            <form>
                <fieldset>
                    <legend>表单项</legend> <label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span> <label class="checkbox"><input type="checkbox" /> 勾选同意</label> <button type="submit" class="btn">提交</button>
                </fieldset>
            </form>
        </div>
        <div class="span6">
            <form class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="inputEmail">邮箱</label>
                    <div class="controls">
                        <input id="inputEmail" type="text" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">密码</label>
                    <div class="controls">
                        <input id="inputPassword" type="password" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <label class="checkbox"><input type="checkbox" /> Remember me</label> <button type="submit" class="btn">登陆</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <button class="btn" type="button">按钮</button>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $.ajax({
            url: '<%=basePath%>wao/getAllRoute',
            type: 'post',
            dataType: 'json',
            success:function (data) {
                for(var i in data){
                    $("#route_start").append("<option value="+data[i].+">"+data[i]+"</option>");
                    $("#route_end").append("<option value=i>"+data[i]+"</option>");
                }
            }})
    })

</script>
</html>
