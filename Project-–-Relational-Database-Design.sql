---1. Insert data into each of the above tables. With at least two rows in each of
---the tables. Make sure that you have created respective foreign keys.
----2. Delete all the data from each of the tables.-- 1. Create Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,       
    UserName NVARCHAR(50),
    Email NVARCHAR(100)
);

-- 2. Create Roles Table
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,       
    RoleName NVARCHAR(50)
);

-- 3. Create UserAccounts Table
CREATE TABLE UserAccounts (
    AccountID INT PRIMARY KEY,    
    UserID INT,                   
    RoleID INT,
	password varchar(200),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- 4. Create Statuses Table
CREATE TABLE Statuses (
    StatusID INT PRIMARY KEY,     
    AccountID INT,                
    StatusName NVARCHAR(50),
    FOREIGN KEY (AccountID) REFERENCES UserAccounts(AccountID)
);
-- Insert data into Users Table
INSERT INTO Users (UserID, UserName, Email)
VALUES (1, 'John Doe', 'john@example.com'),
       (2, 'Jane Smith', 'jane@example.com');

-- Insert data into Roles Table
INSERT INTO Roles (RoleID, RoleName)
VALUES (1, 'Admin'),
       (2, 'User');

-- Insert data into UserAccounts Table
INSERT INTO UserAccounts (AccountID, UserID, RoleID)
VALUES (1, 1, 1),  
       (2, 2, 2); 

-- Insert data into Statuses Table
INSERT INTO Statuses (StatusID, AccountID, StatusName)
VALUES (1, 1, 'Active'),   
       (2, 2, 'Inactive'); 

-- Delete data from Statuses Table
DELETE FROM Statuses;

-- Delete data from UserAccounts Table
DELETE FROM UserAccounts;

-- Delete data from Roles Table
DELETE FROM Roles;

-- Delete data from Users Table
DELETE FROM Users;



