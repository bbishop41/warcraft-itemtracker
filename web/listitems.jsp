<%-- 
    Document   : ListItems
    Created on : Dec 14, 2014, 3:20:31 AM
    Author     : BrentB
--%>

<%@page import="DBConnectionHandler.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://static.wowhead.com/widgets/power.js"></script>
        <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true,
                    "renamelinks": true }</script>
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>All items</title>
    </head>
    <body> 
        <h1>Loot History</h1>
        
        
        <div id="dashBar">
        <a href="index.jsp">Home</a> |
        <a href="#">Update Profile</a> |
        <a href="addMember.jsp">Create Member Profile</a>         
        </div>
        
        <div class="content">
        <table style="width:30%">
	        <tr>
	        	<th>Character</th>
	        	<th>Item</th>
	        	<th>Date</th>
	        </tr>
        <%
        DBConnect con = new DBConnect();
        ResultSet rs = con.getItems();
        while(rs.next()){     
        %>
        <tr>
        	<th><%=rs.getString("charName") %></th>
        	<th><a href="http://www.wowhead.com/item=<%=rs.getString("itemID")%>&bonus=<%=rs.getString("bonusIdList")%>"></a></th>
        	<th><%=rs.getString("dateLooted") %></th>
        </tr>   
        <%
        }
        con.close();
        %>
        </table>
        </div>
    </body>
</html>