package danhnlc.dto;

public class User {

    private String userID;
    private String fullName;
    private String password;
    private String role;

    public User() {
    }

    public User(String userID, String fullName, String password, String role) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.role = role;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
