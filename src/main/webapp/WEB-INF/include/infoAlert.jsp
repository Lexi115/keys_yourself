<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%if(session.getAttribute("info")!=null){%>
<div class="info-alert mb-4"><%=session.getAttribute("info")%></div><%}%>
<%session.removeAttribute("info");%>
