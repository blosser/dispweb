import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public static final String getStrVal(String val) {
        if (val == null) return null;
        byte[] bytes = val.getBytes(StandardCharsets.ISO_8859_1);
        return new String(bytes, StandardCharsets.UTF_8);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String msg = request.getParameter("msg");
        if ("logout".equals(msg)) {
            Cookie cookie = new Cookie("sessionid", null);
            cookie.setHttpOnly(true);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            response.sendRedirect("login.jsp");
            return;
        }

        String user = getStrVal(request.getParameter("user"));
        user = URLEncoder.encode(user, "UTF-8");
        String password = getStrVal(request.getParameter("password"));
        String ipaddress = request.getRemoteAddr();
        String useragent = request.getHeader("User-Agent");

        String urlParameters = "user=" + user + "&password=" + password +
                "&ipaddress=" + ipaddress + "&useragent=" + useragent;
        //System.out.println(urlParameters);

        String urlstr = DispServlet.HOST_NAME + "/login";
        URL url = new URL(urlstr);

        URLConnection conn = url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestProperty("charset", "utf-8");
        //OutputStream outStream = response.getOutputStream();
        try (OutputStream outStream = conn.getOutputStream()) {
            outStream.write(urlParameters.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }

//        try (OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream()))
//        {
//            writer.write(urlParameters);
//            writer.flush();
//            //writer.close();
//        }

        String allData = null;
//        try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
//            allData = reader.readLine();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        try (InputStream is = conn.getInputStream()) {
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();

            int nRead;
            byte[] data = new byte[16384];

            while ((nRead = is.read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }

            buffer.flush();

            allData = new String(buffer.toByteArray(),"windows-1251");
        } catch (Exception e) {
            e.printStackTrace();
        }
        //System.out.println(allData);

        String sessionid = null;
        String name = null;

        if (allData != null) {
            String[] data = allData.split(",");
            sessionid = data[0];
            name = data[1];
        }

        if (allData==null || "null".equals(sessionid) || "null".equals(name)) {
            response.sendRedirect("login.jsp?msg=1");
            return;
        }


//        String str = "/login?user=" + user + "&password=" + password;
//        String urlstr = DispServlet.HOST_NAME+ str;
//        System.out.println(urlstr);

//        URL url = new URL(urlstr);
//        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//
//        try (InputStream inStream = connection.getInputStream();
//             OutputStream outStream = response.getOutputStream()) {
//
//            response.setContentType("text/html");
//
//            byte[] buffer = new byte[4096];
//            int bytesRead;
//
//            while ((bytesRead = inStream.read(buffer)) != -1)
//                outStream.write(buffer, 0, bytesRead);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        if (name != null && sessionid != null) {
            Cookie cookie1 = new Cookie("auth", URLEncoder.encode(name, "UTF-8"));
            cookie1.setHttpOnly(true);
            cookie1.setMaxAge(5 * 60 * 60);//5 * 60 minute
            response.addCookie(cookie1);
            Cookie cookie2 = new Cookie("sessionid", sessionid);
            cookie2.setHttpOnly(true);
            cookie2.setMaxAge(5 * 60 * 60);//60 minute
            response.addCookie(cookie2);
            response.sendRedirect("reports.jsp");
            return;
        } else {
            response.sendRedirect("login.jsp?msg=1");
            return;
        }
    }
}
