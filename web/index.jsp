<%-- 
    Document   : index
    Created on : Dec 13, 2014, 12:19:51 AM
    Author     : BrentB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://static.wowhead.com/widgets/power.js"></script>
        <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true,
                    "renamelinks": true }</script>
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Obsidium Loot</title>
    </head>
    <body>
        <h1>Obsidium Loot</h1><br/>
        
        <a href="addMember.jsp">Add Member</a> |
        <a href="listitems.jsp">Loot History</a> |
        <a href="searchMembers.jsp">View Loot by Member</a><br/><br/><br/>
        
        <form action="parseLoot" method="post">
            <textarea cols="100" rows="50" wrap= "off" name="insertString"></textarea>
            <input type="submit">
        </form>
        
    </body>
</html>

