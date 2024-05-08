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
        <div class="col-4">

        </div>

        <div class="col-4 field center">
            <div class="row">
                <img class="loginLogo" src="assets/images/login.png">
            </div>


            <%if(session.getAttribute("error")!=null){
                for(String s: (List<String>) session.getAttribute("error")){%>
            <p style="color:red;"><%=s%></p><%}%>
            <%session.removeAttribute("error");
            }%>


            <div class="row">
                <form action="login" method="post">
                    <div class="row"><i class="bi bi-envelope"></i> <input type="text" name="email" ></div>
                    <div class="row"><i class="bi bi-key"></i> <input class="row" type="password" name="password" ></div>
                <input class="row" type="submit"><input type="reset">
                </form>
            </div>
            Non sei registrato? <a href="registerpage.jsp">Registrati</a>
        </div>

        <div class="col-4">

        </div>
    </div>
</main>



</body>
</html>
