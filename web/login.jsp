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
    <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true,
                "renamelinks": true }</script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="//wow.zamimg.com/widgets/power.js"></script><script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true, "renamelinks": true }</script>
    <title>Raid Item Tracker</title>
    <script src="scripts/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.dataTables.min.js" type="text/javascript"></script>
</head>
    <body>
      <%
          String login = (String) session.getAttribute("loggedIn");
      %>
      <img src="images/banner_back.jpg" class="center-block img-responsive"/>
      <div class="container">

        <!-------->
        <div id="content">
            <div class ="row">
                <div class="col-xs-6">
                    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="searchMembers.jsp">Raid Roster</a></li>
                        <li><a href="listitems.jsp">Item History</a></li>
                        <%if (login != null){%>
                                <li><a href="adminCP.jsp">Control Panel</a></li>
                            <%}%>
                    </ul>
                    <div id="my-tab-content" class="tab-content">
                        <div class="tab-pane active" id="setup"> </div>           
                    </div>
                </div>
                     

                <div class="col-xs-2 pull-right">
                    <form action="searchLootByString" method="post" class="navbar-form" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search" name="query" id="srch-term">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            
            
            
            <div class="row">
                <div class="col-md-6">
                    <%
                    if (login != null){%>
                    <br/> <h2>Logged in as: <%= login%> </h2><br/><br/>
                        <form action="processLogin" method="post">
                            <input class="btn-info btn-lg loginbutton" type="submit" name="logout" value="Logout">
                        </form>                   
                    <%}else{%>
                        <form action="processLogin" method="post" role="form">
                        <div class="form-group">
                          <label for="usr">Name:</label>
                          <input type="text" name="username" class="form-control" id="usr">
                        </div>
                        <div class="form-group">
                          <label for="pwd">Password:</label>
                          <input type="password" name="password" class="form-control" id="pwd"><br>
                          <input type="submit" class="btn-info btn-lg" value="Login">
                        </div>
                      </form>                  
                    <%}%>
                </div>
            </div>
                    <div class="row">
                        <br>
                </div>
            
            
            
            
        </div>
      </div>
    </body>
</html>
