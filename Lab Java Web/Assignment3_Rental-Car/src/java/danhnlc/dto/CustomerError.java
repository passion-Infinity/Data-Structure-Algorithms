package danhnlc.dto;

public class CustomerError {

    private String emailError, fullnameError, confirm, phoneError, addressError;

    public CustomerError() {
    }

    public CustomerError(String emailError, String fullnameError, String confirm, String phoneError, String addressError) {
        this.emailError = emailError;
        this.fullnameError = fullnameError;
        this.confirm = confirm;
        this.phoneError = phoneError;
        this.addressError = addressError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getFullnameError() {
        return fullnameError;
    }

    public void setFullnameError(String fullnameError) {
        this.fullnameError = fullnameError;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
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

}
