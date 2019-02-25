Imports System.Data.SqlClient
Public Class Edit
    Inherits System.Web.UI.Page
    'Creating an object of the sql.vb 
    Dim sql As sql = New sql()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'determine whether the page is being loaded in response to a client postback
        If Not IsPostBack Then
            ' code which  is executed in the first time when the page is loaded.
            TeamLoad()
            PlayerTeamLoad()
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TeamNameDropDownList.SelectedIndexChanged
        'Setting the selected value
        Dim teamId As Integer = TeamNameDropDownList.SelectedValue
        'Run the fucntion Team Display with an input value TeamID
        TeamDisplay(teamId)
        'Clearing the label
        LabelCLear()
    End Sub

    Public Sub TeamDisplay(teamId As Integer)
        TeamRemoveReadOnlyAndClear()
        'Sending data to run fucntions under sql.vb
        Dim dt As DataTable = sql.loadTeam(teamId)
        'If there is no value 
        If (dt.Rows.Count = 0) Then
            TeamUpdateLabel.Text = "No content found"
        Else
            'If there is value pull the data and display them at their respective GUI
            TeamIDTextBox.Text = dt.Rows(0).Item("id").ToString()
            TeamNameTextBox.Text = dt.Rows(0).Item("name").ToString()
            CountryDropDownList.SelectedValue = dt.Rows(0).Item("country").ToString()
        End If
    End Sub

    Public Sub TeamRemoveReadOnlyAndClear()
        'Clearing the field
        TeamIDTextBox.Text = ""
        TeamNameTextBox.Text = ""
        'Making the dropdownlist visible 
        CountryDropDownList.Visible = True
        'Making the texbox editable 
        TeamNameTextBox.ReadOnly = False
    End Sub

    Protected Sub UpdateButton_Click(sender As Object, e As EventArgs) Handles UpdateButton.Click
        'Pulling inputs from the design page
        Dim Selected As String = TeamNameDropDownList.SelectedValue
        Dim TeamID As String = TeamIDTextBox.Text
        Dim TeamName As String = TeamNameTextBox.Text
        Dim SelectedCountry As String = CountryDropDownList.SelectedValue
        'Try and catch for System.Data.SqlClient.SqlException to prevent the system from crashing
        Try
            Dim rowsAffected As Integer = sql.updateTeam(TeamName, SelectedCountry, Selected)
            If rowsAffected > 0 Then
                ' If more than zero rows affected, 
                ' update was successful!
                TeamUpdateLabel.Text = TeamName & " has been updated"
                TeamRemoveReadOnlyAndClear()
                'Setting the default value to 0
                TeamNameDropDownList.SelectedIndex = 0
                'Setting the textbox to not editable
                TeamNameTextBox.ReadOnly = True
                'Making the drodownlist visible
                CountryDropDownList.Visible = False
                'Run the function
                PlayerTeamLoad()
            Else
                TeamUpdateLabel.Text = TeamName & " failed to update "
            End If
        Catch ex As System.Data.SqlClient.SqlException
            TeamUpdateLabel.Text = TeamName & " already exsits "
        End Try
    End Sub

    Public Sub PlayerReadOnlyVisibleCLear()
        'Clearing the field
        PlayerNameTextBox.Text = ""
        'Making the texbox editable 
        PlayerNameTextBox.ReadOnly = False
        'Setting the Team name drop down list to visible 
        PositionDropDownList.Visible = True
        PlayerCountryDropDownList.Visible = True
        PlayersTeamEditDropDownList.Visible = True
    End Sub

    Public Sub PlayerDisplay(ByVal playerId As Integer)
        'Calling the function
        PlayerReadOnlyVisibleCLear()
        'Sending data to run fucntions under sql.vb
        Dim dt As DataTable = sql.loadPlayers(playerId)
        'If there is no value
        If (dt.Rows.Count = 0) Then
            PlayerUpdateLabel.Text = "No content found"
        Else
            'If there is value pull the data and display them at their respective GUI
            PlayerIDTextBox.Text = dt.Rows(0).Item("id").ToString()
            PlayerNameTextBox.Text = dt.Rows(0).Item("name").ToString()
            PlayersTeamEditDropDownList.SelectedValue = dt.Rows(0).Item("teamid")
            PositionDropDownList.SelectedValue = dt.Rows(0).Item("position")
            PlayerCountryDropDownList.SelectedValue = dt.Rows(0).Item("nationality").ToString()
        End If
    End Sub

    Protected Sub PlayerNameDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles PlayerNameDropDownList.SelectedIndexChanged
        'Try and catch for System.InvalidCastException to prevent the system from crashing
        Try
            'Setting the selected value
            Dim playerId As Integer = PlayerNameDropDownList.SelectedValue
            'Calling the fucntion and sending the value
            PlayerDisplay(playerId)
        Catch ex As System.InvalidCastException
            'Display error message
            PlayerUpdateLabel.Text = "Input valid data"
            PlayerReset()
        End Try
    End Sub

    Protected Sub PlayerTeamNameDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles PlayerTeamNameDropDownList.SelectedIndexChanged
        'Setting the dropdownlist to visible
        PlayerNameDropDownList.Visible = True
        'Setting the data source for the dropdownlist
        PlayerNameDropDownList.DataSource = PlayerNameSqlDataSource
        'The field that can be seen for the items in the list
        PlayerNameDropDownList.DataTextField = "name"
        'The value of the fields in the list
        PlayerNameDropDownList.DataValueField = "id"
        'Binding the data to create a connection between them
        PlayerNameDropDownList.DataBind()
        PlayerNameDropDownList.Items.Insert(0, New ListItem("Choose One", ""))
        'If there are no other items in the player list besides the default hint
        If PlayerNameDropDownList.Items.Count < 2 Then
            'Hide the player list
            PlayerNameDropDownList.Visible = False
            'Display error message
            PlayerUpdateLabel.Text = "There are no players in the current selected team to be edited"
        End If
        'Clearing the label
        LabelCLear()
    End Sub

    Public Sub LabelCLear()
        PlayerUpdateLabel.Text = ""
        TeamUpdateLabel.Text = ""
    End Sub

    Public Sub PlayerReset()
        'Setting the default value to dropdownlists to Choose One
        PlayerTeamNameDropDownList.SelectedIndex = 0
        'Clearing the field
        PlayerNameTextBox.Text = ""
        'Setting the Team name drop down list to hidden meaning not visible
        PositionDropDownList.Visible = False
        PlayerCountryDropDownList.Visible = False
        PlayersTeamEditDropDownList.Visible = False
        PlayerNameDropDownList.Visible = False
        'Clear the textbox
        PlayerIDTextBox.Text = ""
    End Sub

    Protected Sub PlayerUpdateButton_Click(sender As Object, e As EventArgs) Handles PlayerUpdateButton.Click
        Dim playerID As Integer = PlayerNameDropDownList.SelectedValue
        Dim playerName As String = PlayerNameTextBox.Text
        Dim playerTeam As Integer = PlayersTeamEditDropDownList.SelectedValue
        Dim playerPosition As String = PositionDropDownList.SelectedValue
        Dim playerOrigin As String = PlayerCountryDropDownList.SelectedValue
        Dim rowsAffected As Integer = sql.updatePlayer(playerName, playerOrigin, playerPosition, playerTeam, playerID)
        If rowsAffected > 0 Then
            ' If more than zero rows affected, 
            ' update was successful!
            PlayerUpdateLabel.Text = playerName & " has been updated"
            PlayerReset()
        Else
            PlayerUpdateLabel.Text = playerName & " failed to update "
        End If
    End Sub

    Public Sub PlayerTeamLoad()
        'Clearing all the items in the drop down list
        PlayerTeamNameDropDownList.Items.Clear()
        'Setting the data source for the dropdownlist
        PlayerTeamNameDropDownList.DataSource = TeamNameSqlDataSource
        'The field that can be seen for the items in the list
        PlayerTeamNameDropDownList.DataTextField = "name"
        'The value of the fields in the list
        PlayerTeamNameDropDownList.DataValueField = "id"
        'Binding the data to create a connection between them
        PlayerTeamNameDropDownList.DataBind()
        'Setting the default value as a hint 
        PlayerTeamNameDropDownList.Items.Insert(0, New ListItem("Choose One", ""))
    End Sub

    Public Sub TeamLoad()
        'Clearing all the items in the drop down list
        TeamNameDropDownList.Items.Clear()
        'Setting the data source for the dropdownlist
        TeamNameDropDownList.DataSource = TeamNameSqlDataSource
        'The field that can be seen for the items in the list
        TeamNameDropDownList.DataTextField = "name"
        'The value of the fields in the list
        TeamNameDropDownList.DataValueField = "id"
        'Binding the data to create a connection between them
        TeamNameDropDownList.DataBind()
        'Setting the default value as a hint 
        TeamNameDropDownList.Items.Insert(0, New ListItem("Choose One", ""))
    End Sub

End Class