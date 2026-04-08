CREATE TABLE users (
    user_id TEXT,
    name TEXT,
    phone_number TEXT,
    mail_id TEXT,
    billing_address TEXT
);


CREATE TABLE bookings (
    booking_id TEXT,
    booking_date TEXT,
    room_no TEXT,
    user_id TEXT
);


CREATE TABLE items (
    item_id TEXT,
    item_name TEXT,
    item_rate INTEGER
);


CREATE TABLE booking_commercials (
    id TEXT,
    booking_id TEXT,
    bill_id TEXT,
    bill_date TEXT,
    item_id TEXT,
    item_quantity REAL
);

### sample data ###

INSERT INTO users VALUES
('u1','John','9999999991','john@gmail.com','Hyderabad'),
('u2','Alice','9999999992','alice@gmail.com','Chennai'),
('u3','Bob','9999999993','bob@gmail.com','Bangalore'),
('u4','David','9999999994','david@gmail.com','Mumbai'),
('u5','Emma','9999999995','emma@gmail.com','Delhi');

INSERT INTO bookings VALUES
('b1','2021-11-10 10:00:00','r1','u1'),
('b2','2021-11-12 12:00:00','r2','u2'),
('b3','2021-10-05 09:00:00','r3','u3'),
('b4','2021-11-20 15:30:00','r4','u4'),
('b5','2021-10-25 18:45:00','r5','u5');

INSERT INTO items VALUES
('i1','Paratha',20),
('i2','Veg Curry',100),
('i3','Rice',50),
('i4','Paneer',150),
('i5','Tea',10);

INSERT INTO booking_commercials VALUES
('c1','b1','bill1','2021-11-10 11:00:00','i1',2),
('c2','b1','bill1','2021-11-10 11:00:00','i2',1),
('c3','b2','bill2','2021-11-12 13:00:00','i3',3),
('c4','b2','bill2','2021-11-12 13:00:00','i5',5),
('c5','b3','bill3','2021-10-05 10:00:00','i4',2),
('c6','b4','bill4','2021-11-20 16:00:00','i2',4),
('c7','b4','bill4','2021-11-20 16:00:00','i1',3),
('c8','b5','bill5','2021-10-25 19:00:00','i3',2),
('c9','b5','bill5','2021-10-25 19:00:00','i5',6);