/*-- Query for add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language*/


/* -----------------------------------LEAGUE PAGE---------------------------------*/
--get all Sports names to populate sport dropdown
SELECT DISTINCT sport FROM leagues ORDER BY DESC
--get all genders to populate dropdown
SELECT DISTINCT gender FROM leagues ORDER BY DESC
--get all levels to populate dropdown
SELECT DISTINCT level FROM leagues ORDER BY DESC
--Select entire table to populate page
SELECT gender AS Gender, sport AS Sport, startDate AS [Start Date], endDate AS [End Date] FROM leagues
-- get a single leagues data for the Update leagues form
SELECT leagueID, sport, gender, level, startDate, endDate FROM leagues WHERE leagueID = :leagueID_selected_from_leagues_page
--Insert new League
INSERT INTO leagues (sport, gender, level, startDate, endDate) VALUES (:sportDropdownInput, :genderDropdownInput, :levelDropdownInput, :startInput, :endInput)
-- update a leagues data based on submission of the Update leagues form 
UPDATE leagues SET sport = :sportDropdownInput, gender= :genderDropdownInput, level = :levelDropdownInput, startDate = :startInput, endDate = :endInput WHERE id= :league_ID_from_the_update_form
-- delete a league
DELETE FROM leagues WHERE id = :leagueID_selected_from_leagues_page



/*-----------------------------------PLAYERS PAGE----------------------------------*/
--get all genders to populate dropdown
SELECT DISTINCT gender FROM players ORDER BY DESC
--Select entire table to populate page
SELECT CONCAT(firstName,' ',lastName) AS Name, gender, YEAR(CURDATE()) - YEAR(birthday) AS Age, email AS Email FROM players
-- get a single player's data for the Update player form
SELECT playerID, firstName, lastName, gender, birthday, email, phoneNumber FROM players WHERE playerID = :playerID_selected_from_players_page
--Insert new player
INSERT INTO players (firstName, lastName, gender, birthday, email, phoneNumber) VALUES (:fNameInput, :lNameInput, :genderDropdownInput, :emailInput, :phoneInput)
-- update a leagues data based on submission of the Update leagues form 
UPDATE players SET firstName = :fNameInput, lastName= :lNameInput, gender = :genderDropdownInput, email = :emailInput, phoneNumber = :phoneInput WHERE id= :player_ID_from_the_update_form
-- delete a league
DELETE FROM players WHERE id = :playerID_selected_from_players_page



/*-----------------------------------TEAMS PAGE----------------------------------*/
--Select entire table to populate page
SELECT T.teamName AS Name, L.sport AS Sport, L.gender AS Gender, 
L.level AS Level, T.wins as Wins, T.losses as Losses FROM teams T INNER JOIN leagues L
ON T.leagueID = L.leagueID
--filter Teams by Name 
SELECT teamName AS Name FROM teams WHERE teamName LIKE '%{:nameInput}%'
--Get leagues to put in dropdown menu
SELECT CONCAT(gender + ' ' + sport + ' ' + level + ' from ' + startDate + ' to ' + endDate) FROM teams ORDER BY DESC
-- get a single player's data for the Update player form
SELECT teamID, leagueID, captainID, teamName, wins, losses FROM teams WHERE teamID = :teamID_selected_from_teams_page
--Need to make captain ID selection form
SELECT CONCAT(firstName,' ',lastName) AS Name From players ORDER BY DESC
--Insert new team
INSERT INTO teams (leagueID, captainID, teamName, wins, losses) VALUES (:leagueID_from_dropdown, :captainID_from_dropdown, :teamNameInput, :winsInput, :lossesInput)
-- update a leagues data based on submission of the Update leagues form 
UPDATE teams SET leagueID = :leagueID_from_dropdown, captainID= :captainID_from_dropdown, teamName = :teamNameInput, wins = :winsInput, losses = :lossesInput WHERE id= :team_ID_from_the_update_form
-- delete a league
DELETE FROM teams WHERE id = :teamID_selected_from_team_page


/*-----------------------------------GAMES PAGE----------------------------------*/
--Select entire table to populate page
SELECT T.teamName,  FROM games
--Get leagues to put in dropdown menu
SELECT CONCAT(gender + ' ' + sport + ' ' + level + ' from ' + startDate + ' to ' + endDate) FROM teams ORDER BY DESC
-- get a single games's data for the Update game form
SELECT gameID, leagueID, team1ID, team2ID, gameWinnerID, gameLocation, gameDate, gameTime, isPlayoff FROM games WHERE gameID = :gameID_selected_from_games_page
--Insert new game
INSERT INTO games (leagueID, team1ID, team2ID, gameWinnerID, gameLocation, gameDate, gameTime, isPlayoff) VALUES (:leagueID_from_dropdown, :teamID_from_dropdown, :teamID_from_dropdown, :teamID_from_dropdown, :gameLocationInput, :gameDateInput, :gameTimeinput, :isPlayoffdropdown)
-- update a games data based on submission of the Update leaggamesues form 
UPDATE games SET leagueID = :leagueID_from_dropdown, team1ID= :teamID_from_dropdown, team2ID = :teamID_from_dropdown, gameWinnerID = :teamID_from_dropdown,, losses = :gameLocationInput, gameDate = :gameDateInput, gameTime = :gameTimeinput, isPlayoff = :isPlayoffdropdown  WHERE id= :team_ID_from_the_update_form
-- delete a league
DELETE FROM games WHERE id = :gameID_selected_from_game_page

/*-----------------------------------ROSTERS PAGE----------------------------------*/
--Select entire table to populate page
SELECT T.teamName AS Team, CONCAT(P.firstName,' ',P.lastName) AS Player FROM rosters R INNER JOIN
teams T ON T.teamID = R.teamID INNER JOIN players P ON P.playerID = R.playerID
-- get a single games's data for the Update game form
SELECT playerTeamID, playerID, teamID FROM rosters WHERE playerTeamID = :playerTeamID_selected_from_games_page
--Insert new game
INSERT INTO rosters (playerID, teamID) VALUES (:playerID_from_dropdown, :teamID_from_dropdown)
-- update a games data based on submission of the Update leaggamesues form 
UPDATE rosters SET playerID = :playerID_from_dropdown, team1ID= :teamID_from_dropdown WHERE id= :playerTeamID_from_the_update_form
-- delete a league
DELETE FROM rosters WHERE id = :playerTeamID_selected_from_rosters_page

