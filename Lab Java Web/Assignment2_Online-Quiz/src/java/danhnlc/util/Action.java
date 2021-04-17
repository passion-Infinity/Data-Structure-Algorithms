package danhnlc.util;

public enum Action {

    //PAGE
    ERROR_PAGE(""),
    STUDENT_PAGE("student.jsp"),
    ADMIN_PAGE("admin.jsp"),
    START_QUIZ_PAGE("startQuiz.jsp"),
    END_QUIZ_PAGE("endQuiz.jsp"),
    HISTORY_PAGE("history.jsp"),
    LOGIN_PAGE("login.jsp"),
    REGISTER_PAGE("register.jsp"),
    CREATE_PAGE("create.jsp"),
    UPDATE_PAGE("update.jsp"),
    VIEW_SUBMIT_HISTORY("viewHistory.jsp"),
    
    
    //SERVLET
    HOME("HomeController"),
    SEARCH("SearchController"),
    REGISTER("RegisterController"),
    LOGIN("LoginController"),
    LOGOUT("LogoutController"),
    CREATE("CreateController"),
    UPDATE("UpdateController"),
    DELETE("DeleteController"),
    EDIT("EditController"),
    START_QUIZ("StartQuizController"),
    CHANGE_QUESTION("ChangeQuestionController"),
    SUBMIT_QUIZ("SubmitQuizController"),
    REVIEW_QUIZ("ReviewQuizController"),
    GET_SUBMIT_HISTORY("GetSubmitHistoryController"),
    
    
    
    
    ;
    
    private String action;

    private Action(String action) {
        this.action = action;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
