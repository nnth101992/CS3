<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/08/2020
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <nav class="navbar navbar-expand-md navbar-light bg-primary fixed-top">

        <a class="navbar-brand" href="#">
            <img src="view/component/img/m10.png"  alt="" style="width: 40px;">
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Gallery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Hot News</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">FAQ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About us</a>
                </li>
            </ul>
            <c:set var = "loggedUserRole" scope = "session"	value="${sessionScope.loggedUser.role}"/>
            <c:set var = "loggedUserName" scope = "session"	value="${sessionScope.loggedUser.name}"/>
            <ul class="navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${loggedUserRole.equals('admin')}">
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet"><i class="fa fa-user" aria-hidden="true"></i> ADMINISTRATOR</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/footballServlet?action=login">SIGN OUT</a>
                        </li>
                    </c:when>

                    <c:when test="${loggedUserRole != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet"><i class="fa fa-user" aria-hidden="true"></i> ${loggedUserName.toUpperCase()}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/footballServlet?action=login">SIGN OUT</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="/footballServlet?action=login"><i class="fa fa-user" aria-hidden="true"></i> SIGN IN</a>
                        </li>
                    </c:otherwise>
                </c:choose>

<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">SOMETHING ELSE</a>--%>
<%--                </li>--%>
            </ul>
        </div>
    </nav>
</header>