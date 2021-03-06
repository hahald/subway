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
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>地铁</title>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/fileinput.min.css">

    <script src="<%=basePath%>static/common/js/jquery-3.3.1.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>static/common/bootstrap/js/html5shiv.js"></script>
    <script src="<%=basePath%>static/common/bootstrap/js/respond.js"></script>
    <script src="<%=basePath%>static/common/bootstrap/js/fileinput.min.js"></script>
    <script src="<%=basePath%>static/common/bootstrap/js/fileinput_locale_zh.js"></script>


    <%--<![endif]-->--%>
    <%--<style>--%>
        <%--body{--%>
            <%--margin: 0;--%>
            <%--padding: 50px 0 0 0;--%>
        <%--}--%>
        <%--.left{--%>
            <%--background-color: #ddd;--%>
            <%--padding: 10px 0 500px 0;--%>
        <%--}--%>
    <%--</style>--%>


</head>


<body>


<!-- 顶部固定导航条 -->
<div class="container">
    <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role>
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" date-target="#bs-example-navbar-collapse-1">
                    <span style="white-space:pre">       </span><span class="sr-only">Toggle navigation</span>
                    <span style="white-space:pre">       </span><span class="icon-bar"></span>
                    <span style="white-space:pre">       </span><span class="icon-bar"></span>
                    <span style="white-space:pre">       </span><span class="icon-bar"></span>
                    <span style="white-space:pre">       </span><span class="icon-bar"></span>
                    <span style="white-space:pre">   </span></button>
                <span style="white-space:pre">   </span><a class="navbar-brand" href="#">管理系统</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <span style="white-space:pre">   </span><ul class="nav navbar-nav">
                <span style="white-space:pre">   </span>  <li class="active"><a href="#">首页</a></li>
                <span style="white-space:pre">   </span>  <li class="dropdown">
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span><a href="#" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span><ul class="dropdown-menu" role="menu">
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span>  <li class="dropdown-header">业务功能</li>
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span>  <li><a href="#">信息建立</a></li>
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span>  <li><a href="#">信息查询</a></li>
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span>  <li><a href="#">信息管理</a></li>
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span>  <li class="divider"></li>
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span>  <li class="dropdown-header">系统功能</li>
                <span style="white-space:pre">   </span>  <span style="white-space:pre">    </span>  <li><a href="#">设置</a></li>
                <span style="white-space:pre">   </span>  </ul>
                <span style="white-space:pre">   </span>  </li>
                <span style="white-space:pre">   </span>  <li><a href="#">帮助</a></li><span style="white-space:pre">     </span>
                <span style="white-space:pre">   </span></ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <span style="white-space:pre">   </span>  <input type="text" class="form-control" placeholder="用户名">
                        <span style="white-space:pre">   </span>  <input type="text" class="form-control" placeholder="密码">
                        <span style="white-space:pre">   </span>  </div>
                    <span style="white-space:pre">   </span>  <button type="submit" class="btn btn-default">登陆</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<!-- 顶部固定导航条结束 -->


<%--<!-- 内容 -->--%>
<div class="container-fluid">
    <div class="row">
        <!-- 左侧导航栏 -->
        <span style="white-space:pre"> </span><div class="col-md-2 left ">
        <span style="white-space:pre"> </span>  <ul class="nav nav-pill nav-stacked">
        <span style="white-space:pre"> </span>   <span style="white-space:pre">   </span><li class="active primary"><a href="#">首页</a></li>
        <span style="white-space:pre"> </span>  </ul>
        <span style="white-space:pre"> </span>  <br>
        <span style="white-space:pre"> </span>  <ul class="nav nav-pill nav-stacked">
        <span style="white-space:pre"> </span>   <span style="white-space:pre">   </span><li><a href="#">信息建立</a></li>
        <span style="white-space:pre"> </span>   <span style="white-space:pre">   </span><li><a href="#">信息查询</a></li>
        <span style="white-space:pre"> </span>  <span style="white-space:pre">    </span><li><a href="#">信息管理</a></li>
        <span style="white-space:pre"> </span>  </ul>
        <span style="white-space:pre"> </span>  <br>
        <span style="white-space:pre"> </span>  <ul class="nav nav-pill nav-stacked">
        <span style="white-space:pre"> </span>  <span style="white-space:pre">    </span><li><a href="#">设置</a></li>
        <span style="white-space:pre"> </span>   <span style="white-space:pre">   </span><li><a href="#">帮助</a></li>
        <span style="white-space:pre"> </span>  </ul>
        <span style="white-space:pre"> </span></div>
        <span style="white-space:pre"> </span><!-- 左侧导航栏结束 -->

        <div class="col-md-10">


            <div class="page-header">
                <h1>管理控制台</h1>
            </div>
            <button class="btn btn-default" id="evaluate">星级评价</button>
            <button class="btn btn-primary" id="222">xxx</button>
            <button class="btn btn-success" >操作3</button>
            <button class="btn btn-info">操作4</button>
            <button class="btn btn-warning" id="dropdown_test">操作5</button>
            <button class="btn btn-danger" id="card_opt">卡操作</button>
            <button class="btn btn-danger" id="sell">售票</button>
            <button class="btn btn-danger" id="">what</button>
            <p><a data-toggle="modal" href="#card_add" class="btn btn-primary btn-large">发动演示模态框</a></p>
            </p>


            <div class="row">
                <!-- 第一个面板 -->
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <span style="white-space:pre">    </span><div class="panel-heading">最新提醒</div>
                        <span style="white-space:pre">    </span><div class="panel-body">
                        <span style="white-space:pre">    </span>  <div class="alert alert-success">已通过</div>
                        <span style="white-space:pre">    </span>  <div class="alert alert-danger">被打回</div>
                        <span style="white-space:pre">    </span>  <div class="alert alert-warning">付款延迟</div>        <span style="white-space:pre">     </span>
                        <span style="white-space:pre">    </span></div>
                    </div>
                </div>
                <!-- 第一个面板结束 -->

                <!-- 第二个面板 -->
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">我的任务</div>
                        <div class="panel-body">
                            <span style="white-space:pre">    </span>  <div class="alert alert-info">订单审批<span class="badge pull-right">42</span></div>
                            <span style="white-space:pre">    </span>  <div class="alert alert-info">收款确认<span class="badge pull-right">20</span></div>
                            <span style="white-space:pre">    </span>  <div class="alert alert-info">付款确认<span class="badge pull-right">50</span></div>        <span style="white-space:pre">        </span>
                        </div>
                    </div>
                </div>
                <!-- 第二个面板结束 -->
            </div>


            <form class="form-horizontal required-validate" action="<%=basePath%>wao/uploadHeadImg" enctype="multipart/form-data" method="post" >

                <div class="form-group">
                    <label for="" class="col-md-1 control-label">头像</label>
                    <div class="col-md-10 tl th">
                        <input type="file" name="pic" class="projectfile" value="${deal.image}" />
                        <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                    </div>
                </div>
                <div class="form-group text-center ">
                    <div class="col-md-10 col-md-offset-1">
                        <button type="submit" class="btn btn-primary btn-lg" id="uploadpic">保存</button>
                    </div>
                </div>
            </form>

            <%--<div id="picture">--%>
                <%--<form enctype="multipart/form-data" >--%>
                    <%--<div class="form-group" >--%>
                        <%--<label class="col-sm-2 control-label">图片:</label>--%>
                        <%--<input type="file" name="pic" class="col-sm-10 file-loading" id="file-Portrait"  />--%>
                        <%--<input type="hidden"  name="sellId"  id="sellId" value="" />--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</div>--%>

            <!-- 第二行 -->
            <div class="row">
                <!-- 第三个面板 -->
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <span style="white-space:pre">    </span><div class="panel-heading">员工评价</div>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>员工编号</th>
                                <th>姓 名</th>
                                <th>所属部门</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>001</td>
                                <td>Rammohan </td>
                                <td>Reddy</td>
                                <td>A+</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 第三个面板结束 -->
                <!-- 第四个面板 -->
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <span style="white-space:pre">    </span><div class="panel-heading">工程进度</div>
                        <span style="white-space:pre">    </span><div class="panel-body">
                        <span style="white-space:pre">    </span>  <p><span class="label label-primary">水井挖掘工程</span></p>
                        <span style="white-space:pre">    </span>  <div class="progress">
                        <span style="white-space:pre">    </span>    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                        <span style="white-space:pre">            </span>    <span class="sr-only">60% Complete</span>
                        <span style="white-space:pre">            </span>    </div>
                        <span style="white-space:pre">    </span>  </div>
                        <span style="white-space:pre">    </span>  <p><span class="label label-danger">基建工程</span></p><span style="white-space:pre"> </span>
                        <span style="white-space:pre">    </span>  <div class="progress">
                        <span style="white-space:pre">    </span>    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                        <span style="white-space:pre">            </span>    <span class="sr-only">80% Complete</span>
                        <span style="white-space:pre">            </span>    </div>
                        <span style="white-space:pre">    </span>  </div><span style="white-space:pre">        </span>
                        <span style="white-space:pre">    </span></div>
                    </div>
                </div>
                <!-- 第四个面板结束 -->
            </div>
            <!-- 第二个行结束 -->

        </div><!-- end of class="col-md-10" -->
    </div><!-- end of row after container -->
</div><!-- end of second class="container-fluid" -->

<%--<script src="/static/common/js/jquery-1.9.0.min.js"></script>--%>
<%--<script src="/static/common/js/bootstrap.js"></script>--%>

<script type="text/javascript">

    $(function() {
        $("#evaluate").click(function () {

            window.location.href = "opt?page=evaluate"

        });


        $("#card_opt").click(function () {

            window.location.href = "opt?page=model"

        });

        $("#sell").click(function () {

            window.location.href = "opt?page=ticket_sell"

        });

        $('input[class=projectfile]').fileinput({
            showUpload : false,
            showRemove : false,
            language : 'zh',
            allowedPreviewTypes: ['image'],
            allowedFileTypes: ['image'],
            allowedFileExtensions:  ['jpg', 'png'],
            maxFileSize : 2000
        });

    })

</script>
</body>
</html> 