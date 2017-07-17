package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class listener implements ServletContextListener {
    private Connection connection = null;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        String dn = context.getInitParameter("drivername");
        String cs = context.getInitParameter("connstr");
        
        try {
            Class.forName(dn);
            connection = DriverManager.getConnection(cs);
            context.setAttribute("connection", connection);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(listener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(listener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
