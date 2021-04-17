package danhnlc.dto;

public class UserError {

    private String userIDError;
    private String passwordError;

    public UserError() {
    }

    public UserError(String userIDError, String passwordError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

}
