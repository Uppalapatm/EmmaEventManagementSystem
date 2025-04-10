<html>
<head>
    <title>Add New Event</title>
    <link rel="stylesheet" href="stylesheets/style.css">
</head>
<body>

<div class="navbar">
    <div class="brand">
        <span>Emma's EventSphere</span>
    </div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="add-event.jsp"  class="active">Create New Event</a>
        <a href="search-event.jsp">Search</a>
    </div>
</div>

<div class="container">
    <h2>Add New Event</h2>

    <form action="AddEventServlet" method="post">
        <label>Event Name</label>
        <input type="text" name="name" required>

        <label>Date</label>
        <input type="date" name="date" required>

        <label>Location</label>
        <input type="text" name="location" required>
        
        <label>Description</label>
        <textarea type="text" name="description" required></textarea>

        <label>Type</label>
        <select name="type">
            <option>Conference</option>
            <option>Wedding</option>
            <option>Party</option>
            <option>Workshop</option>
        </select>

        <input type="submit" value="Add Event">
    </form>
</div>
<div class="footer">
    &copy; 2025 Emma's EventSphare
</div>
</body>
</html>
