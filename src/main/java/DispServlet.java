import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;

@WebServlet("/disp")
public class DispServlet extends HttpServlet {

    public static String HOST_NAME = "http://ora10.ittrans.ru:8080/disp";//developern.ittrans.ru ora10.ittrans.ru

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String radiop = request.getParameter("radiop");
        String radioo = request.getParameter("radioo");
        String radiof = request.getParameter("radiof");
        String diagram = request.getParameter("diagram");
        String sessionid = null;
        Cookie[] cookie = request.getCookies();
        if (cookie!=null)
        for (Cookie c:cookie)
            if ("sessionid".equals(c.getName())) {
                sessionid = c.getValue();
                break;
            }

        if (sessionid==null)
            response.sendRedirect("login.jsp?msg=3");
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("check.jsp");
//        dispatcher.include(request, response);

        //System.out.println("dispweb id=" + id);
        String sql2 = "";

        if ("6".equals(id)) {
            String cbtransport6 = request.getParameter("cbtransport6");
            String datepicker6a = request.getParameter("datepicker6a");
            String datepicker6b = request.getParameter("datepicker6b");
            sql2 = "&cbtransport6=" + cbtransport6 +
                    "&datepicker6a=" + datepicker6a +
                    "&datepicker6b=" + datepicker6b;
        } else if ("102".equals(id)) {
            String cbtransport102 = request.getParameter("cbtransport102");
            String datepicker102a = request.getParameter("datepicker102a");
            String datepicker102b = request.getParameter("datepicker102b");
            String cbdaytype102 = request.getParameter("cbdaytype102");
            sql2 = "&cbtransport102=" + cbtransport102 +
                    "&datepicker102a=" + datepicker102a +
                    "&datepicker102b=" + datepicker102b +
                    "&cbdaytype102=" + cbdaytype102;
            if (diagram != null) {
                radiof = "2";
                sql2 += "&diagram=1";
            }
        } else if ("1".equals(id)) {
            String cbtransport1 = request.getParameter("cbtransport1");
            String datepicker1 = request.getParameter("datepicker1");
            String cbxnofreeroute1 = request.getParameter("cbxnofreeroute1");
            sql2 = "&cbtransport1=" + cbtransport1 +
                    "&datepicker1=" + datepicker1 +
                    "&cbxnofreeroute1=" + cbxnofreeroute1;
        } else if ("40".equals(id)) {
            String datepicker40 = request.getParameter("datepicker40");
            sql2 = "&datepicker40=" + datepicker40;
        } else if ("41".equals(id)) {
            String cbtransport41 = request.getParameter("cbtransport41");
            String datepicker41a = request.getParameter("datepicker41a");
            String datepicker41b = request.getParameter("datepicker41b");
            sql2 = "&cbtransport41=" + cbtransport41 +
                    "&datepicker41a=" + datepicker41a +
                    "&datepicker41b=" + datepicker41b;
        } else if ("39".equals(id)) {
            String cbtransport39 = request.getParameter("cbtransport39");
            String datepicker39 = request.getParameter("datepicker39");
            String cbxfiat39 = "on".equals(request.getParameter("cbxfiat39")) ? "1" : "0";
            sql2 = "&cbtransport39=" + cbtransport39 +
                    "&datepicker39=" + datepicker39 +
                    "&cbxfiat39=" + cbxfiat39;
        } else if ("10".equals(id)) {
            String cbtransport10 = request.getParameter("cbtransport10");
            String datepicker10a = request.getParameter("datepicker10a");
            String datepicker10b = request.getParameter("datepicker10b");
            String cbdaytype10 = request.getParameter("cbdaytype10");
            String cbxnofreeroute10 = "on".equals(request.getParameter("cbxnofreeroute10")) ? "1" : "0";
            sql2 = "&cbtransport10=" + cbtransport10 +
                    "&datepicker10a=" + datepicker10a +
                    "&datepicker10b=" + datepicker10b +
                    "&cbdaytype10=" + cbdaytype10 +
                    "&cbxnofreeroute10=" + cbxnofreeroute10;
        } else if ("17".equals(id)) {
            String cbtransport17 = request.getParameter("cbtransport17");
            String datepicker17a = request.getParameter("datepicker17a");
            String datepicker17b = request.getParameter("datepicker17b");
            String cbdaytype17 = request.getParameter("cbdaytype17");
            String cbxnofreeroute17 = "on".equals(request.getParameter("cbxnofreeroute17")) ? "1" : "0";
            sql2 = "&cbtransport17=" + cbtransport17 +
                    "&datepicker17a=" + datepicker17a +
                    "&datepicker17b=" + datepicker17b +
                    "&cbdaytype17=" + cbdaytype17 +
                    "&cbxnofreeroute17=" + cbxnofreeroute17;
        }

        String str = "/disp?id=" + id + "&radiop=" + radiop +
                "&radioo=" + radioo + "&radiof=" + radiof +
                "&sessionid=" + sessionid + sql2;
        String urlstr = HOST_NAME+ str;

        System.out.println(urlstr);

        URL url = new URL(urlstr);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        Long rf = Long.valueOf(radiof);
        boolean isPdf = new Long(1l).equals(rf);
        boolean isHtml = new Long(2l).equals(rf);
        try (InputStream inStream = connection.getInputStream();
             OutputStream outStream = response.getOutputStream()) {

            if (isPdf) {
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", "report.pdf");
                response.setHeader(headerKey, headerValue);
            } else if (isHtml) {
                response.setContentType("text/html; charset=UTF-8");
                //response.setCharacterEncoding("UTF-8");
            }

            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = inStream.read(buffer)) != -1)
                outStream.write(buffer, 0, bytesRead);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}