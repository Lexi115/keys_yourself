<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List" %>
<%@ page import="com.sicappiello.keysyourself.models.beans.Game" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./assets/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="WEB-INF/include/header.jsp" />
<main>
    <% for(Game g : (List<Game>) request.getAttribute("games")){ %>
        <%="Gioco: " + g.toString() + "\n\n"%>
            <%}%>
</main>
</body>
</html>