<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/08/2020
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Remove game</title>
</head>
<body style="background-image: linear-gradient(#ff3737, #ffbdbd)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarFootballList.jsp"/>

<div class="container">
    <h1 style="color: #2A2A2A">Remove item</h1>
    <div>
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>

<%--        <p>--%>
<%--            <a href="homeServlet">Back to home</a>--%>
<%--        </p>--%>

        <form method="post">
            <fieldset>
                <legend style="color: #2A2A2A">${requestScope.item.name}</legend>
                <table class="table table-borderless table-hover">
                    <tr>
                        <th class="w-25" scope="row">Name: </th>
                        <td class="w-75">${requestScope.item.name}</td>
                    </tr>
                    <tr>
                        <th scope="row">Category: </th>
                        <td>${requestScope.item.category}</td>
                    </tr>
                    <tr>
                        <th scope="row">Description: </th>
                        <td>${requestScope.item.description}</td>
                    </tr>

                    <tr>
                        <th scope="row">Price: </th>
                        <td>${requestScope.item.price}</td>
                    </tr>
                    <tr>
                        <th scope="row">Discount: </th>
                        <td>${requestScope.item.discount}</td>
                    </tr>

                        <th scope="row">Image of Item: </th>
                        <td>${requestScope.item.imgItem}</td>
                    </tr>

                    <tr>
                        <td colspan="2" class="text-center"><input class="btn btn-warning" type="submit" value="Remove this item"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
