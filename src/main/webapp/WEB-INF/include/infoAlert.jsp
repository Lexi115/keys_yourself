<%@ page contentType="text/html;charset=UTF-8"%>
<%if(session.getAttribute("info")!=null){%>
<div class="info-alert mb-4"><%=session.getAttribute("info")%></div><%}%>
<%session.removeAttribute("info");%>
