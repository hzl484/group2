<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/18
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网站后台管理系统</title>
    <link href="../../css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/jquery.js"></script>
</head>
<div class="rightinfo">
<div class="#">

    <div class="tiptop"><span>提示信息</span><a></a></div>

    <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
            <p>${information}</p>
            <cite>稍等一下哦！</cite>
        </div>
    </div>
    <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" onclick="dele()" />&nbsp;
        <input name="" type="button"  class="cance" value="取消" />
    </div>

</div>
</div>
</html>
<script>
    function dele() {
        document.location="/modify";
    }
</script>
