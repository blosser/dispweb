<%@ page import="java.net.URLDecoder" %>
<%
    String userName = null;
    String sessionid = null;
    Cookie[] cks = request.getCookies();
    if (cks != null) {
        for (int i = 0; i < cks.length; i++) {
            String name = cks[i].getName();
            String value = cks[i].getValue();
            if (name.equals("auth"))
                userName = URLDecoder.decode(value, "UTF-8");
            else if (name.equals("sessionid"))
                sessionid = value;
        }
        if (sessionid == null) {
            response.sendRedirect("login.jsp?msg=3");
            return;
        }
        if (userName == null) {
            response.sendRedirect("login.jsp?msg=2");
            return;
        }
    } else {
        response.sendRedirect("login.jsp?msg=2");
        return;
    }
%>