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
        <title>View Member Loot</title>
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <script type="text/javascript" src="http://static.wowhead.com/widgets/power.js"></script>
        <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true,
                    "renamelinks": true }</script>
    </head>
    <body>
        <div class="searchContainer">
        <%
            WarcraftClass classGen = new WarcraftClass();
            ArrayList<String> resultList = new ArrayList();
            ArrayList<ItemEntity> resultSearch = new ArrayList();
        %>
        <img src="images/banner.jpg" class="center" />
        <form action="searchLootByMember" method="post">
        <div class="classcontainer">
            <div class="classlist">
                <img src="images/deathknight.gif">
                <font color="red">Death Knight</font><br/>
                <%
                   resultList = classGen.getClassMembers("Death Knight");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>                
            </div>
            <div class="classlist">
                <img src="images/druid.gif">
                <font color="orange">Druid</font><br/>
                <%
                   resultList = classGen.getClassMembers("Druid");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>   
            </div>
            <div class="classlist">
                <img src="images/hunter.gif">
                <font color="green">Hunter</font><br/>
                <%
                   resultList = classGen.getClassMembers("Hunter");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>    
            </div>
            <div class="classlist">
                <img src="images/mage.gif">
                <font color="cyan">Mage</font><br/>
                <%
                   resultList = classGen.getClassMembers("Mage");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>    
            </div >
            <div class="classlist">
                <img src="images/monk.gif">
                <font color=#25383C>Monk</font><br/>
                <%
                   resultList = classGen.getClassMembers("Monk");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>   
            </div>
            <div class="classlist">
                <img src="images/paladin.gif">
                <font color="pink">Paladin</font><br/>
                <%
                   resultList = classGen.getClassMembers("Paladin");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>              
            </div>
            <div class="classlist">
                <img src="images/priest.gif">
                <font color="white">Priest</font><br/>
                <%
                   resultList = classGen.getClassMembers("Priest");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>              
            </div>
            <div class="classlist">
                <img src="images/rogue.gif">
                <font color="yellow">Rogue</font><br/>
                <%
                   resultList = classGen.getClassMembers("Rogue");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%>  
            </div>      
            <div class="classlist">
                <img src="images/shaman.gif">
                <font color="blue">Shaman</font><br/>
                <%
                   resultList = classGen.getClassMembers("Shaman");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%> 
            </div>
            <div class="classlist">
                <img src="images/warlock.gif">
                <font color="purple">Warlock</font><br/>
                <%
                   resultList = classGen.getClassMembers("Warlock");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%> 
            </div>
            <div class="classlist">
                <img src="images/warrior.gif">
                <font color="brown">Warrior</font><br/>
                <%
                   resultList = classGen.getClassMembers("Warrior");
                   for(int i = 0; i < resultList.size(); i++){%>
                   <label><input type="checkbox" name="member" value="<%=resultList.get(i)%>"> <%=resultList.get(i)%></label><br/>
                <% }%> 
            </div>
            <div id="buttonContainer">
                <div id="searchButton">
                    <input type="submit">
                </div>
            </div>
        </div>       
        </form>
         
    <div class="resultsContainer">
        <div class="resultsTable">
            <%
            resultSearch = (ArrayList<ItemEntity>) session.getAttribute("Results");
            if(resultSearch != null){%>                   
            <table style="width:80%">
                <tr>
                    <th>Character</th>
                    <th>Item</th>
                    <th>Date</th>
                </tr>
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
            </table>
        </div>
    </div>
    </body>
</html>
