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
    <script src="<%=basePath%>static/common/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/common/js/rating.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <script src="<%=basePath%>static/common/bootstrap/js/bootstrap.js"></script>
    <link href="<%=basePath%>static/common/css/modern.css" rel="stylesheet">
    <link href="<%=basePath%>static/common/css/modern-responsive.css" rel="stylesheet">
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
    <script type="text/javascript" src="/static/common/js/star_evaluate.js" ></script>
</head>
<body>
<!-- 表格 -->
<div class="col-xs-12">
    <table class="table table-striped table-bordered table-hover" id="user-table"></table>
</div>
<div class="container-sm">
    <ul class="pager">
        <li><a href="#">上一页</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">下一页</a></li>
    </ul>
</div>


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
<script type="text/javascript">

    $(function(){

        $('#user-table').bootstrapTable({
            //请求方法
            method: 'get',
            //是否显示行间隔色
            striped: true,
            //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            cache: false,
            //是否显示分页（*）
            pagination: true,
            //中文支持
            locale:'zh-CN',
            //是否启用排序
            sortable: false,
            //排序方式
            sortOrder: "asc",
            //初始化加载第一页，默认第一页
            pageNumber:1,
            //每页的记录行数（*）
            pageSize: 3,
            //可供选择的每页的行数（*）
            pageList: [2, 3, 4, 5],
            //分页方式：client客户端分页，server服务端分页（*）
            sidePagination:"server",
            //是否显示搜索
            search: false,
            //Enable the strict search.
            strictSearch: true,
            //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据
            url: "<%=basePath%>wao/queryUserBP",
            //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
            queryParamsType:'',
            //查询参数,每次调用是会带上这个参数，可自定义
            queryParams: function(params) {
                var param = {
                    pageNumber: params.pageNumber,
                    pageSize: params.pageSize
                };
                alert("nima");
                // for(var key in searchArgs){
                //     param[key]=searchArgs[key]
                // }
                return param;
            },

            //Indicate which field is an identity field.
            idField : "uid",
            columns: [
                {field: 'uid',title: '员工编号',align: 'center'},
                {field: 'uname',title: '姓 名',align: 'center'},
                {field: 'dept',title: '所属部门',align: 'center'},
                {field: 'opt',title: '操作',align: 'center',
                formatter:function(value,row,index){
                    //通过formatter可以自定义列显示的内容
                    //value：当前field的值，即id
                    //row：当前行的数据
                    var a = '<a href="" >测试</a>';
                }
            }],
                pagination:true
        });
    })


</script>
</html>

