CREATE TABLE Categories (
    CategoryID     INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName   VARCHAR(255) NOT NULL,
    Created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Products (
    ProductID            INT AUTO_INCREMENT PRIMARY KEY,
    ProductName          VARCHAR(255) NOT NULL,
    ProductDescription   TEXT NOT NULL,
    Price                DECIMAL(10, 2) NOT NULL,
    CategoryID           INT NOT NULL,
    Image_url            VARCHAR(255),
    Created_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Users (
    UserID       INT AUTO_INCREMENT PRIMARY KEY,
    UserName     VARCHAR(255) NOT NULL,
    Email        VARCHAR(255) NOT NULL,
    Password     VARCHAR(255) NOT NULL, 
    Role         ENUM('user', 'admin') DEFAULT 'user', 
    Created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Addresses (
    AddressID    INT AUTO_INCREMENT PRIMARY KEY,
    UserID       INT NOT NULL,
    Address_Line VARCHAR(255) NOT NULL,
    City         VARCHAR(255) NOT NULL,
    State        VARCHAR(255) NOT NULL,
    Postal_Code  VARCHAR(20) NOT NULL,
    Country      VARCHAR(255) NOT NULL,
    Created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE ShoppingCartItems (
    ItemID       INT PRIMARY KEY AUTO_INCREMENT,
    UserID       INT,
    ProductID    INT,
    Quantity     INT,
    Created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Orders (
    OrderID            INT AUTO_INCREMENT PRIMARY KEY,
    UserID             INT NOT NULL,
    OrderDate          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status             ENUM('pending', 'processing', 'delivered') DEFAULT 'pending',
    Total_amount       DECIMAL(10, 2) NOT NULL,
    Delivery_Address_ID INT NOT NULL,
    Created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (Delivery_Address_ID) REFERENCES Addresses(AddressID)
);

CREATE TABLE Order_Items (
    Order_ItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID      INT NOT NULL,
    ProductID    INT NOT NULL,
    Quantity     INT NOT NULL,
    Unit_price   DECIMAL(10, 2) NOT NULL,
    Created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Wishlists (
    WishlistID INT AUTO_INCREMENT PRIMARY KEY,
    UserID     INT NOT NULL,
    ProductID  INT NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID       INT AUTO_INCREMENT PRIMARY KEY,
    UserID          INT NOT NULL,
    OrderID         INT NOT NULL,
    Amount          DECIMAL(10, 2) NOT NULL,
    PaymentDate     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod   VARCHAR(255) NOT NULL,
    TransactionID   VARCHAR(255),
    Status          ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

