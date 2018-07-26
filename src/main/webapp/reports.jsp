<%@include file="check.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>

    <link rel="stylesheet" type="text/css" href="js/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="js/style.css"/>

    <link rel="icon" href="js/images/disp.gif">

    <script src="js/i18n/datepicker-ru.js"></script>

    <script>
        $(function () {
            $("#header").load("header.jsp");
            $("#print6").load("print.jsp", {'formid': '6', 'radiop': '0', 'radioo': '1'});
            $("#print102").load("print.jsp", {'formid': '102', 'radiop': '1', 'radioo': '1'});
            $("#print1").load("print.jsp", {'formid': '1', 'radiop': '2', 'radioo': '1'});
            $("#print40").load("print.jsp", {'formid': '40', 'radiop': '2', 'radioo': '1'});
            $("#print41").load("print.jsp", {'formid': '41', 'radiop': '1', 'radioo': '1'});
            $("#print39").load("print.jsp", {'formid': '39', 'radiop': '0', 'radioo': '0'});
            $("#print10").load("print.jsp", {'formid': '10', 'radiop': '2', 'radioo': '1'});
            $("#print17").load("print.jsp", {'formid': '17', 'radiop': '2', 'radioo': '0'});

            $(".widget input[type=submit]").button();

            setdatepicker("#datepicker6a");
            setdatepicker("#datepicker6b");
            setdatepicker("#datepicker102a");
            setdatepicker("#datepicker102b");
            setdatepicker("#datepicker1");
            setdatepicker("#datepicker40");
            setdatepicker("#datepicker41a");
            setdatepicker("#datepicker41b");
            setdatepicker("#datepicker39");
            setdatepicker("#datepicker10a");
            setdatepicker("#datepicker10b");
            setdatepicker("#datepicker17a");
            setdatepicker("#datepicker17b");

            $("#accordion").accordion({
                active: false,
                collapsible: true,
                heightStyle: "content"
            });
        });

        function setdatepicker(dp) {
            $(dp).datepicker({
                changeMonth: true,
                changeYear: true
            });
            $(dp).datepicker("option", "dateFormat", "dd.mm.yy");
            $(dp).datepicker($.datepicker.regional["ru"]);
            $(dp).datepicker("setDate", new Date(2018, 1, 5));
        }
    </script>

</head>
<body>
<div id="header"></div>
<div class="widget" align="right">
    <form action="login?msg=logout" method="post">
        Пользователь: <b><%=userName%></b> <input type="submit" value="Выйти"/>
    </form>
</div>
<div id="accordion">
    <h3>Выпуск для руководства</h3>
    <div>
        <form id="report102" action="disp?id=102" method="post" target="_blank">
            <table>
                <tr>
                    <td>Вид транспорта</td>
                    <td>
                        <select name="cbtransport102" id="cbtransport102">
                            <option value="1" selected>Автобус</option>
                            <option value="2">Троллейбус</option>
                            <option value="3">Трамвай</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Тип дня</td>
                    <td>
                        <select name="cbdaytype102" id="cbdaytype102">
                            <option value="1" selected>Будни</option>
                            <option value="2">Выходные</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Дата с</td>
                    <td><input type="text" name="datepicker102a" id="datepicker102a"> по <input type="text"
                                                                                                name="datepicker102b"
                                                                                                id="datepicker102b">
                    </td>
                </tr>
            </table>
            <div id="print102"></div>
        </form>
    </div>
    <h3>Выпуск на утро 7:15</h3>
    <div>
        <form id="report6" action="disp?id=6" method="post" target="_blank">
            <table>
                <tr>
                    <td>Вид транспорта</td>
                    <td><select name="cbtransport6" id="cbtransport6">
                        <option value="1" selected>Автобус</option>
                        <option value="2">Троллейбус</option>
                        <option value="3">Трамвай</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Дата с</td>
                    <td><input type="text" name="datepicker6a" id="datepicker6a"> по <input type="text"
                                                                                            name="datepicker6b"
                                                                                            id="datepicker6b"></td>
                </tr>
            </table>
            <div id="print6"></div>
        </form>
    </div>
    <h3>Выпуск по часам суток</h3>
    <div>
        <form id="report10" action="disp?id=10" method="post" target="_blank">
            <table>
                <tr>
                    <td>Вид транспорта</td>
                    <td>
                        <select name="cbtransport10" id="cbtransport10">
                            <option value="1" selected>Автобус</option>
                            <option value="2">Троллейбус</option>
                            <option value="3">Трамвай</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Тип дня</td>
                    <td>
                        <select name="cbdaytype10" id="cbdaytype10">
                            <option value="1" selected>Будни</option>
                            <option value="2">Выходные</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Дата</td>
                    <td><input type="text" name="datepicker10a" id="datepicker10a"> по <input type="text"
                                                                                              name="datepicker10b"
                                                                                              id="datepicker10b"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="cbxnofreeroute10">
                            <input type="checkbox" name="cbxnofreeroute10" id="cbxnofreeroute10">
                            Без бесплатных маршрутов
                        </label>
                    </td>
                </tr>
            </table>
            <div id="print10"></div>
        </form>
    </div>
    <h3>График работы маршрутов</h3>
    <div>
        <form id="report1" action="disp?id=1" method="post" target="_blank">
            <table>
                <tr>
                    <td>Вид транспорта</td>
                    <td><select name="cbtransport1" id="cbtransport1">
                        <option value="1" selected>Автобус</option>
                        <option value="2">Троллейбус</option>
                        <option value="3">Трамвай</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Дата</td>
                    <td><input type="text" name="datepicker1" id="datepicker1"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="cbxnofreeroute1">
                            <input type="checkbox" name="cbxnofreeroute1" id="cbxnofreeroute1">
                            Без бесплатных маршрутов
                        </label>
                    </td>
                </tr>
            </table>
            <div id="print1"></div>
        </form>
    </div>
    <h3>Задержки, ДТП и ЧП</h3>
    <div>
        <form id="report40" action="disp?id=40" method="post" target="_blank">
            <table>
                <tr>
                    <td>Дата</td>
                    <td><input type="text" name="datepicker40" id="datepicker40"></td>
                </tr>
            </table>
            <div id="print40"></div>
        </form>
    </div>
    <h3>Итоговый рапорт по бракам</h3>
    <div>
        <form id="report41" action="disp?id=41" method="post" target="_blank">
            <table>
                <tr>
                    <td>Вид транспорта</td>
                    <td><select name="cbtransport41" id="cbtransport41">
                        <option value="1" selected>Автобус</option>
                        <option value="2">Троллейбус</option>
                        <option value="3">Трамвай</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Дата с</td>
                    <td><input type="text" name="datepicker41a" id="datepicker41a"> по <input type="text"
                                                                                              name="datepicker41b"
                                                                                              id="datepicker41b"></td>
                </tr>
            </table>
            <div id="print41"></div>
        </form>
    </div>
    <h3>Недовыпуск</h3>
    <div>
        <form id="report39" action="disp?id=39" method="post" target="_blank">
            <table>
                <tr>
                    <td>Вид транспорта</td>
                    <td>
                        <select name="cbtransport39" id="cbtransport39">
                            <option value="-1" selected>Все</option>
                            <option value="1">Автобус</option>
                            <option value="2">Троллейбус</option>
                            <option value="3">Трамвай</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Дата</td>
                    <td><input type="text" name="datepicker39" id="datepicker39"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="cbxfiat39">
                            <input type="checkbox" name="cbxfiat39" id="cbxfiat39">
                            Без автобусов марки Фиат
                        </label>
                    </td>
                </tr>
            </table>
            <div id="print39"></div>
        </form>
    </div>
    <h3>Справка по рейсам</h3>
    <div>
        <form id="report17" action="disp?id=17" method="post" target="_blank">
            <table>
                <tr>
                    <td>Вид транспорта</td>
                    <td>
                        <select name="cbtransport17" id="cbtransport17">
                            <option value="1" selected>Автобус</option>
                            <option value="2">Троллейбус</option>
                            <option value="3">Трамвай</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Тип дня</td>
                    <td>
                        <select name="cbdaytype17" id="cbdaytype17">
                            <option value="1" selected>Будни</option>
                            <option value="2">Выходные</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Дата</td>
                    <td><input type="text" name="datepicker17a" id="datepicker17a"> по <input type="text"
                                                                                              name="datepicker17b"
                                                                                              id="datepicker17b"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="cbxnofreeroute17">
                            <input type="checkbox" name="cbxnofreeroute17" id="cbxnofreeroute17">
                            Без бесплатных маршрутов
                        </label>
                    </td>
                </tr>
            </table>
            <div id="print17"></div>
        </form>
    </div>
</div>
</body>
</html>