package danhnlc.dto;

import java.util.Date;
import java.util.List;

public class QuestionDTO {

    private int id;
    private String cont;
    private String status;
    private String subject;
    private Date createdDate;
    private String createdBy;
    private Date modifiedDate;
    private String modifiedBy;
    private List<AnswerDTO> answerList;

    public QuestionDTO() {
    }

    public QuestionDTO(int id, String cont, String status, String subject, Date createdDate, String createdBy, Date modifiedDate, String modifiedBy) {
        this.id = id;
        this.cont = cont;
        this.status = status;
        this.subject = subject;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.modifiedDate = modifiedDate;
        this.modifiedBy = modifiedBy;
    }

    public QuestionDTO(int id, String cont, String status, String subject, Date createdDate, String createdBy, Date modifiedDate, String modifiedBy, List<AnswerDTO> answerList) {
        this.id = id;
        this.cont = cont;
        this.status = status;
        this.subject = subject;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
        this.modifiedDate = modifiedDate;
        this.modifiedBy = modifiedBy;
        this.answerList = answerList;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public List<AnswerDTO> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<AnswerDTO> answerList) {
        this.answerList = answerList;
    }
    
}
