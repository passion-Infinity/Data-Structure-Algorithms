package danhnlc.dto;

import java.util.Date;

public class SubjectDTO {

    private String id;
    private String name;
    private int quantityOfQuestion;
    private Date testTime;

    public SubjectDTO() {
    }

    public SubjectDTO(String id, String name, int quantityOfQuestion, Date testTime) {
        this.id = id;
        this.name = name;
        this.quantityOfQuestion = quantityOfQuestion;
        this.testTime = testTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantityOfQuestion() {
        return quantityOfQuestion;
    }

    public void setQuantityOfQuestion(int quantityOfQuestion) {
        this.quantityOfQuestion = quantityOfQuestion;
    }

    public Date getTestTime() {
        return testTime;
    }

    public void setTestTime(Date testTime) {
        this.testTime = testTime;
    }

}
