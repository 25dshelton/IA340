-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS Professor
(
    p_email VARCHAR(100) NOT NULL,
    p_name VARCHAR(100) NOT NULL,
    office VARCHAR(10),
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS Student
(
    s_email VARCHAR(50) NOT NULL,
    s_name VARCHAR(100),
    major VARCHAR(100),
    PRIMARY KEY(s_email)
);

CREATE TABLE IF NOT EXISTS Course
(
    c_number VARCHAR(50) NOT NULL,
    c_name VARCHAR(20),
    room VARCHAR(10) NOT NULL,
    p_name VARCHAR(100) NOT NULL,
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS Enroll
(
    s_email VARCHAR(50) NOT NULL,
    c_number VARCHAR(50) NOT NULL,
    PRIMARY KEY(s_email, c_number)
);


-- Create FKs
ALTER TABLE Course
    ADD    FOREIGN KEY (p_name)
    REFERENCES Professor(p_email)
    MATCH SIMPLE
;
    
ALTER TABLE Enroll
    ADD    FOREIGN KEY (c_number)
    REFERENCES Course(c_number)
    MATCH SIMPLE
;
    
ALTER TABLE Enroll
    ADD    FOREIGN KEY (s_email)
    REFERENCES Student(s_email)
    MATCH SIMPLE
;
    

-- Create Indexes

