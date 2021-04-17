package danhnlc.dto;

import java.sql.Timestamp;

public class FeedBackDTO {

    private int id, carId;
    private String email;
    private String cont;
    private Timestamp createdDate;

    public FeedBackDTO() {
    }

    public FeedBackDTO(int id, int carId, String email, String cont, Timestamp createdDate) {
        this.id = id;
        this.carId = carId;
        this.email = email;
        this.cont = cont;
        this.createdDate = createdDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

}
