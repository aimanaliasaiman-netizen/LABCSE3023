package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Model.Employee;

public class EmployeeDAO {
    // Database credentials matching the lab setup
    private String jdbcURL = "jdbc:mysql://localhost:3306/Company"; 
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin"; // Change this if your local MySQL root password is different

    // SQL Queries
    private static final String INSERT_EMPLOYEES_SQL = "INSERT INTO employees (name, email, position) VALUES (?, ?, ?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT id, name, email, position FROM employees WHERE id = ?;";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employees;";
    private static final String DELETE_EMPLOYEES_SQL = "DELETE FROM employees WHERE id = ?;";
    private static final String UPDATE_EMPLOYEES_SQL = "UPDATE employees SET name = ?, email = ?, position = ? WHERE id = ?;";

    public EmployeeDAO() {}

    // Establishes a database connection
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated to modern MySQL driver class
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            printSQLException(e);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // CREATE: Insert a new employee record
    public void insertEmployee(Employee employee) throws SQLException {
        System.out.println(INSERT_EMPLOYEES_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEES_SQL)) {
            
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getEmail());
            preparedStatement.setString(3, employee.getPosition());
            
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // READ: Select a single employee by ID
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String position = rs.getString("position");
                employee = new Employee(id, name, email, position);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
    }

    // READ: Select all employees from the database
    public List<Employee> selectAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES)) {
            
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String position = rs.getString("position");
                employees.add(new Employee(id, name, email, position));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    // DELETE: Delete an employee from the database
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEES_SQL)) {
            
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // UPDATE: Modify an existing employee record
    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEES_SQL)) {
            
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getEmail());
            statement.setString(3, employee.getPosition());
            statement.setInt(4, employee.getId());
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Helper method to log detailed SQL exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}