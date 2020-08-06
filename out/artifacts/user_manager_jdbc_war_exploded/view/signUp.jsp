<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/08/2020
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Template</title>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/component/css/login.css">
</head>

<body>


<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 login-section-wrapper">

                <a href="/footballServlet">< Go back home</a>
                <div class="brand-wrapper">
                    <img src="view/component/img/m10.png" alt="logo" class="logo">
                </div>
                <div class="login-wrapper my-auto">
                    <h1 class="login-title">Sign Up</h1>
                    <form method="post">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="enter your name">
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="email" id="email" class="form-control"
                                   placeholder="enter your email">
                        </div>
                        <div class="form-group mb-4">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" class="form-control"
                                   placeholder="enter your password">
                        </div>
                        <input name="signUp" id="signUp" class="btn btn-block login-btn" type="submit" value="Sign Up">
                    </form>
                </div>
            </div>
            <div class="col-sm-6 px-0 d-none d-sm-block">
                <img src="view/component/img/login.jpg" class="login-img">
            </div>
        </div>
    </div>
</main>


<%--<script type="text/javascript">--%>
<%--    $(".textbox input").focusout(function () {--%>
<%--        if ($(this).val() == "") {--%>
<%--            $(this).siblings().removeClass("hidden");--%>
<%--            $(this).css("background", "#554343");--%>
<%--        } else {--%>
<%--            $(this).siblings().addClass("hidden");--%>
<%--            $(this).css("background", "#484848");--%>
<%--        }--%>
<%--    });--%>

<%--    $(".textbox input").keyup(function () {--%>
<%--        var inputs = $(".textbox input");--%>
<%--        if (inputs[0].value != "" && inputs[1].value && inputs[2].value) {--%>
<%--            $(".signIn-btn").attr("disabled", false);--%>
<%--            $(".signIn-btn").addClass("active");--%>
<%--        } else {--%>
<%--            $(".signIn-btn").attr("disabled", true);--%>
<%--            $(".signIn-btn").removeClass("active")--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>


