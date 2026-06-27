USE SoccerAnalytics;
GO

CREATE TABLE Teams (
    TeamID INT PRIMARY KEY IDENTITY(1,1),
    TeamName VARCHAR(100) NOT NULL,
    Stadium VARCHAR(100),
    City VARCHAR(100)
);
GO

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY IDENTITY(1,1),
    PlayerName VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Age INT,
    TeamID INT NOT NULL,

    CONSTRAINT FK_Players_Teams
        FOREIGN KEY (TeamID)
        REFERENCES Teams(TeamID)
);
GO

CREATE TABLE Matches (
    MatchID INT PRIMARY KEY IDENTITY(1,1),
    MatchDate DATE NOT NULL,
    HomeTeamID INT NOT NULL,
    AwayTeamID INT NOT NULL,
    HomeGoals INT NOT NULL,
    AwayGoals INT NOT NULL,

    CONSTRAINT FK_Matches_HomeTeam
        FOREIGN KEY (HomeTeamID)
        REFERENCES Teams(TeamID),

    CONSTRAINT FK_Matches_AwayTeam
        FOREIGN KEY (AwayTeamID)
        REFERENCES Teams(TeamID)
);
GO

CREATE TABLE PlayerStats (
    StatID INT PRIMARY KEY IDENTITY(1,1),
    MatchID INT NOT NULL,
    PlayerID INT NOT NULL,
    Goals INT DEFAULT 0,
    Assists INT DEFAULT 0,
    MinutesPlayed INT DEFAULT 0,
    YellowCards INT DEFAULT 0,
    RedCards INT DEFAULT 0,

    CONSTRAINT FK_PlayerStats_Matches
        FOREIGN KEY (MatchID)
        REFERENCES Matches(MatchID),

    CONSTRAINT FK_PlayerStats_Players
        FOREIGN KEY (PlayerID)
        REFERENCES Players(PlayerID)
);
GO



