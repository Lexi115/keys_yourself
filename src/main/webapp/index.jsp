<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JSP - Hello World</title>
    <link href="./assets/css/style.css" rel="stylesheet">
</head>
<body>


<div class="row sticky">
    <div class="navbar col-12">
        <div class="col-lg-2 col-sm-11">
            <img class="logo" src="assets/images/logo.png">
        </div>
        <div class="col-lg-8 col-md-0">
            <input class="searchbar" type="text"><input type="button" value="sls">
        </div>
        <div class="col-lg-2 col-md-0">
            <a href="login"><button>Login</button></a>
        </div>
        <div class="col-lg-0 col-md-1">
            <input type="button" value="nig">
        </div>

    </div>
</div>

<%if((session.getAttribute("user")!=null)){%>
    <%=session.getAttribute("user").toString()%>
<%}%>


<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>