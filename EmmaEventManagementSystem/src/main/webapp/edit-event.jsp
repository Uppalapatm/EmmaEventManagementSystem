<%@ page import="java.sql.*" %>
<%@ page import="com.event.model.Event" %>

<%
    int eventId = Integer.parseInt(request.getParameter("id"));
    String name = "", date = "", location = "", description = "", eventType = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emma_event_database", "root", "");

        String query = "SELECT * FROM event WHERE id=?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, eventId);
        ResultSet rs = stmt.executeQuery();

        if(rs.next()) {
            name = rs.getString("name");
            date = rs.getString("date");
            location = rs.getString("location");
            description = rs.getString("description");
            eventType = rs.getString("type");
        }
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Edit Event</title>
    <link rel="stylesheet" href="stylesheets/style.css">
</head>
<body>
<div class="navbar">
    <div class="brand">
        <span>Emma's EventSphere</span>
    </div>
    <div class="nav-links">
        <a href="index.jsp" class="active">Home</a>
        <a href="add-event.jsp">Create New Event</a>
        <a href="search-event.jsp">Search</a>
    </div>
</div>
<div class="container">
    <h1>Edit Event</h1>
    <form action="EditEventServlet" method="post">
        <input type="hidden" name="id" value="<%= eventId %>">
        Name: <input type="text" name="name" value="<%= name %>"><br><br>
        Date: <input type="date" name="date" value="<%= date %>"><br><br>
        Location: <input type="text" name="location" value="<%= location %>"><br><br>
        Description: <textarea name="description"><%= description %></textarea><br><br>
        Type: 
        <select name="type">
            <option value="Conference" <%= eventType.equals("Conference") ? "selected" : "" %>>Conference</option>
            <option value="Wedding" <%= eventType.equals("Wedding") ? "selected" : "" %>>Wedding</option>
            <option value="Workshop" <%= eventType.equals("Workshop") ? "selected" : "" %>>Workshop</option>
            <option value="Party" <%= eventType.equals("Party") ? "selected" : "" %>>Party</option>
        </select><br><br>
        <input type="submit" value="Update Event">
    </form>
    </div>
    <div class="footer">
    &copy; 2025 Emma's EventSphare
</div>
</body>
</html>
