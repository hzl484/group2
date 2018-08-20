<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/18 0018
  Time: 下午 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>修改员工信息</title>
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
    <form id="update_form" method="post">
        <div class="formtitle"><span>修改员工信息</span></div>

        <ul class="forminfo">
            <li><label>员工编号</label><input name="id" type="text" class="dfinput" value="${employee.id}"/><i>编号不能为空</i></li>
            <li><label>员工姓名</label><input name="name" type="text" class="dfinput" value="${employee.name}" /><i>姓名不能空</i></li>
            <li><label>员工性别</label><input name="sex" type="text" class="dfinput" value="${employee.sex}"/><i>性别不能空</i></li>
            <li><label>员工年龄</label><input name="age" type="text" class="dfinput" value="${employee.age}"/><i>年龄不能空</i></li>
            <li><label>身份证号</label><input name="idCardNum" type="text" class="dfinput" value="${employee.idcardnum}" /><i>身份证号不能空</i></li>
            <li><label>员工住址</label><input name="address" type="text" class="dfinput" value="${employee.address}" /></li>
            <li><label>手机号码</label><input name="mobile" type="text" class="dfinput" value="${employee.mobile}"/></li>
            <li><label>电子邮箱</label><input name="email" type="text" class="dfinput" value="${employee.email}"/></li>
            <li><label>员工学历</label><input name="education" type="text" class="dfinput" value="${employee.education}" /></li>
            <li><label>入职时间</label><input name="entryTime" type="text" class="dfinput" value="${employee.entrytime}"/><i>入职时间不能为空</i></li>
            <li><label>员工状态</label><input name="status" type="text" class="dfinput" value="${employee.status}"/><i>状态不能为空</i></li>
            <li><label>员工职位</label><input name="careerId" type="text" class="dfinput" value="${employee.careerid}"/><i>职位不能为空</i></li>
            <li><label>所属部门</label><input name="departmentId" type="text" class="dfinput" value="${employee.departmentid}"/><i>部门不能为空</i></li>
            <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认修改" onclick="updateSubmit()" /></li>

        </ul>

    </form>
</div>
</body>
</html>
<script language="JavaScript" src="/js/jquery.js"></script>
<script>
    function updateSubmit() {
        $.ajax({
            dataType: "json",
            type: "post",
            url: "/employee/update",
            data: $("#update_form").serialize(),
            success: function (msg) {
                if (msg === 1) {
                    alert("数据更新成功")
                    window.open("/employee/show")
                } else {
                    alert("数据更新失败")
                }
            }
        })
    }
</script>
