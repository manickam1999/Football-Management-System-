Imports System.Data.SqlClient
Public Class sql
    'Establishing the connection to the database
    Private Const connStr As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Soccer.mdf;Integrated Security=True"
    Public Function addTeam(teamName As String, teamCountry As String) As Integer
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)
        ' Set up the SqlCommand to insert team into team table
        Dim teamAdd As String = "INSERT INTO Team (name,country) VALUES (@n,@c)"
        Dim teamAddCmd As SqlCommand = New SqlCommand(teamAdd, conn)
        'To add the new team we retive the value inputted by the user then add them to their respective columns 
        ' by using @n for team name and @c for country 
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        teamAddCmd.Parameters.Clear()
        teamAddCmd.Parameters.AddWithValue("n", teamName)
        teamAddCmd.Parameters.AddWithValue("c", teamCountry)
        'connection to the database is open for the the command to be executed and closed after its executed to maintain the apps performance 
        conn.Open()
        'To check if the command has executed succesfully 
        Dim rowsAffected As Integer = teamAddCmd.ExecuteNonQuery()
        ' connection to the database is closed
        conn.Close()
        'returning the value to check if the command has executed succesfully 
        Return rowsAffected
    End Function

    Public Function addPlayer(playerName As String, playerNationality As String, playerTeam As String, playerPosition As String) As Integer
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)
        ' Set up the SqlCommand to insert player into player table
        Dim playeradd As String = "INSERT INTO Player(name,nationality,teamid,position)" & "VALUES(@n,@na,@t,@p)"
        Dim playerAddCmd As SqlCommand = New SqlCommand(playeradd, conn)
        'To add the new player we retive the value inputted by the user then add them to their respective columns 
        ' by using @n for player name , @na for nationality , @t for team and @p for position
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        playerAddCmd.Parameters.Clear()
        playerAddCmd.Parameters.AddWithValue("n", playerName)
        playerAddCmd.Parameters.AddWithValue("na", playerNationality)
        playerAddCmd.Parameters.AddWithValue("t", playerTeam)
        playerAddCmd.Parameters.AddWithValue("p", playerPosition)
        'connection is open for the the command to be executed and closed after its executed to maintain the apps performance 
        conn.Open()
        'To check if the command has executed succesfully 
        Dim rowsAffected As Integer = playerAddCmd.ExecuteNonQuery()
        ' connection to the database is closed
        conn.Close()
        'returning the value to check if the command has executed succesfully 
        Return rowsAffected
    End Function

    Public Function loadTeam(teamId As Integer) As DataTable
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)
        ' Set up the SqlCommand to display every column from the team table for the team id which is inputed
        ' by the user which is sent to the query by using @i
        Dim teamSql As String = "SELECT * FROM Team WHERE id = @i"
        Dim teamCmd As SqlCommand = New SqlCommand(teamSql, conn)
        'To display the team we retive the value inputted by the user then add them to their respective columns 
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        teamCmd.Parameters.Clear()
        teamCmd.Parameters.AddWithValue("i", teamId)
        'connection is open for the the command to be executed and closed after its executed to maintain the apps performance 
        conn.Open()
        '  The SqlDataAdapter will put the teamcmd
        ' query results inside a DataSet with the label "result"
        Dim adapter As SqlDataAdapter = New SqlDataAdapter(teamCmd)
        Dim result As DataTable = New DataTable()
        adapter.Fill(result)
        ' connection to the database is closed
        conn.Close()
        'it returns all the value from the respective column
        Return result
    End Function

    Public Function updateTeam(teamName As String, teamCountry As String, teamId As String) As Integer
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)

        ' Set up the SqlCommand to update team into team table
        Dim teamUpdateSql As String = "UPDATE Team SET name = @n,country = @c WHERE id =@i"
        Dim teamUpdateCmd As SqlCommand = New SqlCommand(teamUpdateSql, conn)
        'To update the new team info we retive the value edited by the user then add them to their respective columns 
        ' by using @n for team name and @c for country. @i is used to for the teamid which is used to determine the column to be updated
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        teamUpdateCmd.Parameters.Clear()
        teamUpdateCmd.Parameters.AddWithValue("n", teamName)
        teamUpdateCmd.Parameters.AddWithValue("c", teamCountry)
        teamUpdateCmd.Parameters.AddWithValue("i", teamId)
        'connection is open for the the command to be executed and closed after its executed to maintain the apps performance 
        conn.Open()
        'To check if the command has executed succesfully 
        Dim rowsAffected As Integer = teamUpdateCmd.ExecuteNonQuery()
        ' connection to the database is closed
        conn.Close()
        'returning the value to check if the command has executed succesfully 
        Return rowsAffected
    End Function

    Public Function loadPlayers(playerId As Integer) As DataTable
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)
        ' Set up the SqlCommand to extract info of a player from player table
        Dim playerSql As String = "SELECT * FROM Player WHERE id =@i"
        Dim playerCmd As SqlCommand = New SqlCommand(playerSql, conn)
        'To display the player's info we retive the value inputted by the user then add them to their respective columns 
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        playerCmd.Parameters.Clear()
        playerCmd.Parameters.AddWithValue("i", playerId)
        'connection is open for the the command to be executed and closed after its executed to maintain the apps performance 
        conn.Open()
        '  The SqlDataAdapter will use the playercmd
        ' query results inside a DataSet with the label "result"
        Dim adapter As SqlDataAdapter = New SqlDataAdapter(playerCmd)
        Dim result As DataTable = New DataTable()
        adapter.Fill(result)
        ' connection to the database is closed
        conn.Close()
        'it returns all the value from the respective column
        Return result
    End Function

    Public Function updatePlayer(playerName As String, playerNationality As String, playerPosition As String, playerTeam As Integer, playerId As Integer) As Integer
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)
        ' Set up the SqlCommand to update player into team table
        Dim playerUpdateSql As String = "UPDATE Player SET name = @n, nationality = @o, position = @p, teamid = @t WHERE id =@i"
        Dim playerUpdateCmd As SqlCommand = New SqlCommand(playerUpdateSql, conn)
        'To update the new player info we retive the value edited by the user then add them to their respective columns 
        ' by using @n for player name and @o for nationality, @p for position player by the player, @t for the team the player is in
        '@i Is used to for the teamid which is used to determine the column to be updated
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        playerUpdateCmd.Parameters.Clear()
        playerUpdateCmd.Parameters.AddWithValue("n", playerName)
        playerUpdateCmd.Parameters.AddWithValue("o", playerNationality)
        playerUpdateCmd.Parameters.AddWithValue("p", playerPosition)
        playerUpdateCmd.Parameters.AddWithValue("t", playerTeam)
        playerUpdateCmd.Parameters.AddWithValue("i", playerId)
        'connection is open for the the command to be executed and closed after its executed to maintain the apps performance 
        conn.Open()
        'To check if the command has executed succesfully 
        Dim rowsAffected As Integer = playerUpdateCmd.ExecuteNonQuery
        ' connection to the database is closed
        conn.Close()
        'returning the value to check if the command has executed succesfully 
        Return rowsAffected
    End Function

    Public Function deleteTeam(teamName As String) As Integer
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)
        ' Set up the SqlCommand to delete team in the team table
        Dim teamDel As String = "DELETE FROM Team WHERE name = @n"
        Dim teamDelCmd As SqlCommand = New SqlCommand(teamDel, conn)
        'To delete the respective team we retive the value inputted by the user 
        ' by using @n for team name to identify which team to be deleted
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        teamDelCmd.Parameters.Clear()
        teamDelCmd.Parameters.AddWithValue("n", teamName)
        'connection is open for the the command to be executed and closed after its executed to maintain the apps performance 
        conn.Open()
        'To check if the command has executed succesfully 
        Dim rowsAffected As Integer = teamDelCmd.ExecuteNonQuery
        ' connection to the database is closed
        conn.Close()
        'returning the value to check if the command has executed succesfully 
        Return rowsAffected
    End Function

    Public Function deletePlayer(playerId As Integer) As Integer
        'Setting up the connection
        Dim conn As SqlConnection = New SqlConnection(connStr)
        ' Set up the SqlCommand to delete team in the team table
        Dim playerDel As String = "DELETE FROM Player WHERE id = @i"
        Dim playerDelCmd As SqlCommand = New SqlCommand(playerDel, conn)
        playerDelCmd = New SqlCommand(playerDel, conn)
        'To delete the respective player we retive the value inputted by the user 
        ' by using @i for player id to identify which player to be deleted
        'Parameters.clear () is used to ensure that the parameters from any previous call are sent again.
        playerDelCmd.Parameters.Clear()
        playerDelCmd.Parameters.AddWithValue("i", playerId)
        'connection is open for the the command to be executed and closed after its executed to maintain the apps performance 
        'To check if the command has executed succesfully
        conn.Open()
        Dim rowsAffected As Integer = playerDelCmd.ExecuteNonQuery()
        ' connection to the database is closed
        conn.Close()
        'returning the value to check if the command has executed succesfully 
        Return rowsAffected
    End Function
End Class
