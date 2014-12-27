/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MemberServlets;

import Entities.Member;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BrentB
 */
public class insertMember extends HttpServlet {
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String className = request.getParameter("className");
       String charName = request.getParameter("member");
       
       Member newMember = new Member();
        try {
            newMember.InsertMember(charName, className);
        } catch (SQLException ex) {
            Logger.getLogger(insertMember.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            response.sendRedirect("adminCP.jsp");
        }
    }   
}
