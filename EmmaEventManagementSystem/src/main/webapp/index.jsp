<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>

<html>
<head>
    <title>EventSphere - Manage Your Events</title>
    <link rel="stylesheet" href="stylesheets/style.css">
    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this event?")) {
                window.location.href = "DeleteEventServlet?id=" + id;
            }
        }
    </script>
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

<div class="hero-section">
    <h1>Welcome to Emma's EventSphere Tool</h1>
    <p>One stop solution for Event Data Management</p>
    <a href="add-event.jsp" class="btn-primary">Create an Event Now</a>
</div>

<section class="features">
    <div class="feature-box">
        <h3>Instant Notifications</h3>
        <p>Get real-time updates on upcoming events and RSVP changes.</p>
    </div>
    <div class="feature-box">
        <h3>Easy Venue Booking</h3>
        <p>Find and book event spaces with ease.</p>
    </div>
    <div class="feature-box">
        <h3>Seamless RSVP</h3>
        <p>Manage your guest lists efficiently and keep track of attendees.</p>
    </div>
</section>

<div class="container">
    <h2>Upcoming Events</h2>
    <div class="event-grid">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emma_event_database", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM event WHERE date >= CURDATE() ORDER BY date ASC");

                while (rs.next()) {
        %>
        <div class="event-card">
	        <div class="event-details">
	            <h3><%= rs.getString("name") %></h3>
	            <p><strong>Date:</strong> <%= rs.getString("date") %></p>
	            <p><strong>Type:</strong> <%= rs.getString("type") %></p>
	            <p><strong>Location:</strong> <%= rs.getString("location") %></p>
            </div>
            <br>
            <div class="event-actions">
                <a class="action-link edit-link" href="edit-event.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a class="action-link delete-link" onclick="confirmDelete(<%= rs.getInt("id") %>)">Delete</a>
                <a class="action-link rsvp-link" href="event-rsvp.jsp?id=<%= rs.getInt("id") %>">RSVP</a>
            </div>
        </div>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</div>

<section class="testimonials">
    <h2>What People Say</h2>
    <div class="testimonial-box">
        <p>"Emma made my wedding planning so much easier! Highly recommend!"</p>
        <span>- Sarah W.</span>
    </div>
    <br>
    <div class="testimonial-box">
        <p>"Emma is the best person for corporate events. Seamless management and great service."</p>
        <span>- Mark R.</span>
    </div>
</section>

<div class="footer">
    &copy; 2025 Emma's EventSphare
</div>

</body>
</html>
