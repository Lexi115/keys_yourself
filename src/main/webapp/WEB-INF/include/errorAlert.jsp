<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%if(session.getAttribute("error")!=null){%>
    <div class="error-alert mb-4">
        <ul>
   <%for(String s: (List<String>) session.getAttribute("error")){%>
            <li style="margin-bottom: 2px"><%=s%></li><%}%>
        </ul>
    </div>
<%session.removeAttribute("error");
}%>
