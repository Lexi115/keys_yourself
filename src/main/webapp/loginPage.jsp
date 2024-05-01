<%--
  Created by IntelliJ IDEA.
  User: cappi
  Date: 26/04/2024
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List" %>

<html>
<head>
    <title>Login</title>
</head>
<body>
<h1> fai sto login bro!! o registrati</h1>

<%if(session.getAttribute("info")!=null){%>
<p style="color:green;">${sessionScope.info}</p>
<%session.removeAttribute("info");
}%>

<%if(session.getAttribute("error")!=null){
    for(String s: (List<String>) session.getAttribute("error")){%>
<p style="color:red;"><%=s%></p><%}%>
<%session.removeAttribute("error");
}%>

<fieldset>
    <legend>Login</legend>
    <form action="login" method="post">
        E-mail<input type="text" name="email" >
        Password<input type="password" name="password" >
        <input type="submit"><input type="reset">
    </form>



</fieldset>

<fieldset>
    <legend>Registrati</legend>
    <form action="register" method="post">
        E-mail<input type="text" name="email" >
        Password<input type="password" name="password" >
        Name<input type="text" name="name" >
        Surname<input type="text" name="surname" >
        Address<input type="text" name="address" >
        Phone number<input type="tel" name="tel" >
        <input type="submit"><input type="reset">
    </form>


</fieldset>


</body>
</html>
