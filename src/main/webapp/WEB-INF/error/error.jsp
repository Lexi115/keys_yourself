<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Errore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<main>
    <div class="container w-90">
        <div class="row">
            <p class="lead">Errore</p>
        </div>
        <div class="row">
            Si è verificato un errore lato server.
        </div>

        <div class="row">
            <code>
                <%=exception.getMessage()%>
                <%=exception.getCause()%>
                <%=exception.toString()%>
            </code>
        </div>
    </div>
</main>
</body>
</html>