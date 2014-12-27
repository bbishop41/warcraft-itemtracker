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
        <div class="contentContainer">
            <img src="images/banner.jpg" class="center" />
                <div class="navBar">
                    <a href="index.jsp">Home</a> |
                    <a href="listitems.jsp">Loot History</a> |
                    <a href="searchMembers.jsp">View Loot by Member</a> |
                    <a href="adminCP.jsp">Admin Control Panel</a>
                    <div class="logout">
                        <a href="login.jsp">Login</a>
                    </div><br/><br/><br/>
                </div>
            <br/><br/>
            <div class="logsContainer">
                Warcraft Logs:
            <iframe src="http://www.warcraftlogs.com/guilds/recent_reports/19309/">
            </div>
        </div>
    </body>
</html>

