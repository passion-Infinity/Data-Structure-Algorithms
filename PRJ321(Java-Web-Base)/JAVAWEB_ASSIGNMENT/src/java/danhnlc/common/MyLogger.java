package danhnlc.common;

import java.io.InputStream;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.PropertyConfigurator;

public class MyLogger implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        InputStream in = getClass().getResourceAsStream("/danhnlc/common/log4j.properties");
        if (in != null) {
            PropertyConfigurator.configure(in);
        } else {
            BasicConfigurator.configure();
        }
    }
}
