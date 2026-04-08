CREATE TABLE clinics (
    cid TEXT,
    clinic_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT
);

CREATE TABLE clinic_sales (
    oid TEXT,
    uid TEXT,
    cid TEXT,
    amount INTEGER,
    datetime TEXT,
    sales_channel TEXT
);

CREATE TABLE expenses (
    eid TEXT,
    cid TEXT,
    description TEXT,
    amount INTEGER,
    datetime TEXT
);

INSERT INTO clinics VALUES
('c1','Clinic A','Hyderabad','Telangana','India'),
('c2','Clinic B','Chennai','Tamil Nadu','India'),
('c3','Clinic C','Bangalore','Karnataka','India'),
('c4','Clinic D','Mumbai','Maharashtra','India'),
('c5','Clinic E','Delhi','Delhi','India');

INSERT INTO clinic_sales VALUES
('o1','u1','c1',5000,'2021-11-10 10:00:00','online'),
('o2','u2','c2',3000,'2021-10-12 12:00:00','offline'),
('o3','u3','c3',7000,'2021-11-15 14:00:00','online'),
('o4','u4','c4',2000,'2021-09-20 16:00:00','offline'),
('o5','u5','c5',9000,'2021-11-25 18:00:00','online');

INSERT INTO expenses VALUES
('e1','c1','medicines',2000,'2021-11-10 09:00:00'),
('e2','c2','rent',1500,'2021-10-12 10:00:00'),
('e3','c3','equipment',3000,'2021-11-15 13:00:00'),
('e4','c4','maintenance',1000,'2021-09-20 15:00:00'),
('e5','c5','staff salary',4000,'2021-11-25 17:00:00');