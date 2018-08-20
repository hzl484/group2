<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/17
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>新增用户</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="place">
    <span>位置:</span>
    <ul class="placeul">
        <li><a href="/html/index.html">首页</a></li>
        <li><a href="/html/addjob.html">新增用户</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>用户信息</span></div>
    <form action="/add">

    <ul class="forminfo">
        <li><label>用户姓名</label><input name="username" type="text" class="dfinput" /><i>姓名不能空</i></li>
        <li><label>用户密码</label><input name="password" type="text" class="dfinput" /><i>密码不能空</i></li>
        <li><label>用户ID</label><input name="id" type="text" class="dfinput" /><i></i></li>
        <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认新增"/></li>
    </ul>
    </form>

</div>
</body>
</html>
