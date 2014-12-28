
package loginServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class processLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        if(username != null && password != null){
            if (username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("pmenacenotbad")){
                session.setAttribute("loggedIn", username);
            }else{
                session.setAttribute("loggedIn", null);
            }
        }else{
            session.setAttribute("loggedIn", null);
        }
        response.sendRedirect("login.jsp");
     }
}
