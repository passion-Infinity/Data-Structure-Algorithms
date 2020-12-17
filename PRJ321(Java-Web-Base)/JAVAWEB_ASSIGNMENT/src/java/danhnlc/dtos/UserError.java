package danhnlc.dtos;

import java.io.Serializable;

public class UserError implements Serializable {

    private String usernameError;
    private String fullnameError;
    private String passwordError;
    private String emailError;
    private String phoneError;
    private String addressError;
    private String roleIDError;

    public UserError() {
    }

    public UserError(String usernameError, String fullnameError, String passwordError, String emailError, String phoneError, String addressError, String roleIDError) {
        this.usernameError = usernameError;
        this.fullnameError = fullnameError;
        this.passwordError = passwordError;
        this.emailError = emailError;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.roleIDError = roleIDError;
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

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

}
