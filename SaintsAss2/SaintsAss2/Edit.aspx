<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Edit.aspx.vb" MaintainScrollPositionOnPostBack="true" Inherits="SaintsAss2.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Menu.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 204px;
        }
        .auto-style2 {
            width: 207px;
        }
        .auto-style3 {
            width: 100%;
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
              <li><a class="active" href="Edit.aspx">Edit</a></li>
              <li><a href="Delete.aspx">Delete</a></li>
              <li><a href="View.aspx">View</a></li>
            </ul>
        </div>
        <div>
            <h2>Edit</h2>

            <h3>Team Table</h3>
            <asp:ValidationSummary ID="PlayerValidationSummary" runat="server" DisplayMode="List" ValidationGroup ="Team" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="#FF3300" />
            <table  id="EditTeamTable" style="width:100%" aria-multiline="True" class="auto-style3">
                <tr>
                    <td style="width:50%; text-align:right" class="auto-style2">

            <asp:Label ID="TeamNameLabel" runat="server" Text="Team's Name : "></asp:Label>
                    </td>
                    <td style="width:50%">
            <asp:DropDownList ID="TeamNameDropDownList" runat="server" AutoPostBack="True">
            </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="TeamNameRequiredFieldValidator0" ValidationGroup ="Team" runat="server" ControlToValidate="TeamNameDropDownList" ErrorMessage="Please select team name" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%; text-align:right" class="auto-style2">
            <asp:Label ID="TeamIDLabel" runat="server" Text="Team's ID :"></asp:Label>
                    </td>
                    <td style="width:50%">
                        <asp:Label ID="TeamIDTextBox" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%; text-align:right" class="auto-style2">
            <asp:Label ID="TeamNameEditLabel" runat="server" Text="Team's Name : "></asp:Label>
                    </td>
                    <td style="width:50%">
            <asp:TextBox ID="TeamNameTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="TeamNameRequiredFieldValidator" ValidationGroup ="Team" runat="server" ControlToValidate="TeamNameTextBox" ErrorMessage="Please input valid team name" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%; text-align:right" class="auto-style2">
            <asp:Label ID="TeamCountryLabel" runat="server" Text="Team's Origin/Country :"></asp:Label>
                    </td>
                    <td style="width:50%">
            <asp:DropDownList ID="CountryDropDownList" runat="server" DataSourceID="CountrySqlDataSource" DataTextField="CountryName" DataValueField="CountryName" Visible="False">
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%; text-align:right" class="auto-style2">
            <asp:Button ID="UpdateButton" ValidationGroup="Team" runat="server" Text="Update" style="height: 26px" />
                    </td>
                    <td style="width:50%">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width:50%; text-align:right" class="auto-style2">
            <asp:Label ID="TeamUpdateLabel" runat="server"></asp:Label>
                    </td>
                    <td style="width:50%">&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>

        <br />
        
        <h3>Player Table</h3>

        <div>
            <asp:ValidationSummary ID="TeamValidationSummary" runat="server" DisplayMode="List" ValidationGroup ="Player" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="#FF3300" />
            <table id="TeamPlayerTable" style="margin:0 auto" aria-multiline="True" style="width:100%;">
                <tr>
                    <td class="auto-style1">

            <asp:Label ID="PlayerTeamNameLabel" runat="server" Text="Team's Name:"></asp:Label>
                    </td>
                    <td>
            <asp:DropDownList ID="PlayerTeamNameDropDownList" runat="server" AppendDataBoundItems="false" AutoPostBack="True" Height="18px" >
            </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="PlayerTeamRequiredFieldValidator" ValidationGroup ="Player" runat="server" ControlToValidate="PlayerTeamNameDropDownList" ErrorMessage="Please select valid team name" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="PlayerNameLabel" runat="server" Text="Player's Name :"></asp:Label>
                    </td>
                    <td><asp:DropDownList ID="PlayerNameDropDownList" runat="server" AutoPostBack="True" Visible="False" >
             </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="PlayerNameRequiredFieldValidator" ValidationGroup ="Player" runat="server" ControlToValidate="PlayerNameDropDownList" ErrorMessage="Please select valid player name" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="PlayerIDLabel" runat="server" Text="Player's ID : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="PlayerIDTextBox" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="PlayerNameEditLabel" runat="server" Text="Player's Name :"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="PlayerNameTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="PlayerNamaRequiredFieldValidator" ValidationGroup ="Player" runat="server" ControlToValidate="PlayerNameTextBox" ErrorMessage="Please input valid name" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="PlayerTeamEditLabel" runat="server" Text="Player's Team :"></asp:Label>
                    </td>
                    <td><asp:DropDownList ID="PlayersTeamEditDropDownList" runat="server" DataSourceID="TeamNameSqlDataSource" DataTextField="name" DataValueField="id" Visible="False">
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="PositionLabel" runat="server" Text="Player's Position :"></asp:Label>
                    </td>
                    <td>
            <asp:DropDownList ID="PositionDropDownList" runat="server" DataSourceID="PositionSqlDataSource" DataTextField="positionName" DataValueField="positionName" Visible="False">
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="PlayerOriginLabel" runat="server" Text="Player's Origin/Country : "></asp:Label>
                    </td>
                    <td>
            <asp:DropDownList ID="PlayerCountryDropDownList" runat="server" DataSourceID="CountrySqlDataSource" DataTextField="CountryName" DataValueField="CountryName" Visible="False">
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Button ID="PlayerUpdateButton" ValidationGroup="Player" runat="server" Text="Update" />
            &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
            <asp:Label ID="PlayerUpdateLabel" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />

        </div>
        
        <br />
        <div>
            <asp:SqlDataSource ID="TeamNameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Team] ORDER BY [name]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="CountrySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CountryName] FROM [Countries] ORDER BY [CountryName]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="PlayerNameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Player] WHERE ([teamid] = @teamid)
ORDER BY name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="PlayerTeamNameDropDownList" Name="teamid" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="PositionSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Position] ORDER BY [positionName]"></asp:SqlDataSource>
            <br />
        </div>

    </form>
</body>
</html>
