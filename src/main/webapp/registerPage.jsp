<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sicappiello.keysyourself.core.enums.Regex" %>
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

    <div class="regFieldContainer">

        <div class="col-4 field center col-sm-12">
            <div class="row">
                <img class="loginLogo" src="assets/images/registrati.png">
            </div>

            <jsp:include page="WEB-INF/include/errorAlert.jsp" />

        <div class="row">
            <form action="register" method="post">
                <div class="row center mb-4"> <div class="col-12"> <input class="input" type="text" name="email" placeholder="E-mail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" required></div></div>
                <div class="row center mb-4"> <div class="col-12"> <input class="input" type="password" name="password" placeholder="Password" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%_*#?&])[A-Za-z\d@$!%_*#?&]{8,}$" required></div></div>
                <div class="row center mb-4"> <div class="col-12"> <input class="input" type="text" name="name" placeholder="Nome" pattern=".{1,200}" required></div></div>
                <div class="row center mb-4"> <div class="col-12"> <input class="input" type="text" name="surname" placeholder="Cognome" pattern=".{1,50}" required></div></div>
                <div class="row center mb-4"> <div class="col-12"> <input class="input" type="text" name="address" placeholder="Indirizzo" pattern=".{1,100}" required></div></div>
                <div class="row center mb-4"> <div class="col-12"> <input class="input" type="tel" name="tel" placeholder="Telefono" pattern="^\+\d{2,6}\s?[\d\s]{10,16}$" required></div></div>
                <div class="row mb-3">
                    <div class="col-5 col-sm-12 mb-2">
                        <button type="submit" class="fieldButton clickableNoShadow"><i class="bi bi-person-plus"></i></button>
                    </div>
                    <div class="col-5 col-sm-12 offset-2">
                        <button type="reset" class="fieldButton clickableNoShadow"><i class="bi bi-arrow-clockwise"></i></button>
                    </div>
                </div>
        </form>
        </div>
        Sei già registrato? <a href="loginPage.jsp">Fai il login</a>
    </div>
    </div>

</main>



</body>
</html>
