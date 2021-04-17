package danhnlc.dto;

public class AnswerDTO {

    private int id;
    private String cont;
    private int question;
    private boolean correctly;

    public AnswerDTO() {
    }

    public AnswerDTO(String cont, boolean correctly) {
        this.cont = cont;
        this.correctly = correctly;
    }
    
    public AnswerDTO(int id, String cont, int question, boolean correctly) {
        this.id = id;
        this.cont = cont;
        this.question = question;
        this.correctly = correctly;
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

    public int getQuestion() {
        return question;
    }

    public void setQuestion(int question) {
        this.question = question;
    }

    public boolean isCorrectly() {
        return correctly;
    }

    public void setCorrectly(boolean correctly) {
        this.correctly = correctly;
    }

}
