<%@ page import="java.util.ArrayList" %>
<%@ page import="com.event.model.Event" %>

<%
    ArrayList<Event> events = (ArrayList<Event>) request.getAttribute("events");
%>
<html>
<head>
    <title>Search Events</title>
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
    <h1>Search Events</h1>

    <form action="SearchEventServlet" method="post">
        Name: <input type="text" name="name"><br><br>
        Event Type: 
        <select name="type">
            <option value="">Select an Event Type</option>
            <option value="Conference">Conference</option>
            <option value="Wedding">Wedding</option>
            <option value="Workshop">Workshop</option>
            <option value="Party">Party</option>
        </select><br><br>
        Location: <input type="text" name="location"><br><br>
        Date From: <input type="date" name="start_date">
        To: <input type="date" name="end_date"><br><br>
        <input type="submit" value="Search">
    </form>

    <h2>Search Results</h2>
    <% if (events != null && events.size() > 0) { %>
        <table border="1">
            <tr>
                <th>Name</th>
                <th>Date</th>
                <th>Type</th>
                <th>Location</th>
                <th>Details</th>
                <th>Options</th>
            </tr>
            <% for (Event e : events) { %>
            <tr>
                <td><%= e.getName() %></td>
                <td><%= e.getDate() %></td>
                <td><%= e.getLocation() %></td>
                <td><%= e.getDescription() %></td>
                <td><%= e.getEventType() %></td>
                <td>
                    <a href="ListRsvpServlet?id=<%= e.getId() %>">Check RSVP list</a>
                </td>
            </tr>
            <% } %>
        </table>
    <% } else { %>
        <p style="text-align: center">No events found based on your search criteria.</p>
    <% } %>
    </div>
    
<div class="footer">
    &copy; 2025 Emma's EventSphare
</div>
</body>
</html>
