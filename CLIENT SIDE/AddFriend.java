
package adidas;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
@WebServlet(name = "AddFriend", urlPatterns = {"/AddFriend"})
public class AddFriend extends HttpServlet {
    
    @Override
    @SuppressWarnings("empty-statement")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        String idno = request.getParameter("idno");
        try{
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork", "root" , "");
            String query = "INSERT INTO request (fromID, toID, status, date) VALUES (?,?,?,now())";
            PreparedStatement pst = conn.prepareStatement(query);
            
            pst.setString(1, ""+session.getAttribute("idno"));
            pst.setString(2, idno);
            pst.setString(3, "pending");
            int rs = pst.executeUpdate();
            
            if(rs > 0){
                response.sendRedirect("home.jsp");
            }else{
                out.println("No user have such name!");
            }
        } catch(IOException | SQLException e){
            
        }
    }
}
