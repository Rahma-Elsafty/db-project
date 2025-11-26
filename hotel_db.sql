use hotel ;

CREATE TABLE Guest (
    G_ID INT AUTO_INCREMENT PRIMARY KEY, 
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    SSD VARCHAR(20),     -- National ID
    Age INT
);
-- AUTO_INCREMENT ده السطر القولتلكوا عليه بيزود تلقائي
select * from guest;

CREATE TABLE RoomType (
    RoomType_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Name VARCHAR(50),
    PricePerNight DECIMAL(10,2)
);
select * from RoomType;

CREATE TABLE Room (
    R_ID INT AUTO_INCREMENT PRIMARY KEY,
    Number VARCHAR(10) UNIQUE,
    Floor INT,
    Status VARCHAR(20),  -- Available, Booked, Under Maintenance
    RoomType_ID INT,
    FOREIGN KEY (RoomType_ID) REFERENCES RoomType(RoomType_ID)
);
select * from Room;

CREATE TABLE Booking (
    B_ID INT AUTO_INCREMENT PRIMARY KEY,
    G_ID INT,
    R_ID INT,
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Booking_Date DATE,
    Meal_Plan VARCHAR(50),
    Status VARCHAR(20),   -- Confirmed, Cancelled, Pending
    FOREIGN KEY (G_ID) REFERENCES Guest(G_ID),
    FOREIGN KEY (R_ID) REFERENCES Room(R_ID)
);
select * from booking;

CREATE TABLE Payment (
    Pay_ID INT AUTO_INCREMENT PRIMARY KEY,
    B_ID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Method VARCHAR(30),  -- Card, Cash, Online
    FOREIGN KEY (B_ID) REFERENCES Booking(B_ID)
);
select * from payment;

CREATE TABLE Staff (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Role VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10,2),
    HireDate DATE
);
select * from staff;

--------------------------------
-- 7) Shift Table
--------------------------------
CREATE TABLE Shift (
    Shift_ID INT AUTO_INCREMENT PRIMARY KEY,
    ShiftName VARCHAR(50),
    StartTime TIME,
    EndTime TIME
);
select * from shift;

CREATE TABLE Shift_Staff (
    ShiftStaff_ID INT AUTO_INCREMENT PRIMARY KEY,
    Staff_ID INT,
    Shift_ID INT,
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Shift_ID) REFERENCES Shift(Shift_ID)
);
select * from shift_staff;
