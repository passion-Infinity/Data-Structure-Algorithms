package danhnlc.dtos;

import java.io.Serializable;

public class UserError implements Serializable {

    private String usernameError;
    private String fullnameError;
    private String passwordError;
    private String roleError;
    private String confirmError;

    public UserError() {
    }

    public UserError(String usernameError, String fullnameError, String passwordError, String roleError, String confirmError) {
        this.usernameError = usernameError;
        this.fullnameError = fullnameError;
        this.passwordError = passwordError;
        this.roleError = roleError;
        this.confirmError = confirmError;
    }

    public String getUsernameError() {
        return usernameError;
    }

    public void setUsernameError(String usernameError) {
        this.usernameError = usernameError;
    }

    public String getFullnameError() {
        return fullnameError;
    }

    public void setFullnameError(String fullnameError) {
        this.fullnameError = fullnameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getRoleError() {
        return roleError;
    }

    public void setRoleError(String roleError) {
        this.roleError = roleError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

}
