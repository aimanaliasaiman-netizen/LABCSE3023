package Dao;

import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class UserDAO {

    // Database connection details
    private String jdbcURL = "jdbc:mysql://localhost:3306/CSE3023";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    // Method to get a connection to the database
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    // CREATE: Method to insert a new user
    public void insertUser(User user) {
        String sql = "INSERT INTO users (username, password, roles) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getRoles());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // READ: Method to select all users and return them as a List
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("username");
                String pass = rs.getString("password");
                String role = rs.getString("roles");
                users.add(new User(id, name, pass, role));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    // READ: Method to select one user by ID
    public User selectUser(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String roles = rs.getString("roles");
                    user = new User(id, username, password, roles);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // UPDATE: Method to update an existing user
    public boolean updateUser(User user) {
        boolean rowUpdated = false;
        String sql = "UPDATE users SET username = ?, password = ?, roles = ? WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getRoles());
            pstmt.setInt(4, user.getId());

            rowUpdated = pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    // DELETE: Method to delete a user by ID
    public boolean deleteUser(int id) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM users WHERE id = ?";
        
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
}