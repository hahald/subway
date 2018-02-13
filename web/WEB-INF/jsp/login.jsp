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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="alert alert-success alert-dismissable">
                    <h3>
                        欢迎使用~
                    </h3> <strong>编写代码，我们是认真的!</strong>
                </div>
                <div class="modal-body">
                    <form action="<%= basePath %>wao/login" role="form" class="form col-md-12 center-block">
                        <div class="form-group">
                            <input class="text-center " name="uid" type="text" placeholder="用户编号" />
                        </div>
                        <div class="form-group">
                            <input class="text-center " name="pwd" type="password" placeholder="登录密码" />
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label for="exampleInputFile">File input</label><input id="exampleInputFile" type="file" />--%>
                            <%--<p class="help-block">--%>
                                <%--Example block-level help text here.--%>
                            <%--</p>--%>
                        <%--</div>--%>
                        <button type="submit" id="dl" class="btn btn-primary btn-info full-width col-md-6">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="js/bootstrap.min.js"></script>
<script src="static/common/js/jquery-1.9.0.min.js"></script>
<script src="static/common/js/login/verificationNumbers.js" ></script>
<script src="static/common/js/login/Particleground.js"></script>
<script>

</script>
</body>
</html>
