<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./assets/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="WEB-INF/include/header.jsp" />
<main>
    <%if(session.getAttribute("info")!=null){%>
    <p style="color:green;">${sessionScope.info}</p>
    <%session.removeAttribute("info");
    }%>
    <div class="fieldContainer">

        <div class="col-4 field center col-sm-12">
            <div class="row">
                <img class="loginLogo" src="assets/images/login.png">
            </div>


            <%if(session.getAttribute("error")!=null){
                for(String s: (List<String>) session.getAttribute("error")){%>
            <div class="error-alert mb-4"><%=s%></div><%}%>
            <%session.removeAttribute("error");
            }%>


            <div class="row">
                <form action="login" method="post">
                    <div class="row center mb-4">
                        <div class="col-2">
                            <i class="fieldIcon bi bi-envelope"></i>
                        </div>
                        <div class="col-10">
                        <input class="input" type="text" name="email" >
                        </div>
                    </div>
                    <div class="row center mb-4">
                        <div class="col-2 ">
                            <i class="fieldIcon bi bi-key"></i>
                        </div>
                        <div class="col-10">
                        <input class="input" type="password" name="password" >
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-5 col-sm-12 mb-2">
                            <button type="submit" class="fieldButton clickableNoShadow"><i class="bi bi-door-open"></i></button>
                        </div>
                        <div class="col-5 col-sm-12 offset-2">
                            <button type="reset" class="fieldButton clickableNoShadow"><i class="bi bi-arrow-clockwise"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            Non sei registrato? <a href="registerpage.jsp">Registrati</a>
        </div>

    </div>
</main>



</body>
</html>
