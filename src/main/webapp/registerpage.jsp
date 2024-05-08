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

    <div class="col-4 field">
        <div class="row">
            <img class="loginLogo" src="assets/images/registrati.png">
        </div>

        <%if(session.getAttribute("error")!=null){
            for(String s: (List<String>) session.getAttribute("error")){%>
        <p style="color:red;"><%=s%></p><%}%>
        <%session.removeAttribute("error");
        }%>

        <div class="row"><form action="register" method="post">
            <div class="row">E-mail <input type="text" name="email" ></div>
            <div class="row">Password <input type="password" name="password" ></div>
            <div class="row">Name <input type="text" name="name" ></div>
            <div class="row">Surname <input type="text" name="surname" ></div>
            <div class="row">Address<input type="text" name="address" ></div>
            <div class="row">Phone number<input type="tel" name="tel" ></div>
            <div class="row"><input type="submit"><input type="reset"></div>
        </form>
        </div>
        Sei già registrato? <a href="loginPage.jsp">Fai il login</a>
    </div>

    <div class="col-4">

    </div>
    </div>
</div>

</main>



</body>
</html>
