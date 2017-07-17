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
 
@WebServlet(name = "posts", urlPatterns = {"/posts"})
@MultipartConfig
public class post extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter(); 
        
        String pos = request.getParameter("posts");
        String idno = request.getParameter("idno");


        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork", "root", "");
                        
            PreparedStatement ps;
            ps = connection.prepareStatement("INSERT INTO posts(poster_id, date, visibility, post_info) values(?, now(), ?, ?)");
            
            ps.setString(1, idno);
            ps.setString(2, "public");
            ps.setString(3, pos);
           
            
            int rs = ps.executeUpdate();
            
            if(rs > 0){
                response.sendRedirect("home.jsp");
            } 

    }   catch (ClassNotFoundException ex) {
        
    }   catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

