import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EventRsvpServlet")
public class EventRsvpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(request.getParameter("event_id"));
        String userName = request.getParameter("user_name");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emma_event_database", "root", "");

            String query = "INSERT INTO event_rsvp(event_id, user_name, status) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, eventId);
            stmt.setString(2, userName);
            stmt.setString(3, status);
            stmt.executeUpdate();
            con.close();

            response.sendRedirect("index.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
