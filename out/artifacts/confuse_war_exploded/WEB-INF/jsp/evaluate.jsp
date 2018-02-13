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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--<link href="/static/common/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>--%>
    <%--<script src="/static/common/js/star-rating.js" type="text/javascript"></script>--%>
    <script src="/static/common/js/rating.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="/static/common/bootstrap/css/bootstrap.css">
    <script src="/static/common/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="/static/common/js/bootstrap.js"></script>
    <link href="/static/common/css/modern.css" rel="stylesheet">
    <link href="/static/common/css/modern-responsive.css" rel="stylesheet">


</head>
<body>

<span>点击星星就能打分</span>
<input id="input-2b" type="number" class="rating" min="0" max="5" step="1" data-size="xl"
       data-symbol="" data-default-caption="{rating} hearts" data-star-captions="{}">
<div class="rating" data-role="rating">
    <a class="rated" href="javascript:viod(0)"></a>
    <a class="rated" href="javascript:viod(0)"></a>
    <a class="rated" href="javascript:viod(0)"></a>
    <a class="rated" href="javascript:viod(0)"></a>
    <a class="rated" href="javascript:viod(0)"></a>
</div>
<button type="submit" id="tj" class="btn btn-primary">提 交</button>


<div class="span10">
    <h2>大的五角星</h2>

    <h3>静态</h3>
    <div>
        <div id="rating1" data-param-rating="3.7" data-param-vote="off" data-role="rating" class="rating static-rating" style="width: 135px;"><div class="rating-value" style="width: 74%;"></div></div>
    </div>
    <br>
    <pre class="prettyprint linenums span10"><ol class="linenums"><li class="L0"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"rating"</span><span class="pln"> </span><span class="atn">data-role</span><span class="pun">=</span><span class="atv">"rating"</span><span class="pln"> </span><span class="atn">data-param-vote</span><span class="pun">=</span><span class="atv">"off"</span><span class="pln"> </span><span class="atn">data-param-rating</span><span class="pun">=</span><span class="atv">"3.7"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li></ol></pre>

    <h3>静态小星</h3>
    <div>
        <div id="rating2" data-param-stars="6" data-param-rating="3" data-param-vote="off" data-role="rating" class="rating small static-rating" style="width: 84px;"><div class="rating-value" style="width: 50%;"></div></div>
    </div>
    <br>
    <pre class="prettyprint linenums span10"><ol class="linenums"><li class="L0"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"rating small"</span><span class="pln"> </span><span class="atn">data-role</span><span class="pun">=</span><span class="atv">"rating"</span><span class="pln"> </span><span class="atn">data-param-vote</span><span class="pun">=</span><span class="atv">"off"</span><span class="pln"> </span><span class="atn">data-param-rating</span><span class="pun">=</span><span class="atv">"3"</span><span class="pln"> </span><span class="atn">data-param-stars</span><span class="pun">=</span><span class="atv">"6"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li></ol></pre>
    <h3>评级</h3>
    <div>
        <div id="rating3" data-role="rating" class="rating"><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)" class="rated"></a></div>
    </div>
    <br>
    <pre class="prettyprint linenums span10"><ol class="linenums"><li class="L0"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"rating"</span><span class="pln"> </span><span class="atn">data-role</span><span class="pun">=</span><span class="atv">"rating"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li></ol></pre>

    <h3>小的评级</h3>
    <div>
        <div id="rating4" data-param-rating="4" data-role="rating" class="rating small"><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)" class="rated"></a><a href="javascript:void(0)"></a></div>
    </div>
    <br>
    <pre class="prettyprint linenums span10"><ol class="linenums"><li class="L0"><span class="pln">    </span><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"rating small"</span><span class="pln"> </span><span class="atn">data-role</span><span class="pun">=</span><span class="atv">"rating"</span><span class="pln"> </span><span class="atn">data-param-rating</span><span class="pun">=</span><span class="atv">"4"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">    </span><span class="tag">&lt;/div&gt;</span></li></ol></pre>

    <p>
        要使用评级控件，需要在你页面的 <code>head</code>中加载<code>rating.js</code>。
    </p>

    <h3>方法</h3>
    <ul class="unstyled">
        <li>$('#rating1').RatingValue(val) //设置评级值</li>
        <li>$('#rating1').RatingValue() // 获取评级值</li>
        <li>$('#rating1').RatingPercents(val) // 设置评级百分比值</li>
        <li>$('#rating1').RatingPercents() // 获取评级的百分比值</li>
        <li>$('#rating3').RatingVote('on') // 设置投票功能</li>
        <li>$('#rating3').RatingVote('off') // 设置弃票功能</li>
    </ul>

</div>
</body>
</html>
