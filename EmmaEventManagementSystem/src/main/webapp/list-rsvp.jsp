<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<%
    ArrayList<String[]> rsvpList = (ArrayList<String[]>) request.getAttribute("rsvpList");

    String eventId = request.getParameter("id");
    String eventName = "";
    String eventLocation = "";
    String eventDate = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emma_event_database", "root", "");

        String query = "SELECT name, date, location FROM event WHERE id=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, Integer.parseInt(eventId));
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            eventName = rs.getString("name");
            eventDate = rs.getString("date");
            eventLocation = rs.getString("location");
        }
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>RSVP List for <%= eventName %></title>
    <link rel="stylesheet" href="stylesheets/style.css">
    <style>
        
        h1, h2 {
            text-align: center;
            color: #6A0DAD;
        }

        p {
            text-align: center;
            font-size: 18px;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th {
            background-color: #6A0DAD;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            padding: 15px;
            background-color: #282C35;
            color: white;
            font-size: 14px;
        }

        .no-data {
            text-align: center;
            padding: 15px;
            color: #ff4d4d;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="brand">Emma's EventSphere</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="add-event.jsp">Create New Event</a>
        <a href="search-event.jsp" class="active">Search</a>
    </div>
</div>

<div class="container">
    <h1>RSVP List for "<%= eventName %>"</h1>
    <p><strong>Event Date:</strong> <%= eventDate %> </p>
    <p><strong>Location:</strong> <%= eventLocation %></p>

    <h2>Attendee List</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Status</th>
        </tr>
        <% if (rsvpList.size() > 0) { %>
            <% for (String[] rsvp : rsvpList) { %>
            <tr>
                <td><%= rsvp[0] %></td>
                <td><%= rsvp[1] %></td>
            </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="2" class="no-data">No RSVPs found for this event.</td>
            </tr>
        <% } %>
    </table>
</div>

<div class="footer">
    &copy; 2025 Emma's EventSphere
</div>

</body>
</html>
