<%@ page import="java.sql.*" %>
<%@ page import="com.event.model.Event" %>

<html>
<head>
    <title>RSVP Event</title>
    <link rel="stylesheet" href="stylesheets/style.css">
</head>
<body>
<div class="navbar">
    <div class="brand">
        <span>Emma's EventSphere</span>
    </div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="add-event.jsp">Create New Event</a>
        <a href="search-event.jsp" class="active">Search</a>
    </div>
</div>
<div class="container">
    <h2>RSVP for Event</h2>

    <form action="EventRsvpServlet" method="post">
        <label>Your Name:</label>
        <input type="text" name="user_name" required>

        <label>Status:</label>
        <select name="status">
            <option value="Attending">Attending</option>
            <option value="Not Attending">Not Attending</option>
        </select>

        <input type="hidden" name="event_id" value="<%= request.getParameter("id") %>">
        <input type="submit" value="Submit RSVP">
    </form>
</div>
<div class="footer">
    &copy; 2025 Emma's EventSphare
</div>
</body>
</html>
