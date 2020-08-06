<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/08/2020
  Time: 01:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <a class="nav-link" href="footballServlet?action=update&id=${requestScope.item.id}">Update item information</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="footballServlet?action=remove&id=${requestScope.item.id}">Remove item</a>
                        </li>
                    </c:when>

                    <c:when test="${loggedUserRole != null}">
                        <li>
                            <a class="nav-link" href="footballServlet">< Back to home |</a>
                        </li>
                        <li>
                            <a class="nav-link" href="#">${requestScope.item.name}</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li>
                            <a class="nav-link" href="footballServlet">< Back to home |</a>
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