-- 1. Create a new table to store normalized data
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

/* Insert normalized data into the new table
Using First Normal Form (1NF) in database design is essential for ensuring that your database is well-structured and efficient. Here are some key reasons to use 1NF:

Eliminates Repeating Groups: 1NF ensures that each column contains atomic (indivisible) values, which means no repeating groups or arrays within a single column. This makes the data easier to query and manipulate.

Improves Data Integrity: By enforcing 1NF, you reduce the risk of data anomalies and inconsistencies. Each piece of data is stored in its most granular form, which helps maintain accuracy.

Simplifies Data Retrieval: With 1NF, querying the database becomes more straightforward because each piece of information is stored in a single, well-defined column. This makes it easier to write and understand SQL queries.

Facilitates Better Indexing: Atomic values allow for more efficient indexing, which can improve the performance of your database operations.*/

INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');


/*Using Second Normal Form (2NF) in database design builds on the principles of 1NF and further improves the structure and efficiency of your database. Here are the key reasons to use 2NF:

Eliminates Partial Dependencies: 2NF ensures that all non-key attributes are fully dependent on the entire primary key. This means that if you have a composite primary key, no non-key attribute should depend on only part of the primary key. This helps in reducing redundancy and improving data integrity.

Reduces Data Redundancy: By eliminating partial dependencies, 2NF helps to minimize duplicate data, which can save storage space and reduce the risk of inconsistencies.

Improves Data Integrity: With 2NF, the database structure is more robust, making it easier to maintain accurate and consistent data. This is because each piece of data is stored in only one place.

Simplifies Maintenance: A database in 2NF is easier to update and maintain. Changes to data are less likely to require multiple updates across different tables, reducing the risk of errors.
*/
-- 2. Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Create the OrderProducts table
CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into the OrderProducts table
INSERT INTO OrderProducts (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
