Imports System.Data.SqlClient
Public Class Delete
    Inherits System.Web.UI.Page
    'Creating an object of the sql.vb 
    Dim sql As sql = New sql()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'determine whether the page is being loaded in response to a client postback
        'if its not then run function PlayerTeam()
        If Not IsPostBack Then
            ' code which  is executed in the first time when the page is loaded.
            PlayerTeam()
        End If
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles DeleteButton.Click
        'Pulling inputs from the design page
        Dim teamName As String = TeamDropDownList.SelectedValue
        'Try and catch for System.Data.SqlClient.SqlException to prevent the system from crashing
        Try
            'Sending data to run fucntions under sql.vb
            Dim rowsAffected As Integer = sql.deleteTeam(teamName)
            ' If more than zero rows affected, 
            ' delete was successful!
            If rowsAffected > 0 Then
                TeamMessageLabel.Text = "Succesfully Deleted "
                'Updating the dropdownlist
                TeamDropDownList.Items.Remove(teamName)
                'Run the function PlayerTeam
                PlayerTeam()
            Else
                TeamMessageLabel.Text = " Failed to delete"
            End If

        Catch ex As System.Data.SqlClient.SqlException
            TeamMessageLabel.Text = "The selected team can't be deleted because the team consists of players"
            TeamDropDownList.SelectedIndex = 0
        End Try

    End Sub

    Protected Sub PlayerDeleteButton_Click(sender As Object, e As EventArgs) Handles PlayerDeleteButton.Click
        'Pulling inputs from the design page
        Dim PlayerId As Integer = PlayerNameDropDownList.SelectedValue
        'Try and catch for System.InvalidCastException to prevent the system from crashing
        Try
            'Sending data to run fucntions under sql.vb
            Dim rowsAffected As Integer = sql.deletePlayer(PlayerId)
            ' If more than zero rows affected, 
            ' delete was successful!
            If rowsAffected > 0 Then
                PlayerMessageLabel.Text = "Succesfully Deleted "
                'Setting the default value to dropdownlists to Choose One
                PlayerTeamDropDownList.SelectedIndex = 0
                'Setting the Team name drop down list to hidden meaning not visible
                PlayerNameDropDownList.Visible = False
                'Updating the dropdownlist
                PlayerNameDropDownList.Items.Remove(PlayerNameDropDownList.Items.FindByValue(PlayerId))

            Else
                PlayerMessageLabel.Text = " Failed to delete"
                'Setting the default value to dropdownlists to Choose One
                PlayerTeamDropDownList.SelectedIndex = 0
            End If
        Catch ex As System.InvalidCastException
            PlayerMessageLabel.Text = " Failed to delete"
        End Try
    End Sub


    Protected Sub PlayerTeamDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles PlayerTeamDropDownList.SelectedIndexChanged
        'Run the fucntion PlayerName() when there is a change in the player team drop down list
        PlayerName()
        'Clearing the label
        LabelClear()
    End Sub

    Public Sub LabelClear()
        PlayerMessageLabel.Text = ""
        TeamMessageLabel.Text = ""
    End Sub

    Public Sub PlayerName()
        'Setting the Team name drop down list to viewable meaning visible
        PlayerNameDropDownList.Visible = True
        'Setting the data source for the dropdownlist
        PlayerNameDropDownList.DataSource = PlayerNameSqlDataSource
        'The field that can be seen for the items in the list
        PlayerNameDropDownList.DataTextField = "name"
        'The value of the fields in the list
        PlayerNameDropDownList.DataValueField = "id"
        'Binding the data to create a connection between them
        PlayerNameDropDownList.DataBind()
        'Setting the default value as a hint 
        PlayerNameDropDownList.Items.Insert(0, New ListItem("Choose One", "0"))
    End Sub
    Public Sub PlayerTeam()
        'Setting the default value to dropdownlists to Choose One
        TeamDropDownList.SelectedIndex = 0
        'Setting the Team name drop down list to viewable meaning visible
        PlayerTeamDropDownList.Visible = True
        'Setting the data source for the dropdownlist
        PlayerTeamDropDownList.DataSource = PlayerTeamNameSqlDataSource
        'The field that can be seen for the items in the list
        PlayerTeamDropDownList.DataTextField = "name"
        'The value of the fields in the list
        PlayerTeamDropDownList.DataValueField = "id"
        'Binding the data to create a connection between them
        PlayerTeamDropDownList.DataBind()
        'Setting the default value as a hint 
        PlayerTeamDropDownList.Items.Insert(0, New ListItem("Choose One", "0"))
    End Sub

    Protected Sub TeamDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TeamDropDownList.SelectedIndexChanged
        LabelClear()

    End Sub
End Class