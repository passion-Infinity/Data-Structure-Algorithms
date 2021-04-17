package danhnlc.dto;

import java.sql.Timestamp;

public class OrderDTO {

    private String id, email;
    private Timestamp date;
    private float total;
    private String status;

    public OrderDTO() {
    }

    public OrderDTO(String id, String email, Timestamp date, float total) {
        this.id = id;
        this.email = email;
        this.date = date;
        this.total = total;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
