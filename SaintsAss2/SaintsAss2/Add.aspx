<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Add.aspx.vb" MaintainScrollPositionOnPostBack="true" Inherits="SaintsAss2.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Menu.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 26px;
            width: 150px;
        }
        .auto-style3 {
            width: 150px;
        }
        .auto-style4 {
            margin-left: 80px;
        }
        .auto-style5 {
            height: 29px;
            width: 238px;
        }
        .auto-style6 {
            height: 29px;
            margin-left: 80px;
        }
        .auto-style7 {
            height: 26px;
            width: 238px;
        }
        .auto-style8 {
            width: 238px;
        }
        .auto-style9 {
            width: 150px;
            height: 52px;
        }
        .auto-style10 {
            height: 52px;
        }
        .auto-style11 {
            width: 150px;
            height: 33px;
        }
        .auto-style12 {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="Add" runat="server">
        <div>
            <h1 id ="title"> Football Management System</h1>
        </div>

        <div>
         <ul>
          <li><a href="Main.aspx">Summary</a></li>
          <li><a class="active" href="Add.aspx">Add</a></li>
          <li><a href="Edit.aspx">Edit</a></li>
          <li><a href="Delete.aspx">Delete</a></li>
          <li><a href="View.aspx">View</a></li>
        </ul>
        </div>
            
        <h2>Add</h2>

        <h3>Team Table</h3>
        <div>
            <asp:ValidationSummary ID="TeamValidationSummary" runat="server" DisplayMode="List" ValidationGroup ="Team" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="#FF3300" />
          
            <table id="AddTeamTable" style="margin:0 auto" aria-multiline="False" border="0" style="width:100%;">
                <tr>
                    <td aria-multiline="True" class="auto-style2">
        <asp:Label ID="TeamNameLabel" runat="server" Text="Team Name :"></asp:Label>
                    </td>
                    <td class="auto-style1">
        <asp:TextBox ID="TeamNameTextBox" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="TeamNameRequiredFieldValidator" ValidationGroup ="Team" runat="server" ControlToValidate="TeamNameTextBox" ErrorMessage="Please input valid name" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td aria-multiline="True" class="auto-style9">
            <asp:Label ID="TeamCountryLabel" runat="server" Text="Team Country:"></asp:Label>
                    </td>
                    <td class="auto-style10">
            <asp:DropDownList ID="CountryDropDownList" AppendDataBoundItems="True" runat="server" DataSourceID="TeamAddSqlDataSource" DataTextField="CountryName" DataValueField="CountryName" AutoPostBack="True">
             <asp:ListItem Text="Choose One"></asp:ListItem>
            </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="TeamCountryRequiredFieldValidator0" ValidationGroup ="Team" runat="server" ControlToValidate="CountryDropDownList" ErrorMessage="Please select valid country" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td aria-multiline="True" class="auto-style11">
       <asp:Button ID="SubmitButton" ValidationGroup="Team" runat="server" Text="Submit" />
                    </td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td aria-multiline="True" class="auto-style3">
            <asp:Label ID="MessageLabel" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:SqlDataSource ID="TeamAddSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CountryName] FROM [Countries]"></asp:SqlDataSource>
       </div>

        <h3>Player Table</h3>
        <div>
              <asp:ValidationSummary ID="PlayerValidationSummary" runat="server" DisplayMode="List" ValidationGroup ="Player" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="#FF3300" />

            <table id="AddPlayerTable" style="margin:0 auto" aria-multiline="True" style="width:100%;">
                <tr>
                    <td class="auto-style7">


            <asp:Label ID="PlayerNameLabel" runat="server" Text="Player Name:"></asp:Label>
                    </td>
                    <td class="auto-style1">
            <asp:TextBox ID="PlayerNameTextBox" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="PlayerNameRequiredFieldValidator0" ValidationGroup ="Player" runat="server" ControlToValidate="PlayerNameTextBox" ErrorMessage="Please input valid name" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
            <asp:Label ID="PlayerOriginLabel" runat="server" Text="Player Origin / Nationality :"></asp:Label>
                    </td>
                    <td>
            <asp:DropDownList ID="NationalityDropDownList" AppendDataBoundItems="True" runat="server" DataSourceID="TeamAddSqlDataSource" DataTextField="CountryName" DataValueField="CountryName" CausesValidation="True" AutoPostBack="True">
                <asp:ListItem Text="Choose One"></asp:ListItem>
            </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="NationalityRequiredFieldValidator" ValidationGroup ="Player" runat="server" ControlToValidate="NationalityDropDownList" ErrorMessage="Please select valid nationality" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
            <asp:Label ID="PlayerTeamLabel" runat="server" Text="Player Team Name :"></asp:Label>
                    </td>
                    <td class="auto-style6">
            <asp:DropDownList ID="TeamNameDropDownList" AutoPostBack="True" runat="server" Visible="False">
            </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="PlayerTeamRequiredFieldValidator" ValidationGroup ="Player" runat="server" ControlToValidate="TeamNameDropDownList" ErrorMessage="Please select valid team" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
            <asp:Label ID="PlayerPositionLabel" runat="server" Text="Player Position:"></asp:Label>
                    </td>
                    <td class="auto-style4">
            <asp:DropDownList ID="PositionDropDownList" AppendDataBoundItems="true" runat="server" DataSourceID="PlayerPositionSqlDataSource" DataTextField="positionName" DataValueField="positionName" AutoPostBack="True">
                <asp:ListItem Text="Choose One"></asp:ListItem>
            </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="PositionRequiredFieldValidator" ValidationGroup ="Player" runat="server" ControlToValidate="PositionDropDownList" ErrorMessage="Please select valid position" Font-Bold="True" ForeColor="#FF3300" InitialValue="Choose One"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
            <asp:Button ID="PlayerSubmitButton" ValidationGroup="Player" runat="server" Text="Submit" />
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
            <asp:Label ID="PlayerMessageLabel" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <asp:SqlDataSource ID="TeamNameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [id] FROM [Team] ORDER BY [name]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="PlayerPositionSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [positionName] FROM [Position] ORDER BY [positionName]"></asp:SqlDataSource>


        </div>

     </form>
</body>
</html>
