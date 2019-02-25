<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="View.aspx.vb" MaintainScrollPositionOnPostBack="true"  Inherits="SaintsAss2.View" %>

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
          <li><a href="Main.aspx">Summary</a></li>
          <li><a href="Add.aspx">Add</a></li>
          <li><a href="Edit.aspx">Edit</a></li>
          <li><a href="Delete.aspx">Delete</a></li>
          <li><a class="active" href="View.aspx">View</a></li>
        </ul>
            <h2>View</h2>
        </div>

        <br />

        <h3>To sort the data please click on the colum header you would like to based the sort on</h3>
        <br />
        <h3>Team Table</h3>
        <div>
            <asp:GridView ID="TeamGridView" runat="server" AllowPaging="True" HorizontalAlign="Center" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="TeamSqlDataSource" ForeColor="Black" GridLines="Vertical" Width="344px" Font-Size="Large" Height="331px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
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
            <asp:SqlDataSource ID="TeamSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Team] ORDER BY [name]"></asp:SqlDataSource>
        </div>

        <br />
        <h3>Player Table</h3>

        <div>
             <asp:GridView ID="PlayerGridView" runat="server" HorizontalAlign="Center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="PlayerSqlDataSource" ForeColor="Black" GridLines="Vertical" Font-Size="Large" Height="355px" Width="504px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="Player Name" SortExpression="name" />
                <asp:BoundField DataField="name1" HeaderText="Team Name" SortExpression="name1" />
                <asp:BoundField DataField="nationality" HeaderText="Nationality" SortExpression="nationality" />
                <asp:BoundField DataField="position" HeaderText="Position" SortExpression="position" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="PlayerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT player.id,player.name,team.name,player.nationality,player.position
          FROM player 
          INNER JOIN team on player.teamid =team.id
          ORDER BY player.name"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
