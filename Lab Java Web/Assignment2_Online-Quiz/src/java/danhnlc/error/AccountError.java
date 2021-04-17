package danhnlc.error;

public class AccountError {
    
    private String email;
    private String name;
    private String password;
    private String confirm;

    public AccountError() {
    }

    public AccountError(String email, String name, String password, String confirm) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.confirm = confirm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

}
