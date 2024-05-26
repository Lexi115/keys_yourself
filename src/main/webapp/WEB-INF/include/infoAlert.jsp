<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%if(session.getAttribute("info")!=null){
    for(String s: (List<String>) session.getAttribute("info")){%>
<div class="info-alert mb-4"><%=s%></div><%}%>
<%session.removeAttribute("info");
}%>
