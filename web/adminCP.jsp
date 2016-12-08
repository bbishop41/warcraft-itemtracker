<%-- 
    Document   : inputLoot
    Created on : Dec 25, 2014, 2:15:48 AM
    Author     : BrentB
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entities.ItemEntity"%>
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
        ArrayList<ItemEntity> resultSearch = items.getLootedItems();
        String login = (String) session.getAttribute("loggedIn");
        if (login == null){
                response.sendRedirect("login.jsp");
            }  
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
                <li><a href="listitems.jsp">Item History</a></li>
                <%if (login != null){%>
                    <li class="active"><a href="adminCP.jsp">Control Panel</a></li>
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
      
    <div class="row">
        <div class="col-xs-2 adminButtonGroup">
            <div class="btn-group-vertical pull-left">
                <button type="button" id="deleteItemsBtn" class="btn btn-secondary">Delete Items</button>
                <button type="button" id="createMemberBtn" class="btn btn-secondary">Create Member</button>
                <button type="button" id="deleteMemberBtn" class="btn btn-secondary">Delete Member</button>
                <button type="button" id="insertItemsBtn" class="btn btn-secondary">Insert Items</button>
            </div>
        </div>
        <div class="col-xs-5">
            <div id="deleteTable" style="display: none">
                <h2>Delete Items</h2>
                <%
                if(resultSearch != null){%>
                <form action="deleteItems" method="post">
                <table id="deleteItems" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Character</th>
                        <th>Item</th>
                        <th>Date</th>
                        <th>Selected</th>
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
                                <th><input type="checkbox" name="itemsToDelete" value="<%=resultSearch.get(i).getItemEntry()%>"></th>
                            </tr>   
                        <%
                        }
                    }
                        %>
                    </tbody>
                </table>
                    <input class="btn btn-default" type="submit" value="Delete Items">
                </form>
            </div>
            <div id="insertItems" style="display: none">
                <h2>Insert Items</h2>
                <form action="parseLoot" method="post">
                    <textarea cols="50" rows="15" wrap="soft" name="insertString"></textarea>
                    <input class="btn btn-default" type="submit" value="Insert Loot">
                </form>
            </div>
            <div id="createMember" style="display: none">
                <h2>Create New Member</h2>
                <form action="insertMember" method="post">
                    Character Name: <input type="text" name="member">
                    <select name="className">  
                        <option style="color: red" value="Death Knight">Death Knight</option>
                        <option value="Druid"><font color="orange">Druid</font></option>
                        <option value="Hunter">Hunter</option>
                        <option value="Mage">Mage</option>
                        <option value="Monk">Monk</option>
                        <option value="Paladin">Paladin</option>
                        <option value="Priest">Priest</option>
                        <option value="Rogue">Rogue</option>
                        <option value="Shaman">Shaman</option>
                        <option value="Warlock">Warlock</option>
                        <option value="Warrior">Warrior</option>
                    </select> <br/><br/>
                    <input class="btn btn-default" type="submit" value="Create Member">
                </form> 
            </div>
            <div id="deleteMember" style="display: none">
                <h2>Delete Member</h2>
                <form action="deleteMember" method="post">
                    Character Name: <input type="text" name="member">   <br><br>         
                    <input class="btn btn-default" type="submit" value="Delete Member">
                </form>
            </div>
        </div>
        <div class="col-xs-5">
            <h2>Recent Activity</h2>
            <table id="activity" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>User</th>
                    <th>Action</th>
                    <th>Time</th>
                </tr>
                </thead>
                <tbody>
                     <tr>
                         <td>Dunder</td>
                         <td>New member created - <font color="red">Arya</font> -</td>
                         <td>3:03PM 2/06/2016</td>
                     </tr>
                     <tr>
                         <td>Zaxbys</td>
                         <td>Deleted member - <font color="red">Arya</font> -</td>
                         <td>5:07PM 2/07/2016</td>
                     </tr>
                     <tr>
                         <td>Zaxbys</td>
                         <td>Deleted item - <a href="http://www.wowhead.com/item=113591
                                       &bonus=42:566">The Bladefist</a> -</td>
                         <td>8:24PM 2/09/2016</td>
                     </tr>    
                </tbody>
            </table> 
        </div>
    </div>
  
              
              
              
              
              
              
</div>       

<script type="text/javascript">
    $(document).ready(function() {
    $('#deleteItems').DataTable( {
        "paging":   true,
        "info":   false
    });
    $( "#deleteItemsBtn" ).click(function() {
        $( "#deleteTable" ).toggle("slow");
        $(this).toggleClass('red');
    });
    $( "#insertItemsBtn" ).click(function() {
        $( "#insertItems" ).toggle("slow");
        $(this).toggleClass('red');
    }); 
    $( "#createMemberBtn" ).click(function() {
        $( "#createMember" ).toggle("slow");
        $(this).toggleClass('red');
    }); 
     $( "#deleteMemberBtn" ).click(function() {
        $( "#deleteMember" ).toggle("slow");
        $(this).toggleClass('red');
    }); 
}); 

</script>   
</div>  
</body>
</html>
