<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/08/2020
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
<h1>Login</h1>
<form action="/login" method="get">
    <center>
    UserName: <input type="text" name="txt_username"/><br>
    Password: <input type="text" name="txt_password"/><br>
    <input type="submit" value="Login">
    </center>
</form>
</body>
</html>
