package danhnlc.filter;

import danhnlc.dto.AccountDTO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FilterDispatcher implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;

    private final List<String> STUDENT;
    private final List<String> TEACHER;
    private final String ST = "student";
    private final String TE = "teacher";
    private final String LOGIN = "login.jsp";

    public FilterDispatcher() {
        STUDENT = new ArrayList<>();
        STUDENT.add("");
        STUDENT.add("login.jsp");
        STUDENT.add("register.jsp");
        STUDENT.add("student.jsp");
        STUDENT.add("endQuiz.jsp");
//        STUDENT.add("startQuiz.jsp");
        STUDENT.add("MainController");
        STUDENT.add("LoginController");
        STUDENT.add("HomeController");
        

        TEACHER = new ArrayList<>();
        TEACHER.add("");
        TEACHER.add("admin.jsp");
        TEACHER.add("login.jsp");
        TEACHER.add("register.jsp");
        TEACHER.add("MainController");
        TEACHER.add("LoginController");
        TEACHER.add("HomeController");
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("FilterDispatcher:DoBeforeProcessing");
        }
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("FilterDispatcher:DoAfterProcessing");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        if (uri.contains(".jpg") || uri.contains(".gif") || uri.contains(".png") || uri.contains(".css")) {
            chain.doFilter(request, response);
        } else {
            if (uri.contains("login.jsp") || uri.contains("MainController")
                    || uri.contains("LoginController")) {
                chain.doFilter(request, response);
                return;
            }
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            HttpSession session = req.getSession();
            if ((session == null) || session.getAttribute("account") == null) {
                res.sendRedirect(LOGIN);
            } else {
                AccountDTO accountDTO = (AccountDTO) session.getAttribute("account");
                String role = accountDTO.getRole();
                if (ST.equals(role) && STUDENT.contains(resource)) {
                    chain.doFilter(request, response);
                } else if (TE.equals(role) && TEACHER.contains(resource)) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect(LOGIN);
                }
            }
        }
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("FilterDispatcher:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("FilterDispatcher()");
        }
        StringBuffer sb = new StringBuffer("FilterDispatcher(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
