<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Delete.aspx.vb" MaintainScrollPositionOnPostBack="true" Inherits="SaintsAss2.Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Menu.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 174px;
        }
        .auto-style2 {
            width: 174px;
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            width: 188px;
        }
        .auto-style5 {
            width: 174px;
            height: 52px;
        }
        .auto-style6 {
            height: 52px;
        }
    </style>
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
          <li><a class="active" href="Delete.aspx">Delete</a></li>
          <li><a href="View.aspx">View</a></li>
        </ul>
        </div>
        <div>
             <h2>Delete</h2>
             <h3>Team Table</h3>
        </div>

        <div>
         <asp:ValidationSummary ID="TeamValidationSummary" runat="server" DisplayMode="List" ValidationGroup ="Team" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="#FF3300" />

            <table id="DeleteTeamtable" style="margin:0 auto" aria-multiline="True" style="width:100%;">
                <tr>
                    <td class="auto-style5">

            <asp:Label ID="TeamNameLabel" runat="server" Text="Team Name : "></asp:Label>
                    </td>
                    <td class="auto-style6">
            <asp:DropDownList ID="TeamDropDownList" runat="server" AppendDataBoundItems="true" DataSourceID="TeamNameSqlDataSource" DataTextField="name" DataValueField="name" AutoPostBack="True">
                <asp:ListItem Text="Choose One"></asp:ListItem>
            </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="TeamNameRequiredFieldValidator" ValidationGroup ="Team" runat="server" ControlToValidate="TeamDropDownList" ErrorMessage="Please select valid team name" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Button ID="DeleteButton" ValidationGroup="Team" runat="server" Text="Delete" style="height: 29px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <asp:Label ID="TeamMessageLabel" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:SqlDataSource ID="TeamNameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name] FROM [Team] ORDER BY [name]"></asp:SqlDataSource>

        </div>

        <h3>Player Table</h3>

        <div>
                     <asp:ValidationSummary ID="PlayerValidationSummary" runat="server" DisplayMode="List" ValidationGroup ="Player" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="#FF3300" />
                <table id="DeletePlayerTable" style="margin:0 auto" aria-multiline="True" style="width:100%;">
                    <tr>
                        <td class="auto-style4">
         
                <asp:Label ID="PlayerTeamNameLabel" runat="server" Text="Team Name:"></asp:Label>
                        </td>
                        <td>
                <asp:DropDownList ID="PlayerTeamDropDownList" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                            <br />
                        <asp:RequiredFieldValidator ID="PlayerTeamRequiredFieldValidator" ValidationGroup ="Player" runat="server" ControlToValidate="PlayerTeamDropDownList" ErrorMessage="Please select valid team name" Font-Bold="True" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td aria-multiline="True" class="auto-style4">
         
                <asp:Label ID="PlayerNameLabel" runat="server" Text="Player Name :" ></asp:Label>
                        </td>
                        <td>
                <asp:DropDownList ID="PlayerNameDropDownList" runat="server" AutoPostBack="True" Visible="False">
                </asp:DropDownList>



                            <br />
                        <asp:RequiredFieldValidator ID="PlayerRequiredFieldValidator1" ValidationGroup ="Player" runat="server" ControlToValidate="PlayerNameDropDownList" ErrorMessage="Please select valid player name" Font-Bold="True" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>



                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                <asp:Button ID="PlayerDeleteButton" ValidationGroup ="Player" runat="server" Text="Delete" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
            <asp:Label ID="PlayerMessageLabel" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:SqlDataSource ID="PlayerTeamNameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [id] FROM [Team] ORDER BY [name]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="PlayerNameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [id] FROM [Player] WHERE ([teamid] = @teamid) ORDER BY [name]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="PlayerTeamDropDownList" Name="teamid" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
        </div>

    </form>
</body>
</html>
