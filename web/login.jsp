<%-- 
    Document   : login
    Created on : Dec 27, 2014, 3:12:41 PM
    Author     : BrentB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Login</title>
    </head>
    <body>
        <div class="contentContainer">
            <img src="images/banner.jpg" class="center" />
            
            <div class="navBar">
            <a href="index.jsp">Home</a> |
            <a href="listitems.jsp">Loot History</a> |
            <a href="searchMembers.jsp">View Loot by Member</a> |
            <a href="adminCP.jsp">Admin Control Panel</a>           
       </div>  
          
            <br/><br/>
            <div class="loginContainer">
                <%
                String login = (String) session.getAttribute("loggedIn");
                if (login != null){%>
                    <br/> Logged in as: <%= login%> <br/><br/>
                    <form action="processLogin" method="post">
                        <input type="submit" name="logout" value="Logout">
                    </form>   
                <%}else{%>
                    <form action="processLogin" method="post">
                        Username: <input type="text" name="username"><br/><br/>
                        Password: <input type="password" name="password"><br/><br/>
                        <input type="submit" value="Login">
                    </form>
                <br/> Not currently logged in.
                <%}%>
            </div>
        </div> 
    </body>
</html>
