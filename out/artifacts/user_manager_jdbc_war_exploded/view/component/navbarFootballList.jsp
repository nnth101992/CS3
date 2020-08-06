<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/08/2020
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <nav class="navbar navbar-expand-md navbar-light mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <c:set var = "loggedUserRole" scope = "session"	value="${sessionScope.loggedUser.role}"/>
                <c:set var = "loggedUserName" scope = "session"	value="${sessionScope.loggedUser.name}"/>
                <c:choose>
                    <c:when test="${loggedUserRole.equals('admin')}">
                        <li>
                            <a class="nav-link" href="footballServlet">< Back to home |</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet?action=create">Add new item</a>
                        </li>
                    </c:when>

                    <c:when test="${loggedUserRole != null}">
                        <li>
                            <a class="nav-link" href="footballServlett">< Back to home |</a>
                        </li>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="buyGameServlet">Your library</a>--%>
<%--                        </li>--%>
                    </c:when>

                    <c:otherwise>
                        <li>
                            <a class="nav-link" href="footballServlet">< Back to home |</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Category</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="footballServlet?action=kit">Kit</a>
                        <a class="dropdown-item" href="footballServlet?action=shoe">Shoes</a>
                        <a class="dropdown-item" href="footballServlet?action=ball">Ball</a>
                        <a class="dropdown-item" href="footballServlet?action=trophy">Trophy</a>
                        <a class="dropdown-item" href="footballServlet?action=others">Others</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="footballServlet">All items</a>
                    </div>
                </li>
            </ul>

            <form class="form-inline ml-auto" action="footballServlet?action=find" method="post">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-dark border-0" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i></span>
                    </div>
                    <input type="text" class="form-control bg-light border-0" placeholder="Find items..." aria-label="Username" aria-describedby="basic-addon1" name="findingItems" id="findingItems">
                </div>
            </form>
        </div>
    </nav>
</div>
