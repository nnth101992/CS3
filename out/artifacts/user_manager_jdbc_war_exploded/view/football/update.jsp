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
    <title>Update item information</title>
</head>
<body style="background-image: linear-gradient(#79eec8, #ffffff)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarFootballList.jsp"/>

<div class="container">
    <h1 style="color: #2A2A2A">Update item information</h1>
    <div>
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>

        <form method="post">
            <fieldset>
                <legend style="color: #2A2A2A">Item information</legend>
                <table class="table table-borderless table-hover">
                    <tr>
                        <th class="w-25" scope="row">Name: </th>
                        <td class="w-75"><input class="form-control" type="text" name="name" id="name" value="${requestScope.item.name}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Category: </th>
                        <td><input class="form-control" type="text" name="category" id="category" value="${requestScope.item.category}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Description: </th>
                        <td><input class="form-control" type="text" name="description" id="description" value="${requestScope.item.description}"></td>
                    </tr>

                    <tr>
                        <th scope="row">Price: </th>
                        <td><input class="form-control" type="text" name="price" id="price" value="${requestScope.item.price}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Discount: </th>
                        <td><input class="form-control" type="text" name="discount" id="discount" value="${requestScope.item.discount}"></td>
                    </tr>
                    <tr>

                        <th scope="row">Img Item: </th>
                        <td><input class="form-control" type="text" name="imgItem" id="imgItem" value="${requestScope.item.imgItem}"></td>
                    </tr>

                    <tr>
                        <td colspan="2" class="text-center"><input class="btn btn-primary" type="submit" value="Update item"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
