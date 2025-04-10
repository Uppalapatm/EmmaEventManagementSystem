package com.event.model;
public class Event {
    private int id;
    private String name;
    private String date;
    private String location;
    private String description;
    private String eventType;

    public Event(int id, String name, String date, String location, String description, String eventType) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.location = location;
        this.description = description;
        this.eventType = eventType;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getDate() { return date; }
    public String getLocation() { return location; }
    public String getDescription() { return description; }
    public String getEventType() { return eventType; }
}
