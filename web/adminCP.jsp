<%-- 
    Document   : inputLoot
    Created on : Dec 25, 2014, 2:15:48 AM
    Author     : BrentB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin CP</title>
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">       
        <script type="text/javascript" src="http://static.wowhead.com/widgets/power.js"></script>
        <script>var wowhead_tooltips = { "colorlinks": true, "iconizelinks": true,
                    "renamelinks": true }</script>
    </head>
    <body>
        <div class="contentContainer">
            <img src="images/banner.jpg" class="center" />
            
            <div class="navBar">
                <a href="index.jsp">Home</a> |
                <a href="listitems.jsp">Loot History</a> |
                <a href="searchMembers.jsp">View Loot by Member</a> |
                <a href="adminCP.jsp">Admin Control Panel</a> <br/><br/><br/>
            </div></br></br>
            
            <div class="textareaContainer">
                <form action="parseLoot" method="post">
                    <textarea cols="70" rows="20" wrap="soft" name="insertString"></textarea>
                    <input type="submit" value="Insert Loot">
                </form>
            </div>
            
            <div class="addmemberContainer">               
                Insert New Member: </br></br>
                <form action="insertMember" method="post">
                    Character Name: <input type="text" name="member">
                    <select name="className">  
                        <option value="Death Knight">Death Knight</option>
                        <option value="Druid">Druid</option>
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
                    <input type="submit" value="Create Member">
                </form>                
            </div>
        </div>  
    </body>
</html>
