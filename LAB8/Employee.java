package com.Model;

public class Employee {
    protected int id;
    protected String name;
    protected String email;
    protected String position;

    // Default no-argument constructor (Required for JavaBeans)
    public Employee() {}

    // Constructor without ID (Used when inserting a new employee, as DB auto-generates the ID)
    public Employee(String name, String email, String position) {
        super();
        this.name = name;
        this.email = email;
        this.position = position;
    }

    // Constructor with ID (Used when fetching existing records or updating/deleting)
    public Employee(int id, String name, String email, String position) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.position = position;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}