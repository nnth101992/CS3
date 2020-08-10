<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/08/2020
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>LEO BOUTIQUE</title>
</head>
<body style="background-image: linear-gradient(#f8f7f7, #101010)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarFootballList.jsp"/>

<div class="container-fluid">
    <div class="mx-lg-5 px-lg-4 mt-5 py-2">
        <p class="display-4" style="color: #2A2A2A; margin-bottom: 30px">All Items</p>
        <div class="col-12">
            <c:set var="items" value="${requestScope.itemList}"/>
            <c:choose>
                <c:when test="${items.size() != 0}">
                    <div class="row row-cols-2 row-cols-xl-5 row-cols-lg-4 row-cols-md-3 row-cols-sm-2 row-cols-xs-1">
                        <c:forEach items="${items}" var="item">
                            <div class="col mb-2 hover12">
                                <div class="card h-100 bg-dark">
                                    <a href="footballServlet?action=detail&id=${item.id}">
                                        <img src="<c:url value="${item.imgItem}"/>" class="card-img-top" alt="...">
                                        <div class="card-body bg-dark text-white">
                                            <h4 class="card-title font-weight-normal" style="height: 40px"><small>${item.name}</small></h4>
                                            <table class="card-body text-white">
                                                <tr>
                                                    <td style="width: 100px" rowspan="2"><button type="button" class="btn btn-outline-light" disabled style="width: 80px; height: 40px">-${item.discount}%</button></td>
                                                    <td>
                                                        <p class="card-text font-weight-light" style="text-decoration: line-through"><small>$ ${item.price}</small></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h6 class="card-text font-weight-light">$ ${item.sellPrice}</h6>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="container-fluid text-center">
                        <p class="display-4" style="color: #2A2A2A; margin-bottom: 30px">Item not found</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>


<%--Footer--%>
<c:import url="../component/footer.jsp"/>
</body>
</html>
