/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parseLoot;

import DBConnectionHandler.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class parseLoot extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String input = request.getParameter("insertString");
        StringTokenizer tokenize;
        String charName = "", itemName = "", itemId = "", date = "", 
                spec = "", bonusIdList = "";
        String[] lines = input.split("\\r?\\n");
        try{
            Connection con = new DBConnect().getConnection();
            PreparedStatement ps = null;
            for(int i = 0; i < lines.length; i++){
                tokenize = new StringTokenizer(lines[i], "*");
                while(tokenize.hasMoreTokens()){
                    charName = tokenize.nextToken();
                    itemName = tokenize.nextToken();
                    itemId = tokenize.nextToken();
                    date = tokenize.nextToken();
                    spec = tokenize.nextToken();
                    bonusIdList = processBonusList(itemName, tokenize.nextToken());
                }         
                String sql = "INSERT INTO looteditems (charName, itemName, itemID, dateLooted, spec, bonusIdList) VALUES (?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, charName);
                ps.setString(2, itemName);
                ps.setString(3, itemId);
                ps.setString(4, date);
                ps.setString(5, spec);
                ps.setString(6, bonusIdList);
                ps.executeUpdate();            
            }
            ps.close();
            con.close();
            response.sendRedirect("index.jsp");
            return;
        }catch(SQLException e){
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }
    
    public static String processBonusList(String iname, String bonusid){
        if (bonusid.equalsIgnoreCase("nobonus")){
            return "";
        }else{
            return bonusid.substring(0, (bonusid.length()-(iname.length()+2)));
        }
    }
}
