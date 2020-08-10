<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/08/2020
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <nav class="navbar navbar-expand-md navbar-light mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <c:set var = "loggedUserRole" scope = "session"	value="${sessionScope.loggedUser.role}"/>
                <c:set var = "loggedUserName" scope = "session"	value="${sessionScope.loggedUser.name}"/>
                <c:choose>
                    <c:when test="${loggedUserRole.equals('admin')}">
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet?action=detail">Administrator</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet?action=create">Add new item</a>
                        </li>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="gamesServlet">Item list</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="userManagementServlet?action=new">New user</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="userManagementServlet">Users management</a>--%>
<%--                        </li>--%>
                    </c:when>

                    <c:when test="${loggedUserRole != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="userServlet?action=detail">Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Your library</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet">Browse</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet">Browse</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <form class="form-inline ml-auto" action="footballServlet?action=find" method="post">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-dark border-0" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i></span>
                    </div>
                    <input type="text" class="form-control bg-dark border-0" placeholder="Find item..." aria-label="Username" aria-describedby="basic-addon1" name="findingItem" id="findingItem">
                </div>
            </form>
        </div>
    </nav>
</div>