<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/2
  Time: 15:29
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
    <title>地铁储值卡维护</title>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<h2>地铁卡维护</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#card_add">
    卡注册
</button>
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    卡充值
</button>
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#card_loss">
    卡挂失
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="card_add" tabindex="-1" role="dialog" aria-labelledby="card_add_Label" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="card_add_Label">
                    地铁卡注册
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="cardid" class="control-label">卡号</label>
                    <input type="text" class="form-control" id="cardid" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="cname" class="control-label">持卡人姓名</label>
                    <input type="text" class="form-control" id="cname" maxlength="10">
                </div>
                <div class="form-group">
                    <label for="identi" class="control-label">持卡人身份证</label>
                    <input type="text" class="form-control" id="identi" maxlength="22">
                </div>
                <div class="form-group">
                    <label for="ctel" class="control-label">联系电话</label>
                    <input type="text" class="form-control" id="ctel" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="cdeposit" class="control-label">押金</label>
                    <input type="text" class="form-control" id="cdeposit" value="20" maxlength="6">
                </div>
                <div class="form-group">
                    <label for="cstore" class="control-label">充值</label>
                    <input type="text" class="form-control" id="cstore" value="6">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="add_ka">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="card_loss" tabindex="-1" role="dialog" aria-labelledby="card_loss_Label" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="card_loss_Label">
                    地铁卡挂失
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="cardid" class="control-label">卡号</label>
                    <input type="text" class="form-control" id="loss_cardid" maxlength="20">
                    <button type="button" class="btn btn-primary" id="find_cardinfo">
                        查询
                    </button>
                </div>
                <div class="form-group">
                    <label for="cname" class="control-label">持卡人姓名</label>
                    <input type="text" class="form-control" id="loss_cname" maxlength="10">
                </div>
                <div class="form-group">
                    <label for="identi" class="control-label">持卡人身份证</label>
                    <input type="text" class="form-control" id="loss_identi" maxlength="22">
                </div>
                <div class="form-group">
                    <label for="ctel" class="control-label">联系电话</label>
                    <input type="text" class="form-control" id="loss_ctel" maxlength="20">
                </div>
                <div class="form-group">
                    <label for="cdeposit" class="control-label">押金</label>
                    <input type="text" class="form-control" id="loss_cdeposit" value="20" maxlength="6">
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $(function() {
        $("#cdeposit,#cstore").keyup(function () {
            var reg = $(this).val().match(/\d+\.?\d{0,2}/);
            var txt = '';
            if (reg != null) {
                txt = reg[0];
            }
            $(this).val(txt);
        }).change(function () {
            $(this).keypress();
            var v = $(this).val();
            if (/\.$/.test(v))
            {
                $(this).val(v.substr(0, v.length - 1));
            }
        });

        // $("#cdeposit,#cstore").keyup(function () {
        //     var money = $(this).val();
        //     money = money.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
        //     money = money.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
        //     money = money.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
        //     money = money.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数
        //     if(money.indexOf(".")< 0 && money !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
        //         $(this).val(parseFloat(money));
        //     }
        // });

        $("#add_ka").click(function () {

            addCard();

        });

    })

    function addCard() {
        var cid = $("#cardid").val().trim();
        var cidenti = $("#identi").val().trim();
        var ctel = $("#ctel").val().trim();
        var cname = $("#cname").val().trim();
        var cdeposit = $("#cdeposit").val().trim();
        var cstore = $("#cstore").val().trim();
        var msg = "";

        if(cid==""||cid==null){
          msg="请填写卡号";
          $("#cardid").focus();
        }
        if(cidenti==""||cid==null){
            msg="请填写持卡人身份证";
            $("#cidenti").focus();
        }
        if(cdeposit==""||cdeposit==0){
            msg="请填写押金";
            $("#cdeposit").focus();
        }
        if(cname==""||cid==null){
            msg="请填写持卡人姓名";
            $("#cname").focus();
        }

        if (msg != ""){
            $("#message").val(msg);
        }else{
            $.ajax({
                url: '<%=basePath%>wao/card_add',
                type: 'post',
                dataType: 'json',
                data: {
                    cardId: cid,
                    identity: cidenti,
                    tel: ctel,
                    cname: cname,
                    deposit: cdeposit,
                    stored: cstore
                },success:function (data) {
                    if(data.flag=='yeah'){
                        window.location.href = "open?page=card_tip"
                    }else{
                        alert(data.message);
                    }
                }})
        }
    }
    
    function lossCard() {
        var msg="";
        var cid = $("#loss_cardid").val().trim();
        if(cid==""||cid==null){
            msg="请填写卡号";
            $("#loss_cardid").focus();
        }
    }


    function findCard() {
        var msg="";
        var cid = $("#loss_cardid").val().trim();
        if(cid==""||cid==null){
            msg="请填写卡号";
            $("#loss_cardid").focus();
        }


    }


    function findCardInfo() {
        var msg="";
        var cid = $("#loss_cardid").val().trim();
        if(cid==""||cid==null){
            msg="请填写卡号";
            $("#loss_cardid").focus();
        }
        if (msg != ""){
            $("#message").val(msg);
        }else{
            $.ajax({
                url: '<%=basePath%>wao/card_find',
                type: 'post',
                dataType: 'json',
                data: {
                    cardId: cid,
                },success:function (data) {
                    if(data.remark=='yeah'){
                        $("#loss_cname").val(data.cname);
                        $("#loss_identi").val(data.identity);
                        $("#loss_tel").val(data.tel);
                        $("#loss_deposit").val(data.cname);
                    }else{
                        alert(data.remark);
                    }
                }})
        }
    }
</script>
</body>
</html>
