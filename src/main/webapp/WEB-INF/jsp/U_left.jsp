<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/17
  Time: 11:22
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
            //导航切换
            $(".menuson li").click(function(){
                $(".menuson li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function(){
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if($ul.is(':visible')){
                    $(this).next('ul').slideUp();
                }else{
                    $(this).next('ul').slideDown();
                }
            });
        })
    </script>


</head>

<body style="background:#f0f9fd;">
<div class="lefttop"><span></span>功能菜单</div>

<dl class="leftmenu">

    <dd>
        <div class="title">
            <span><img src="/images/leftico01.png" /></span>用户管理
        </div>
        <ul class="menuson">

            <li><cite></cite><a href="/getAll" target="rightFrame">用户列表</a><i></i></li>
            <li><cite></cite><a href="/addUser" target="rightFrame">新增用户</a><i></i></li>
            <li><cite></cite><a href="/modify" target="rightFrame">用户操作</a><i></i></li>

        </ul>
    </dd>

</dl>
</body>
</html>