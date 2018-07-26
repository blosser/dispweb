<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>

    <link rel="icon" href="js/images/disp.gif">

    <script>
        $(function () {
            $("#header").load("header.jsp");
            $(".widget input[type=submit]").button();
        });
    </script>
</head>
<body>
<div id="header"></div>
<%
    String msg2 = "Введите имя пользователя или пароль";
    String msg = request.getParameter("msg");
    if ("1".equals(msg)) {
%>
<b>Неверное имя пользователя или пароль</b><br/><br/>
<%
} else if ("2".equals(msg)) {
%>
<b><%=msg2%></b><br/><br/>
<%
    } else if ("3".equals(msg)) {
%>
<b>Время сессии истекло. <%=msg2%></b><br/><br/>
<%
    }
%>
<div class="widget">
    <form action="login" method="post">
        Имя пользователя:<br/><input type="text" name="user" value=""/><br/>
        Пароль:<br/><input type="password" name="password" value=""/><br/><br/>
        <input type="submit" value="Войти"/>
    </form>
</div>
</body>
</html>