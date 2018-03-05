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

<h3>地铁卡维护</h3>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#card_add">
    卡注册
</button>
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#money_come">
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
                <label for="cardid" class="control-label">卡号</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="loss_cardid" maxlength="20">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-primary" id="find_loss">
                            查询
                        </button>
                    </span>
                </div>
                <div class="form-group">
                    <label for="loss_cname" class="control-label">持卡人姓名</label>
                    <input type="text" class="form-control" id="loss_cname" readonly="true">
                </div>
                <div class="form-group">
                    <label for="loss_identi" class="control-label">持卡人身份证</label>
                    <input type="text" class="form-control" id="loss_identi" readonly="true">
                </div>
                <div class="form-group">
                    <label for="loss_ctel" class="control-label">联系电话</label>
                    <input type="text" class="form-control" id="loss_ctel" readonly="true">
                </div>
                <div class="form-group">
                    <label for="loss_cdeposit" class="control-label">押金</label>
                    <input type="text" class="form-control" id="loss_cdeposit"  readonly="true">
                </div>
                <div class="form-group">
                    <label for="loss_money" class="control-label">剩余储值</label>
                    <input type="text" class="form-control" id="loss_money"  readonly="true">
                </div>
                <div class="form-group">
                    <label for="new_cardid" class="control-label">新卡号</label>
                    <input type="text" class="form-control" id="new_cardid"  maxlength="20">
                </div>

                    <button type="button" class="btn btn-primary col-lg-6 center-block" disabled="true"  id="loss_report">
                        挂失
                    </button>

                <div><br><br></div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="money_come" tabindex="-1" role="dialog" aria-labelledby="money_come_Label" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="money_come_Label">
                    地铁卡充值
                </h4>
            </div>
            <div class="modal-body">
                <label for="money_cardid" class="control-label">卡号</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="money_cardid" maxlength="20">
                    <span class="input-group-btn" >
                        <button type="button" class="btn btn-primary" id="find_money">
                            查询
                        </button>
                    </span>
                </div>

                <div class="form-group">
                    <label for="money_cname" class="control-label">持卡人姓名</label>
                    <input type="text" class="form-control" id="money_cname" readonly="true">
                </div>
                <label for="money_count" class="control-label">充值金额</label>
                <div class="input-group">
                    <select class="my-select-select form-control" id="money_count">
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                    <%--<input type="text" class="form-control" id="money_cdeposit" value="50" >--%>
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-primary" disabled="true" id="money_deposit">
                            充值
                        </button>
                    </span>
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


        $('#money_count').attr('value','50');


        $("#add_ka").click(function () {

            if(!checkInfo("add")) return;
            addCard();

        });

        $("#find_loss").click(function () {

            if(!checkInfo("find_loss")) return;
            CardOprate("find_loss");

        });
        $("#loss_report").click(function () {

            if(!checkInfo("loss")) return;
            CardOprate("loss");

        });

        $("#find_money").click(function () {

            if(!checkInfo("depoist")) return;

            CardOprate("find_money");

        });

        $("#money_deposit").click(function () {

            if(!checkInfo("depoist")) return;
            moneyGoMyHome();

        });

    })

    function checkInfo(opt_type) {
        var msg = "";
        switch (opt_type){
            case ("add"):
                var cid = $("#cardid").val().trim();
                var cidenti = $("#identi").val().trim();
                var ctel = $("#ctel").val().trim();
                var cname = $("#cname").val().trim();
                var cdeposit = $("#cdeposit").val().trim();
                var cstore = $("#cstore").val().trim();


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

                break;

            case ("find_loss"):
                var cid = $("#loss_cardid").val().trim();
                if(cid==""||cid==null){
                    msg="请填写卡号";
                    $("#cardid").focus();
                }
                break;
            case ("loss"):
                var cid = $("#loss_cardid").val().trim();
                if(cid==""||cid==null){
                    msg="请填写卡号";
                    $("#cardid").focus();
                }
                var newid = $("#new_cardid").val();
                if(newid==null||newid==""){
                    msg="请填写新卡号";
                    $("#new_cardid").focus();
                }
                break;

            case ("depoist"):
                var cid = $("#money_cardid").val().trim();
                if(cid==""||cid==null){
                    msg="请填写卡号";
                    $("#money_cardid").focus();
                }

                var money = $("#money_count option:selected").val();
                if(money==null||money==0){
                    msg="请填写充值金额";
                    $("#money_count").focus();
                }

                break;
        }

        if (msg != ""){
            alert(msg);
            $("#message").val(msg);
            return false;
        }

        return true;
    }

    function addCard() {

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
                    window.location.href = "opt?page=card_tip"
                }else{
                    alert(data.message);
                }
            }})

    }


    function CardOprate(opt_type) {

        var cid = "";

        switch (opt_type){
            case ("find_loss"):
                cid = $("#loss_cardid").val().trim();
                $.ajax({
                    url: '<%=basePath%>wao/card_find',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        cardId: cid
                    },success:function (data) {
                        if(data.remark=='yeah'){
                            $("#loss_cname").val(data.cname);
                            $("#loss_identi").val(data.identity);
                            $("#loss_ctel").val(data.tel);
                            $("#loss_deposit").val(data.cname);
                            $("#loss_money").val(data.stored);
                            $('#loss_report').removeAttr("disabled");
                        }else{
                            $('#loss_report').attr("disabled","true");
                            alert(data.remark);
                        }
                    }});

                break;
            case ("loss"):
                cid = $("#loss_cardid").val().trim();
                var new_id = $("#new_cardid").val().trim();
                $.ajax({
                    url: '<%=basePath%>wao/card_loss',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        cardId: cid,
                        newid:new_id
                    },success:function (data) {
                        if(data.flag=='yeah'){
                            window.location.href = "opt?page=card_tip"
                        }else{
                            alert(data.message);
                        }
                    }});
                break;
            case ("find_money"):
                cid = $("#money_cardid").val().trim();
                $.ajax({
                    url: '<%=basePath%>wao/card_find',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        cardId: cid
                    },success:function (data) {
                        if(data.remark=='yeah'){

                            $("#money_cname").val(data.cname);
                            $('#money_count').removeAttr("disabled");
                            $('#money_deposit').removeAttr("disabled");
                        }else{
                            $('#money_count').attr("disabled","true");
                            $('#money_deposit').attr("disabled","true");
                            alert(data.remark);
                        }
                    }});
        }


    }

    function moneyGoMyHome() {
        var cid = $("#money_cardid").val().trim();
        var money = $("#money_count").val();

        $.ajax({
            url: '<%=basePath%>wao/card_money',
            type: 'post',
            dataType: 'json',
            data: {
                cardId: cid,
                money:money
            },success:function (data) {
                if(data.flag=='yeah'){
                    window.location.href = "opt?page=card_tip"
                }else{
                    alert(data.message);
                }
            }})

    }


</script>
</body>
</html>
