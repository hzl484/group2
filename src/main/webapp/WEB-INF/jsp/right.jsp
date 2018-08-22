<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/17 0017
  Time: 下午 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工列表</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".click").click(function(){
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function(){
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function(){
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function(){
                $(".tip").fadeOut(100);
            });

        });
    </script>


</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="/index">首页</a></li>
        <li><a href="/employee/show">员工列表</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li class="click"><span><img src="/images/t01.png" /></span><a href="/employee/addEmployee">添加员工信息</a></li>
        </ul>
    </div>
    <table class="tablelist">
        <thead>
        <tr>
            <th>编号<i class="sort"><img src="/images/px.gif" /></i></th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>身份证号码</th>
            <th>手机</th>
            <th>职位</th>
            <th>入职时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="emp">


        <tr>
            <td>${emp.id}</td>
            <td>${emp.name}</td>
            <td>${emp.sex}</td>
            <td>${emp.age}</td>
            <td>${emp.idcardnum}</td>
            <td>${emp.mobile}</td>
            <td>${emp.careerid}</td>
            <td>${emp.entrytime}</td>
            <td><a href="/employee/showDetail?id=${emp.id}" class="tablelink">修改</a></td>
        </tr>
        </c:forEach>


        </tbody>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue">${pageInfo.total}</i>条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum}&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="/employee/show?pageNum=${pageInfo.firstPage}">首页</a></li>
            <li class="paginItem"><a href="/employee/show?pageNum=${pageInfo.prePage}">上一页</a></li>
            <li class="paginItem"><a href="/employee/show?pageNum=${pageInfo.nextPage}">下一页</a></li>
            <li class="paginItem"><a href="/employee/show?pageNum=${pageInfo.lastPage}">尾页</a></li>
        </ul>
    </div>


    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="/images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>

        <div class="tipbtn">
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
        </div>

    </div>

</div>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
