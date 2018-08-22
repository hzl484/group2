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
    <form action="/add" onsubmit="return checkForm()">
<%--onfocus获取焦点--%>
    <ul class="forminfo">
        <li><label>用户姓名</label><input name="username" type="text" id="username" onblur="checkUsername(this.value)"
                                      onfocus="showname()"  class="dfinput" />
            <span id="isExist" style="display: inline-block;"></span><i>姓名不能空</i></li>
        <li><label>用户密码</label><input name="password" type="text" class="dfinput" /><i>密码不能空</i></li>
        <li><label>用户ID</label><input name="id" type="text" class="dfinput" /><i></i></li>
        <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认新增"/></li>
    </ul>
    </form>

</div>
</body>
</html>
<script>
    var usernameok=false;
    var username=document.getElementById("username");
    // 获取焦点时
    function showname() {
        document.getElementById("isExist").innerHTML="";
    }
    function checkUsername(username) {
        var userMsg = document.getElementById("isExist");
        if(username==""){

            userMsg.innerHTML="<font color='red'>用户名不能为空!</font>";
            usernameok=false;
        }else{
            //alert(username);
            checkname(username);
        }
    }
    function checkForm(){
        return usernameok;
    }
    function checkname() {
        //通过标记的id名获取元素document.getElementById("id名")
        alert(username);
        //2.去服务端校验用户名是否存在
        //运用ajax连接后台运行JAVA代码
        var xmlhttp;
        if (window.XMLHttpRequest) {
            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp = new XMLHttpRequest();
        } else {
            // IE6, IE5 浏览器执行代码
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //2.绑定监听  --监听服务器是否已经返回响应的数据
        xmlhttp.onreadystatechange = function() {
            //5.接收响应的数据
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var isok = xmlhttp.responseText;
                if(isok=="no"){
                    document.getElementById("isExist").innerHTML="<font color='red'>该用户名不可用！</font>";
                    usernameok=false;
                }else{
                    document.getElementById("isExist").innerHTML="<font color='green'>可用!</font>";
                    usernameok=true;
                }
            }
        }
        //3.绑定地址
        xmlhttp.open("GET","http://localhost:8080/verification?username="+username,true);
        //4.向服务器发送请求
        xmlhttp.send();
    }
</script>
