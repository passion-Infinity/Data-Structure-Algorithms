package danhnlc.dto;

import java.sql.Timestamp;

public class SubmitDTO {

    private int id;
    private String email;
    private String subject;
    private float point;
    private int numberOfTrue;
    private int quantityOfQuestion;
    private Timestamp startTime;
    private Timestamp endTime;

    public SubmitDTO() {
    }

    public SubmitDTO(int id, String email, String subject, float point, int numberOfTrue, int quantityOfQuestion, Timestamp startTime, Timestamp endTime) {
        this.id = id;
        this.email = email;
        this.subject = subject;
        this.point = point;
        this.numberOfTrue = numberOfTrue;
        this.quantityOfQuestion = quantityOfQuestion;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public int getNumberOfTrue() {
        return numberOfTrue;
    }

    public void setNumberOfTrue(int numberOfTrue) {
        this.numberOfTrue = numberOfTrue;
    }

    public int getQuantityOfQuestion() {
        return quantityOfQuestion;
    }

    public void setQuantityOfQuestion(int quantityOfQuestion) {
        this.quantityOfQuestion = quantityOfQuestion;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }
}
