/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SearchHandlers;

import DBConnectionHandler.DBConnect;
import Entities.ItemEntity;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BrentB
 */
public class searchLootByString extends HttpServlet {
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchString = request.getParameter("query");
        PrintWriter test = response.getWriter();
        HttpSession session = request.getSession();
        ArrayList<ItemEntity> results = new ArrayList();       
        String sql = "select * from looteditems where itemName LIKE '%" + searchString +"%'";
        
        SearchLoot executeSearch = new SearchLoot();
        try{
            results = executeSearch.getLootByString(sql);
            
            if (results.size() == 0)
            {
                sql = "select * from looteditems where charName LIKE '%" + searchString +"%'";
                results = executeSearch.getLootByString(sql);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        session.setAttribute("searchResult", results);
        response.sendRedirect("searchResults.jsp");     
    }
}
