//*Data Definition Queries */

DROP TABLE IF EXISTS `leagues`;

CREATE TABLE `leagues` (
  `leagueID` int(11) NOT NULL AUTO_INCREMENT,
  `sport` varchar(255) NOT NULL,
  `gender` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `startDate` date,
  `endDate` date,
  PRIMARY KEY (`leagueID`),
  CONSTRAINT sport_gender_level UNIQUE (`sport`, `gender`, `level`),
  UNIQUE KEY `leagueID` (`leagueID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;


LOCK TABLES `leagues` WRITE;

INSERT INTO `leagues` VALUES (1,'hockey',0,2,'2020-07-07', '2020-07-28'),(2,'softball',1,1,'2021-04-05', '2021-11-28'),(3,'kickball',2,2,'2020-07-07', '2020-07-28'),(4,'running',0,21,'2020-07-07', '2020-07-28'),(5,'Waterpolo',0,5,'2020-07-07', '2020-07-28');

UNLOCK TABLES;


DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `playerID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` tinyint NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(255),
  PRIMARY KEY (`playerID`),
  UNIQUE KEY `playerID` (`playerID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;


LOCK TABLES `players` WRITE;

INSERT INTO `players` VALUES (1,'Jimmy','Lipe',0, '1994-04-20', 'littlelipey@jim.com', '760-333-3333'),(2,'BIG','VIN',0, '2020-07-28', 'BigVinWins@aol.com', '760-333-3333'),(3,'Little','K',1, '2020-07-28', 'lk@lk.com', '760-333-3333');

UNLOCK TABLES;


DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `teamID` int(11) NOT NULL AUTO_INCREMENT,
  `leagueID` int(11),
   FOREIGN KEY (leagueID) REFERENCES leagues(leagueID),
  `captainID` int(11),
   FOREIGN KEY (captainID) REFERENCES players(playerID),
  `teamName` varchar(255) NOT NULL,
  `wins` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  PRIMARY KEY (`teamId`),
  UNIQUE KEY `teamID` (`teamID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;



LOCK TABLES `teams` WRITE;

INSERT INTO `teams` VALUES (1,1,1,'Tanoak', 0, 4), (2,1,2,'Streambank Blazingstar', 40, 0);

UNLOCK TABLES;



DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `leagueID` int(11),
   FOREIGN KEY (leagueID) REFERENCES leagues(leagueID),
  `team1ID` int(11),
   FOREIGN KEY (team1ID) REFERENCES teams(teamID),
  `team2ID` int(11),
   FOREIGN KEY (team2ID) REFERENCES teams(teamID),
  `gameWinnerID` int(11),
   FOREIGN KEY (gameWinnerID) REFERENCES teams(teamID),
  `gameLocation` varchar(255) NOT NULL,
  `gameDate` date NOT NULL,
  `gameTime` time NOT NULL,
  `isPlayoff` tinyint(1),
  PRIMARY KEY (`gameID`),
  UNIQUE KEY `gameID` (`gameID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;


LOCK TABLES `games` WRITE;

INSERT INTO `games` VALUES (1,1,1,2, 2, 'Memphis', '2021-05-03', '10:30', 0), (2,1,1,2, 2, 'Dallas', '2021-05-01', '10:30', 1);

UNLOCK TABLES;



DROP TABLE IF EXISTS `rosters`;

CREATE TABLE `rosters` (
  `playerTeamID` int(11) NOT NULL AUTO_INCREMENT,
  `playerID` int(11),
   FOREIGN KEY (playerID) REFERENCES players(playerID),
  `teamID` int(11),
   FOREIGN KEY (teamID) REFERENCES teams(teamID),
  PRIMARY KEY (`playerTeamID`),
  UNIQUE KEY `playerTeamID` (`playerTeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;


LOCK TABLES `rosters` WRITE;

INSERT INTO `rosters` VALUES (1,1,1), (2,2,2), (3,3,2);

UNLOCK TABLES;