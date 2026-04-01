CREATE DATABASE FitTrackDB;
GO

USE FitTrackDB;
GO

-- Kullanıcı Tablosu
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(50),
    CurrentWeight DECIMAL(5,2),
    TargetWeight DECIMAL(5,2),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Supplement Takip Tablosu
CREATE TABLE Supplements (
    SuppID INT PRIMARY KEY IDENTITY(1,1),
    SuppName NVARCHAR(100),
    TotalServings INT,
    RemainingServings INT,
    DailyDosage INT,
    ExpiryDate DATE
);

-- Antrenman Kayıt Tablosu
CREATE TABLE WorkoutLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    ExerciseName NVARCHAR(100),
    Sets INT,
    Reps INT,
    WeightKG DECIMAL(5,2),
    LogDate DATETIME DEFAULT GETDATE()
);