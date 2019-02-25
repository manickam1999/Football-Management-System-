Imports System.Data.SqlClient

Public Class Add

    Inherits System.Web.UI.Page
    'Creating an object of the sql.vb 
    Dim sql As sql = New sql()

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        'Pulling inputs from the design page
        Dim teamName As String = TeamNameTextBox.Text
        Dim countrySelected As String = CountryDropDownList.SelectedValue
        'Removing white space from the data pulled from the textbox
        teamName.Trim()
        'Try and catch for System.Data.SqlClient.SqlException to prevent the system from crashing
        Try
            'Sending data to run fucntions under sql.vb
            Dim rowsAffected As Integer = sql.addTeam(teamName, countrySelected)
            ' If more than zero rows affected, 
            ' insertion was successful!
            If rowsAffected > 0 Then
                MessageLabel.Text = "Added " & teamName
                'Calling the function ClearFields ()
                ClearFields()
            Else
                MessageLabel.Text = teamName & " was not added"
            End If
        Catch ex As System.Data.SqlClient.SqlException
            MessageLabel.Text = teamName & " exists"
        End Try


    End Sub

    Protected Sub PlayerSubmitButton_Click(sender As Object, e As EventArgs) Handles PlayerSubmitButton.Click
        'Pulling inputs from the design page
        Dim playerName As String = PlayerNameTextBox.Text
        'Removing white space from the data pulled from the textbox
        playerName.Trim()
        Dim nationalitySelected As String = NationalityDropDownList.SelectedValue
        Dim teamSelected As String = TeamNameDropDownList.SelectedValue
        Dim positionSelected As String = PositionDropDownList.SelectedValue
        'Try and catch for System.Data.SqlClient.SqlException to prevent the system from crashing
        Try
            'Sending data to run fucntions under sql.vb
            Dim rowsAffected As Integer = sql.addPlayer(playerName, nationalitySelected, teamSelected, positionSelected)
            ' If more than zero rows affected, 
            ' insertion was successful!
            If rowsAffected > 0 Then
                PlayerMessageLabel.Text = "Added " & playerName
                ClearFields()
            Else
                PlayerMessageLabel.Text = playerName & " was not added"
            End If

        Catch ex As System.Data.SqlClient.SqlException
            PlayerMessageLabel.Text = "Please input valid data"
        End Try

    End Sub

    Public Sub ClearFields()
        'Clearing the inputs in the texboxes
        TeamNameTextBox.Text = ""
        PlayerNameTextBox.Text = ""
        'Setting the default value to dropdownlists to Choose One
        CountryDropDownList.SelectedIndex = 0
        NationalityDropDownList.SelectedIndex = 0
        PositionDropDownList.SelectedIndex = 0
        'Setting the Team name drop down list to hidden meaning not visible
        TeamNameDropDownList.Visible = False
    End Sub

    Protected Sub NationalityDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles NationalityDropDownList.SelectedIndexChanged
        'Setting the Team name drop down list to viewable meaning visible
        TeamNameDropDownList.Visible = True
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
        LabelClear()
    End Sub

    Protected Sub CountryDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CountryDropDownList.SelectedIndexChanged
        'Clearing the label
        LabelClear()
    End Sub

    Public Sub LabelClear()
        MessageLabel.Text = ""
        PlayerMessageLabel.Text = ""
    End Sub
End Class