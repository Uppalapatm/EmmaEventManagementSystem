import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ListRsvpServlet")
public class ListRsvpServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(request.getParameter("id"));
        ArrayList<String[]> rsvpList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emma_event_database", "root", "");
            

            String query = "SELECT * FROM event_rsvp WHERE event_id = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, eventId);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String[] rsvp = {
                    rs.getString("user_name"),
                    rs.getString("status")
                };
                rsvpList.add(rsvp);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("rsvpList", rsvpList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-rsvp.jsp");
        dispatcher.forward(request, response);
    }
}
