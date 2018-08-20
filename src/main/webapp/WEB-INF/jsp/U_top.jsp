<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/17
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="/js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            //顶部导航切换
            $(".nav li a").click(function(){
                $(".nav li a.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
    </script>


</head>

<body style="background:url(images/topbg.gif) repeat-x;">

<div class="topleft">
    <a href="/html/main.html" target="_parent"><img src="/images/logo.png" title="系统首页" /></a>
</div>

<ul class="nav">
    <li><a href="/html/right.html" target="rightFrame" class="selected"><img width="45px" height="45px" src="/images/icon01.png" title="员工管理" /><h2>员工管理</h2></a></li>
    <li><a href="/html/careers.html" target="rightFrame"><img src="/images/icon05.png" width="45px" height="45px" title="职位管理" /><h2>职位管理</h2></a></li>
    <li><a href="/html/departments.html" target="rightFrame"><img src="/images/icon03.png" title="部门管理" /><h2>部门管理</h2></a></li>
    <li><a href="/getAll"  target="rightFrame"><img src="/images/icon04.png" title="用户管理" /><h2>用户管理</h2></a></li>

</ul>

<div class="topright">
    <ul>
        <li><span><img src="/images/help.png" title="帮助" class="helpimg"/></span><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
        <li><a href="login" target="_parent">退出</a></li>
    </ul>

    <div class="user">
        <span>${user.username}</span>
        <i>申请消息</i>
        <b>5</b>
    </div>

</div>
</body>
</html>