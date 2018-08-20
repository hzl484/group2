<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/17 0017
  Time: 下午 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>新增就业信息</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="place">
    <span>位置:</span>
    <ul class="placeul">
        <li><a href="main.jsp">首页</a></li>
        <li><a href="addEmployee.jsp">新增员工信息</a></li>
    </ul>
</div>

<div class="formbody">
    <form id="add_form" method="post">
        <div class="formtitle"><span>新增员工信息</span></div>

        <ul class="forminfo">
            <li><label>员工编号</label><input name="id" type="text" class="dfinput" /><i>编号不能为空</i></li>
            <li><label>员工姓名</label><input name="name" type="text" class="dfinput" /><i>姓名不能空</i></li>
            <li><label>员工性别</label><input name="sex" type="text" class="dfinput" /><i>性别不能空</i></li>
            <li><label>员工年龄</label><input name="age" type="text" class="dfinput" /><i>年龄不能空</i></li>
            <li><label>身份证号</label><input name="idCardNum" type="text" class="dfinput" /><i>身份证号不能空</i></li>
            <li><label>员工住址</label><input name="address" type="text" class="dfinput" /></li>
            <li><label>手机号码</label><input name="mobile" type="text" class="dfinput" /></li>
            <li><label>电子邮箱</label><input name="email" type="text" class="dfinput" /></li>
            <li><label>员工学历</label><input name="education" type="text" class="dfinput" /></li>
            <li><label>入职时间</label><input name="entryTime" type="text" class="dfinput" /><i>时间不能为空</i></li>
            <li><label>员工状态</label><input name="status" type="text" class="dfinput" /><i>状态不能为空</i></li>
            <li><label>员工职位</label><input name="careerId" type="text" class="dfinput" /><i>职位不能为空</i></li>
            <li><label>所属部门</label><input name="departmentId" type="text" class="dfinput" /><i>部门不能为空</i></li>
            <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认新增" onclick="addSubmit()" /></li>

        </ul>

    </form>
</div>
</body>
</html>
<script language="JavaScript" src="/js/jquery.js"></script>
<script>
    function addSubmit() {
        $.ajax({
            dataType: "json",
            type: "post",
            url: "/employee/add",
            data: $("#add_form").serialize(),
            success: function (msg) {
                if (msg === 1) {
                    alert("数据添加成功")
                    window.open("/employee/show","_self")
                } else {
                    alert("数据添加失败")
                }
            }
        })
    }
</script>
