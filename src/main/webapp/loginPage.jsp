<%--
  Created by IntelliJ IDEA.
  User: cappi
  Date: 26/04/2024
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page  contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
</head>
<body>
<h1> fai sto login bro!! o registrati</h1>

<%if(session.getAttribute("info")!=null){%>
<p style="color:green;"><%=((String) session.getAttribute("info"))%></p>
<%}%>

<fieldset>
    <legend>Login</legend>
    <form action="login" method="post">
        E-mail<input type="email" name="email" required>
        Password<input type="password" name="password" required>
        <input type="submit"><input type="reset">
    </form>

    <%if(session.getAttribute("error")!=null){%>
    <p style="color:red;"><%=((String) session.getAttribute("error"))%></p>
    <%}%>

</fieldset>

<fieldset>
    <legend>Registrati</legend>
    <form action="register" method="post">
        E-mail<input type="email" name="email" required>
        Password<input type="password" name="password" required>
        Name<input type="text" name="name" required>
        Address<input type="text" name="address" required>
        Phone number<input type="tel" name="tel" required>
        <input type="submit"><input type="reset">
    </form>
</fieldset>


</body>
</html>
