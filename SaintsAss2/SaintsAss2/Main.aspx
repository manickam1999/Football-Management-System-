<%@ Page Language="vb" AutoEventWireup="false" MaintainScrollPositionOnPostBack="true" CodeBehind="Main.aspx.vb" Inherits="SaintsAss2.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Menu.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 id ="title"> Football Management System</h1>
        </div>

        <div>
         <ul>
          <li><a class="active" href="#summary">Summary</a></li>
          <li><a href="Add.aspx">Add</a></li>
          <li><a href="Edit.aspx">Edit</a></li>
          <li><a href="Delete.aspx">Delete</a></li>
          <li><a href="View.aspx">View</a></li>
        </ul>
        </div>
        <h2>Summary</h2>
        <h3> Welcome to Football Management System. Here you can add, delete and edit football teams and football players information</h3>
        <h3>To sort the data, please click on the column header you would like to base the sort on</h3>
        <br />
        <div> 
            <asp:SqlDataSource ID="SummarySqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Team.id as &quot;Team ID&quot;, Team.name as &quot;Team Name&quot;, count (Player.teamid) as &quot;Number of Players&quot;
from Team
FULL OUTER JOIN Player ON Team.id = Player.teamid 
GROUP BY Player.teamid, Team.name, Team.id
ORDER BY Team.name"></asp:SqlDataSource>
        <asp:GridView ID="SummaryGridView" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SummarySqlDataSource" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" Font-Size="Large">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Team ID" HeaderText="Team ID" SortExpression="Team ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Team Name" HeaderText="Team Name" SortExpression="Team Name" />
                <asp:BoundField DataField="Number of Players" HeaderText="Number of Players" ReadOnly="True" SortExpression="Number of Players" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

        </div>

    </form>


    </body>
</html>
