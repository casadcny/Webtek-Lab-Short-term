package adidas;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet(name = "register", urlPatterns = {"/register"})
@MultipartConfig
public class register extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter(); 
        
        String idnumber = request.getParameter("idno"); 
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection connection;
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork", "root", "");
                        
            PreparedStatement ps;
            ps = connection.prepareStatement("INSERT INTO user(idno, lastname, password, firstname, username ) values(?,?,?,?,?)");
            
            ps.setString(1, idnumber);
            ps.setString(2, lastname);
            ps.setString(3, password);
            ps.setString(4, firstname);
            ps.setString(5, username);
            
           
            
            int rs = ps.executeUpdate();
            
            if(rs > 0){
                response.sendRedirect("success.html");
            } else {
                response.sendRedirect("failed.html");
            }

    }   catch (ClassNotFoundException ex) {
        
    }   catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

