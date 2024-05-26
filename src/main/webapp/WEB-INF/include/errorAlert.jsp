<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%if(session.getAttribute("error")!=null){
    for(String s: (List<String>) session.getAttribute("error")){%>
<div class="error-alert mb-4"><%=s%></div><%}%>
<%session.removeAttribute("error");
}%>
