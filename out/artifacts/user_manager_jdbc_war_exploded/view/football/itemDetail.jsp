<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/08/2020
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <c:import url="../component/head.jsp"/>
    <title>${requestScope.item.name}</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="view/component/css/detail-slide.js"></script>

</head>
<body style="background-image: linear-gradient(#5aabd0, #ffffff);">

<%--Header--%>
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarItemDetail.jsp"/>
<!--Content-->

<div class="container">
    <h1 style="color: #2A2A2A">${requestScope.item.name}</h1>
</div>

<div class="card h-10 bg-dark">
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

<a href="buyItemServlet?action=buy&id=${requestScope.item.id}">
    <button type="button" class="btn btn-primary" style="width: 200px; height: 60px; margin-right: 0">BUY NOW</button>
</a>

<div class="container table-responsive">
    <table class="table table-borderless">
        <tbody>
        <tr>
            <th scope="row"><h2><small>Item detail: </small></h2></th>
            <td><h2><small>${requestScope.item.description}</small></h2></td>
        </tr>
        <tr>
            <th scope="row"><h2><small>Category: </small></h2></th>
            <td><h2><small>${requestScope.item.category}</small></h2></td>
        </tr>

        </tbody>
    </table>
</div>

<%--Footer--%>
<c:import url="../component/footer.jsp"/>
</body>
</html>