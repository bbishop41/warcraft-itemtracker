<%-- 
    Document   : ListItems
    Created on : Dec 14, 2014, 3:20:31 AM
    Author     : BrentB
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entities.ItemEntity"%>
<%@page import="DBConnectionHandler.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
        <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true,
                    "renamelinks": true }</script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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
            ItemEntity items = new ItemEntity();
            ArrayList<ItemEntity> resultSearch = items.getLootedItems();
            String login = (String) session.getAttribute("loggedIn");
        %>
        <img src="images/banner_back.jpg" class="center-block img-responsive"/>
        <div class="container">

            <!-------->
            <div id="content">
                <div class ="row">
                    <div class="col-xs-8">
                        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="searchMembers.jsp">Raid Roster</a></li>
                            <li class="active"><a href="listitems.jsp">Item History</a></li>
                            <%if (login != null){%>
                                <li><a href="adminCP.jsp">Control Panel</a></li>
                            <%}%>
                        </ul>
                        <div id="my-tab-content" class="tab-content">
                            <div class="tab-pane active" id="setup"> </div>           
                        </div>
                    </div>
                    <%
                    if (login != null){%>
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
            
            
        
        <div class="row">
            <div class="col-md-7">
                <h2>Item History</h2>
                    <%
                if(resultSearch != null){%>                   
                <table id="resultsAll" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Character</th>
                        <th>Item</th>
                        <th>Raid</th>
                        <th>Specialization</th>
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
                                <th><%=resultSearch.get(i).getDungeon() %></th>      
                                <th><%=resultSearch.get(i).getSpec() %></th>
                                <th><%=resultSearch.get(i).getDateLooted()%></th>
                            </tr>   
                        <%
                        }
                    }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="col-md-5">
                <h2>Top Looters</h2>
                <table id="resultsAll" class="table table-striped table-bordered" cellspacing="0" width="100%">
                   <thead>
                   <tr>
                       <th>Character</th>
                       <th>Class</th>
                       <th>Items Looted</th>
                   </tr>
                   </thead>
                   <tbody>
                        <tr>
                            <td>Dunder</td>
                            <td><img src="images/shaman.gif"> <font color="blue">Shaman</font></td>
                            <td>11</td>
                        </tr>
                        <tr>
                            <td>Shaker</td>
                            <td><img src="images/druid.gif"> <font color="orange">Druid</font></td>
                            <td>9</td>
                        </tr>  
                        <tr>
                            <td>Zaxbys</td>
                            <td><img src="images/warrior.gif"> <font color="brown">Warrior</font></td>
                            <td>9</td>
                        </tr>  
                        <tr>
                            <td>Stafford</td>
                            <td><img src="images/monk.gif"> <font color="#25383C">Monk</font></td>
                            <td>8</td>
                        </tr>  
                        <tr>
                            <td>Beornhelm</td>
                            <td><img src="images/mage.gif"> <font color="cyan">Mage</font></td>
                            <td>7</td>
                        </tr>  
                   </tbody>
               </table>
            </div>
        </div>           
    </div>

     <script type="text/javascript">
        $(document).ready(function() {
        $('#resultsAll').DataTable( {
            "paging":   true,
            "info":   false,
            "bFilter": false,
            "pageLength": 25,
            "sDom": '<"top"i>rt<"bottom"flp><"clear">'
        });
    } );
    </script>   
</div>

    </body>
</html>