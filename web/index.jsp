<%-- 
    Document   : index
    Created on : Dec 13, 2014, 12:19:51 AM
    Author     : BrentB
--%>

<%@page import="Entities.ItemEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
        <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true,
                    "renamelinks": true }</script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script type="text/javascript" src="//wow.zamimg.com/widgets/power.js"></script><script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true, "renamelinks": true }</script>
        <script src="scripts/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/jquery.dataTables.min.js" type="text/javascript"></script>
        <title>Raid Item Tracker</title>
    </head>
    <body>
        <%
            ItemEntity items = new ItemEntity();
            ArrayList<ItemEntity> resultSearch = items.getRecentItems();
            String login = (String) session.getAttribute("loggedIn");
        %>
        <img src="images/banner_back.jpg" class="center-block img-responsive"/>
        <div class="container">

            <!-------->
            <div id="content">
                <div class ="row">
                    <div class="col-xs-8">
                        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                            <li class="active"><a href="index.jsp">Home</a></li>
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
                    <% if (login != null){%>
                      <div class="col-xs-2 pull-right">
                        <form action="processLogin" method="post">
                            <input type="submit" class="btn btn-info navbar-btn" value="Logout">
                        </form>
                      </div>
                  <%}else{%>
                      <div class="col-xs-2 pull-right">
                        <form action="processLogin" method="post">
                            <a href="login.jsp" class="btn btn-info navbar-btn">Login</a>
                        </form>
                      </div>                
                  <%}%>
                  
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
                
               
                <div class="centered">
                    <div class="row">
                        <div class="col-md-7">
                            <h2>Recent Items</h2>
                            <%
                           if(resultSearch != null){%>                   
                           <table id="resultsAll" class="table table-striped table-bordered" cellspacing="0" width="100%">
                               <thead>
                               <tr>
                                   <th>Character</th>
                                   <th>Item</th>
                                   <th>Date</th>
                               </tr>
                               </thead>
                               <tbody>
                                   <%
                                   for(int i = 0; i < resultSearch.size();i++){     
                                   %>
                                       <tr>
                                           <th><%=resultSearch.get(i).getCharName() %></th>
                                           <th><a href="http://www.wowhead.com/item=<%=resultSearch.get(i).getItemID()%>
                                                  &bonus=<%=resultSearch.get(i).getBonusIdList()%>"><%=resultSearch.get(i).getItemName()%></a></th>
                                           <th><%=resultSearch.get(i).getDateLooted()%></th>
                                       </tr>   
                                   <%
                                   }
                               }
                                   %>
                               </tbody>
                           </table>
                        </div>
                        <div class="col-md-4 pull-left homeRightContainer">
                            <%if (login == null){%>
                                <h2>Login</h2>
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

                            <h2>Combat Logs</h2>
                            <div class="embed-responsive embed-responsive-16by9 logsContainer">
                                <iframe src="http://www.warcraftlogs.com/guilds/recent_reports/19309/"></iframe>
                            </div>
                        </div>                       
                    </div>
                </div>
                      
                <div class="row">
                    <br>
                </div>
                
                
                
                
                
            </div>       

            <script type="text/javascript">
                $(document).ready(function() {
                $('#resultsSearch').DataTable( {
                    "paging":   true,
                    "info":   false,
                    "bFilter": false,
                    "sDom": '<"top"i>rt<"bottom"flp><"clear">'
                });
            } );
            </script>   
            </div>

    </body>
</html>

