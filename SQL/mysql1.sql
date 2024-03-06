-- Que -1 	Create a database structure for product and categories. One product can be in more than one category and one category can have multiple products.

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2)
);
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);
CREATE TABLE Product_Category (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Que -2. Create a database structure for students and its college. One student can be on one college only. 

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    CollegeID INT,
    FOREIGN KEY (CollegeID) REFERENCES Colleges(CollegeID)
);

CREATE TABLE Colleges (
    CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(255),
    Location VARCHAR(255)
);

-- Que -3.	Create a database structure for worldwide cricket team. Database will contain, each player’s name, its country, it’s expertise and so on.

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(255),
    CountryID INT,
    Expertise VARCHAR(255),
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(255),
);