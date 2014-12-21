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
public class searchLootByMember extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] selectedMembers = request.getParameterValues("member");
        PrintWriter test = response.getWriter();
        HttpSession session = request.getSession();
        ArrayList<ItemEntity> results = new ArrayList();       
        String sql = "select * from looteditems where ";
            
        /*nothing selected*/
        if(selectedMembers == null){
            results = null;
        /*multiple selected*/
        }else if(selectedMembers.length >= 1){
            for (int i = 0; i < selectedMembers.length; i++){
                if(i == selectedMembers.length-1){
                   sql = sql + "charName = '" + selectedMembers[i] + "' order by charName";
                   break;
                }
                sql = sql + "charName = '" + selectedMembers[i] + "' or ";
            }
            SearchLoot executeSearch = new SearchLoot();
            
            try{
                results = executeSearch.getLootByMember(sql);
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        session.setAttribute("Results", results);
        response.sendRedirect("searchMembers.jsp");     
    }
}
