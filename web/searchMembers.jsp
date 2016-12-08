<%-- 
    Document   : searchMembers
    Created on : Dec 17, 2014, 3:47:11 PM
    Author     : BrentB
--%>

<%@page import="Entities.ItemEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MemberCharClasses.WarcraftClass"%>
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
    <script type="text/javascript" src="//wow.zamimg.com/widgets/power.js"></script>
    <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true, "renamelinks": true }</script>
    <title>Raid Item Tracker</title>
    <script src="scripts/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.dataTables.min.js" type="text/javascript"></script>
</head>
<body>
        <%
            WarcraftClass classGen = new WarcraftClass();
            ArrayList<String> resultList = new ArrayList();
            ArrayList<ItemEntity> resultSearch = new ArrayList();
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
                        <li class="active"><a href="searchMembers.jsp">Raid Roster</a></li>
                        <li><a href="listitems.jsp">Item History</a></li>
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
           
        <%-- 
            End of Nav Content
        --%> 
        <div class="row">
        <div class="col-md-6">
            <form action="searchLootByMember" method="post">
            <div class="classGrid">
                <div class ="row">
                    <div class="col-md-4 classCell">                      
                        <img src="images/deathknight.gif">
                        <font color="red">Death Knight</font><br>
                         <%
                            resultList = classGen.getClassMembers("Death Knight");
                            for(int i = 0; i < resultList.size(); i++){%>
                            <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                         <% }%>                           
                    </div> 
                    <div class="col-md-4 classCell">
                        <img src="images/druid.gif">
                        <font color="orange">Druid</font><br>
                        <%
                            resultList = classGen.getClassMembers("Druid");
                            for(int i = 0; i < resultList.size(); i++){%>
                            <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                        <% }%>              
                    </div>
                    <div class="col-md-4 classCell">
                        <img src="images/hunter.gif">
                        <font color="green">Hunter</font><br/>
                        <%
                           resultList = classGen.getClassMembers("Hunter");
                           for(int i = 0; i < resultList.size(); i++){%>
                           <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                        <% }%>    
                    </div>     
                </div>
                <div class ="row">
                    <div class="col-md-4 classCell">
                        <img src="images/mage.gif">
                        <font color="cyan">Mage</font><br/>
                        <%
                           resultList = classGen.getClassMembers("Mage");
                           for(int i = 0; i < resultList.size(); i++){%>
                           <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                        <% }%> 
                    </div> 
                    <div class="col-md-4 classCell">
                        <img src="images/monk.gif">
                        <font color=#25383C>Monk</font><br/>
                        <%
                           resultList = classGen.getClassMembers("Monk");
                           for(int i = 0; i < resultList.size(); i++){%>
                           <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                        <% }%>   
                    </div>
                    <div class="col-md-4 classCell">
                        <img src="images/paladin.gif">
                        <font color="pink">Paladin</font><br/>
                        <%
                           resultList = classGen.getClassMembers("Paladin");
                           for(int i = 0; i < resultList.size(); i++){%>
                           <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                        <% }%>   
                    </div>     
                </div>
                <div class ="row">
                    <div class="col-md-4 classCell">
                        <img src="images/priest.gif">
                        <font color="white">Priest</font><br/>
                        <%
                           resultList = classGen.getClassMembers("Priest");
                           for(int i = 0; i < resultList.size(); i++){%>
                           <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                        <% }%>    
                    </div> 
                    <div class="col-md-4 classCell">
                        <img src="images/rogue.gif">
                        <font color="yellow">Rogue</font><br/>
                        <%
                           resultList = classGen.getClassMembers("Rogue");
                           for(int i = 0; i < resultList.size(); i++){%>
                           <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                        <% }%>  
                    </div>
                    <div class="col-md-4 classCell">
                            <img src="images/shaman.gif">
                            <font color="blue">Shaman</font><br/>
                            <%
                               resultList = classGen.getClassMembers("Shaman");
                               for(int i = 0; i < resultList.size(); i++){%>
                               <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                            <% }%> 
                    </div>     
                </div>

                        <div class="row submit-button"></br>
                    <div class="col-xs-2 center-block">
                        <input type="submit">
                    </div>
                </div>
            </div>       
          </form>
        </div>
                    
                    
                    
                    
        <div class="col-md-6 resultsTable">
            <%
            resultSearch = (ArrayList<ItemEntity>) session.getAttribute("Results");
            if(resultSearch != null){%>  
            <table id="results" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Character</th>
                        <th>Item</th>
                        <th>Raid</th>
                        <th>Date</th>
                    </tr>
                </thead>
            </tbody>
                <%
                for(int i = 0; i < resultSearch.size();i++){     
                %>
                    <tr>
                        <th><%=resultSearch.get(i).getCharName() %></th>
                        <th><a href="http://www.wowhead.com/item=<%=resultSearch.get(i).getItemID()%>
                               &bonus=<%=resultSearch.get(i).getBonusIdList()%>"><%=resultSearch.get(i).getItemName()%></a></th>
                        <th><%=resultSearch.get(i).getDungeon()%></th>
                        <th><%=resultSearch.get(i).getDateLooted()%></th>
                    </tr>   
                <%
                }
            }
                %>
            </tbody>
            </table>
        </div>            
    </div>
       
                                       
                                                                                                                                                      
    </div> 
            <br>

 
    
    <script type="text/javascript">
        $(document).ready(function() {
        $('#results').DataTable( {
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
