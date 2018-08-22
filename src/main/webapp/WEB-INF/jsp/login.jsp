<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/17
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎登录后台管理系统--模板之家 www.cssmoban.com</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="/js/jquery.js"></script>
    <script src="/js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
        });
    </script>

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>欢迎登录后台管理界面平台</span>
    <ul>
        <li><a href="#">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>

<div class="loginbody">

    <span class="systemlogo"></span>
    <form action="/loginView" method="post" name="userForm" onsubmit="return checkForm()">
    <div class="loginbox">
        <ul>
            <li><input name="username" type="text" class="loginuser" onblur="checkUsername(this.value)"
                       onfocus="clearNameError()" id="username" value="用户名" onclick="JavaScript:this.value=''"/></li>
            <span id="usernameErrorMsg" style="color: red;font-size: 15px">${user}</span>
            <li><input name="password" type="password" class="loginpwd" onblur="checkPassword(this.value)"
                       onfocus="clearPassError()" id="password" onclick="JavaScript:this.value=''"/>
                <span id="PasswordErrorMsg" style="color: red;font-size: 15px"></span></li>
            <%--<li><input name="" type="submit" class="loginbtn" value="登录"  onclick="javascript:window.location=''"  />--%>
            <li><input name="" type="submit" class="loginbtn" value="登录"  onclick="checkAll()"  />
                <label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>
        </ul>
    </div>
    </form>
</div>
<div class="loginbm">版权所有  2013  .com 仅供学习交流，勿用于任何商业用途</div>
</body>
</html>
<script type="text/javascript">
    /*	一：
        function checkUsername(){
            //焦点事件
            //alert("检查用户名是否合法")
            //获取用户填写的用户名
            var username=document.getElementById("username").value;
            alert(username);
        }*/

    var usernameok=false;
    function checkUsername(username){
        //alert(username);
        //验证用户名不为空
        var usernameErrorMsg=document.getElementById("usernameErrorMsg");
        if(username==""){
            usernameErrorMsg.innerHTML="<font color='red'>用户名不能为空</font>";
            usernameok=false;
        }else if(username.length<3||username.length>12){
            usernameErrorMsg.innerHTML= "<font color='red'>用户名长度必须在[3-12]之间</font>";
            usernameok=false;
        }else{
            usernameErrorMsg.innerHTML= "";
            usernameok=true;
        }
    }
    function clearNameError(){
        var usernameErrorMsg=document.getElementById("usernameErrorMsg");
        usernameErrorMsg.innerHTML= "";
    }
    function checkPassword(password){
        //alert(username);
        //验证用户名不为空
        var PasswordErrorMsg=document.getElementById("PasswordErrorMsg");
        if(password==""){
            PasswordErrorMsg.innerHTML="<font color='red'>密码不能为空</font>";
            usernameok=false;
        }else if(password.length<5||password.length>16){
            PasswordErrorMsg.innerHTML= "<font color='red'>密码长度必须在[5-16]之间</font>";
            usernameok=false;
        }else{
            PasswordErrorMsg.innerHTML= "";
            usernameok=true;
        }
    }
    function clearPassError(){
        var passwordErrorMsg=document.getElementById("PasswordErrorMsg");
        passwordErrorMsg.innerHTML= "";
    }
    function checkAll(){
        return usernameok;
    }
</script>

