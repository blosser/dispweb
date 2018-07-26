<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <script src="js/jquery-ui.min.js"></script>

    <script src="js/i18n/datepicker-ru.js"></script>

    <script>
        $(function () {
            $(".widget input[type=submit], .widget a").button();
        });

        function report(id) {
            $("#report" + id).submit();
        }
    </script>

</head>
<%!
    String isChecked(String val1, String val2) {
        return val1.equals(val2) ? "checked" : "";
    }
%>
<table>
    <tr>
        <td>
            <fieldset>
                <legend>Бумага</legend>
                <label for="radio4">
                    <input type="radio" name="radiop" id="radio4"
                           value="0" <%=isChecked(request.getParameter("radiop"),"0")%>>
                    A4
                </label>
                <label for="radio3">
                    <input type="radio" name="radiop" id="radio3"
                           value="1" <%=isChecked(request.getParameter("radiop"),"1")%>>
                    A3
                </label>
                <label for="radio2">
                    <input type="radio" name="radiop" id="radio2"
                           value="2" <%=isChecked(request.getParameter("radiop"),"2")%>>
                    A2
                </label>
            </fieldset>
        </td>
    </tr>
    <tr>
        <td>
            <fieldset>
                <legend>Ориентация</legend>
                <label for="radiob">
                    <input type="radio" name="radioo" id="radiob"
                           value="0" <%=isChecked(request.getParameter("radioo"),"0")%>>
                    Книжная
                </label>
                <label for="radioa">
                    <input type="radio" name="radioo" id="radioa"
                           value="1" <%=isChecked(request.getParameter("radioo"),"1")%>>
                    Альбомная
                </label>
            </fieldset>
        </td>
    </tr>
    <tr>
        <td>
            <fieldset>
                <legend>Формат</legend>
                <label for="radiof1">
                    <input type="radio" name="radiof" id="radiof1" value="2" checked>
                    По умолчанию
                </label>
                <label for="radiof2">
                    <input type="radio" name="radiof" id="radiof2" value="1">
                    PDF
                </label>
            </fieldset>
        </td>
    </tr>
</table>
<div class="widget">
    <a onclick="report(<%=request.getParameter("formid")%>);">Выполнить</a>
    <%
        if ("102".equals(request.getParameter("formid"))) {
    %>
    <input type="submit" name="diagram" value="Диаграмма">
    <%
        }
    %>
</div>