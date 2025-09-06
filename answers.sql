-- Ouestion one: 1NF.
-- Problem: The Products column contains multiple values in one row.
-- Solution: Break them into separate rows so each cell is atomic (single value).

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert normalized rows (one product per row instead of a list)
INSERT INTO ProductDetail_1NF VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- qestion 2: 2NF (Second Normal Form)
-- Problem: CustomerName depends only on OrderID (part of the key), not the full composite key (OrderID + Product).
-- This is a partial dependency, which violates 2NF.
-- Solution: Split the table into two: Orders and OrderDetails.
-- Orders table (stores OrderID and CustomerName to remove redundancy)

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- OrderDetails table (stores Product and Quantity, fully dependent on composite key)--
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into Orders --
INSERT INTO Orders VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert into OrderDetails --
INSERT INTO OrderDetails_2NF VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
