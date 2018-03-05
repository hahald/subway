<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/24
  Time: 16:20
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
    <%--<link type="text/css" rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
    <%--<script src="<%=basePath%>static/common/js/jquery-3.3.1.min.js" type="text/javascript"></script>--%>
    <%--<script src="<%=basePath%>static/common/bootstrap/js/bootstrap.js"></script>--%>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>static/common/bootstrap/css/bootstrap-table.min.css">
    <script src="<%=basePath%>static/common/bootstrap/js/bootstrap-table.min.js"></script>
    <script src="<%=basePath%>static/common/bootstrap/js/bootstrap-table-zh-CN.js"></script>

</head>
<body>
<!-- 搜索框 -->
<div class="col-xs-6 pull-right">

    <%--<div class="input-group">--%>
    <%--<input type="text" class=" form-control" name="uid" placeholder="请输入员工编号">--%>
    <%--</div>--%>

    <div class="input-group">

        <input type="text" class=" form-control" name="uid" placeholder="请输入员工编号">

        <input type="text" class=" form-control" name="uname" placeholder="请输入姓名">
        <span class="input-group-btn">
            <button class="btn btn-default search" type="button" id="find_user">搜索</button>
        </span>
    </div>
</div>
<div class="col-xs-12">
    <table class="table table-striped table-bordered table-hover" id="user-table"></table>
</div>


<div class="modal fade" id="user_evalu" tabindex="-1" role="dialog" aria-labelledby="user_evalu_Label" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="user_evalu_Label">
                    评价
                </h4>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <img title="哈哈" id="headphoto"  src="">
                </div>

                <div class="form-group">
                    <label for="uid" class="control-label">工号</label>
                    <input type="text" class="form-control" id="uid"  readonly="true">
                </div>

                <div class="form-group">
                    <label for="uname" class="control-label">姓名</label>
                    <input type="text" class="form-control" id="uname"  readonly="true">
                </div>
            </div>

            <table class="table table-bordered table-hover table-striped table-condensed">
                <tr>
                    <th width="20%">评价项目</th>
                    <th width="30%">星星</th>
                    <th width="20%">分数</th>
                    <th width="30%">追加描述</th>
                </tr>
                <tr class="tr">
                    <td>服务评价</td>
                    <td>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                    </td>
                    <td class="score"></td>
                    <td class="tr"><input type="text" maxlength="50" id="pj"/></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <button type="button" class="btn btn-success">提交</button>
                    </td>
                </tr>
            </table>
            <input type="hidden" value="" id="star_count"/>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">

    $(function(){
        $("#find_user").click(function () {
            var searchArgs={
                uname:$("input[name='uname']").val(),
                uid:$("input[name='uid']").val()
            };
            init(searchArgs)
        });

        init({});


        var tip_text = '',$parent = {};
        $(".glyphicon").bind({
            mouseout: function () {
                $parent.children('.extra').remove();
                var score = $parent.siblings('.score').html();
                if(score){//有星星选中时
                    $parent.children(":lt("+ parseInt(score) +")").removeClass('glyphicon-star-empty').addClass('glyphicon-star');//PS:此处应该加上parseInt进行整型转换，否则会没有效果
                    $parent.children(":gt("+ eval(parseInt(score)-1) + ")").removeClass('glyphicon-star').addClass('glyphicon-star-empty');//PS:此处要记得加eval，进行js计算，不然会报“jquery.min.js:2 Uncaught Error: Syntax error, unrecognized expression: NaN)”的错误
                }else{
                    $(this).prevAll().andSelf().removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
            },
            mouseover: function () {
                $parent = $(this).parent();//把父节点存放起来
                var score = $parent.siblings('.score').html();
                $parent.append('<span class="extra dot-left"></span><span class="extra tip"></span>');//添加提示框
                tip_text = indexText($(this).index());//得到相应的文字提示
                $(this).siblings('.tip').html(tip_text);//显示文字提示
                $(this).prevAll().andSelf().removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                if(score){//当有星星选中时，为了解决鼠标移到选中星星的的前面星星时的小bug，此时会出现前面星星鼠标滑动时，星星颜色不变化现象
                    $(this).nextAll().not('.extra').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
            },
            click: function(){
                var score = $(this).index() + 1;
                $parent.siblings('.score').html(score+'(' + tip_text + ')');
                $("#star_count").val(score);
                $(this).prevAll().andSelf().removeClass('glyphicon-star-empty').addClass('glyphicon-star');
            }
        });

        $('.btn-success').click(function(){
            var allScore = '';
            var star = $("#star_count").val();
            var evalu = $("#pj").val();
            var uid = $("#uid").val();
            $('.score').each(function(){
                var text = $(this).html();
                if(text == ''){
                    alert('请完成评分后再提交!');
                    throw "请完成评分后再提交!";//向浏览器抛出异常，终止程序运行，用了return false试了下，还是会继续执行下面的弹窗，这里用throw刚好恰到好处,如果想继续用return false则可以改成if...else...进行判断处理也可以。
                    //return false;
                }
                allScore += $(this).siblings(":first").html() + ':' + text + '\n';
            });

            $.ajax({
                url: '<%=basePath%>wao/evalu',
                type: 'post',
                dataType: 'json',
                data: {
                    uid:uid,
                    evaluation: evalu,
                    star: star
                },success:function (data) {
                    if(data.flag=='yeah'){
                        alert("评价成功");
                        $("#user_evalu").modal('hide');
                    }else{
                        alert(data.message);
                    }
                }})
        })

    })

    function evalu(id) {

        var row = id.parentNode.parentNode.rowIndex;
        var UId = $("#user-table tr:eq(" + row + ") td:eq(0)").html()

        if (UId!=""&&UId!=null){
            $.ajax({
                url: '<%=basePath%>wao/getUserById',
                type: 'post',
                dataType: 'json',
                data: {
                    uid: UId
                },success:function (data) {
                    if(data.uid!=null){
                        $("#uid").val(data.uid);
                        $("#uname").val(data.uname);
                        $("#headphoto").attr("src",data.photo);
                        $("#user_evalu").modal('show');
                    }else{
                        alert("未找到:"+UId);
                    }
                }});
        }
    }

    function init(searchArgs) {
        $('#user-table').bootstrapTable('destroy');
        $('#user-table').bootstrapTable({
            method: 'get',//请求方法
            striped: true,//是否显示行间隔色
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,//是否显示分页（*）
            sortable: false,//是否启用排序
            sortOrder: "asc",//排序方式
            pageNumber:1,//初始化加载第一页，默认第一页
            pageSize: 3,//每页的记录行数（*）
            //可供选择的每页的行数（*）
            pageList: [2, 3, 4, 5],
            //分页方式：client客户端分页，server服务端分页（*）
            sidePagination:"server",
            //是否显示搜索
            search: false,
            //Enable the strict search.
            strictSearch: true,
            contentType: "application/x-www-form-urlencoded",
            toolbar: '#toolbar', //工具按钮用哪个容器
            //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据
            url: "<%=basePath%>wao/queryUserTable",
            //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
            queryParamsType:'',
            //查询参数,每次调用是会带上这个参数，可自定义
            queryParams: function(params) {
                var param = {
                    limit: params.pageSize,
                    page: params.pageNumber,
                    uid:searchArgs.uid,
                    uname:searchArgs.uname
                };
                // for(var key in searchArgs){
                //     param[key]=searchArgs[key]
                // }
                return param;
            },
            columns: [
                {field: 'uid',title: '员工编号',align: 'center'},
                {field: 'uname',title: '姓 名',align: 'center'},
                {field: 'dept',title: '所属部门',align: 'center'},
                {field: 'opt',title: '操作',align: 'center',
                    formatter:function(value,row,index){
                        //通过formatter可以自定义列显示的内容
                        //value：当前field的值，即id
                        //row：当前行的数据
                        var a = '<button class="btn btn-warning" onclick="evalu(this)">评价</button>';
                        return a;
                    }
                }]
        });
    }

    //封装文字提示函数
    function indexText(i){
        switch(i){
            case 0:
                return '非常不满意';
            case 1:
                return '不满意';
            case 2:
                return '一般';
            case 3:
                return '满意';
            case 4:
                return '非常满意';
        }
    }
</script>

</body>
</html>
