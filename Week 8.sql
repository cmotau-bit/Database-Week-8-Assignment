-- Database creation

CREATE DATABASE clinic_booking_system;

USE clinic_booking_system;

-- Tables creation

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE Specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    specialization_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE DoctorSpecializations (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id)
);

CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    floor INT NOT NULL
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    room_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Data insertion

INSERT INTO Patients (name, email, date_of_birth, phone) VALUES
('Langa Qoka', 'langa@gmail.com', '1990-06-15', '0729681445'),
('Mbali Mutshi', 'mbali@yahoo.com', '1985-09-25', '0789632541');

INSERT INTO Doctors (name, email, phone) VALUES
('Dr. Cynthia Motau', 'cynthia.motau@mediclinic.com', '0793697878'),
('Dr. Tshiamo Mabhena', 'tshiamo.mabhena@mediclinic.com', '0718888884');

INSERT INTO Specializations (specialization_name) VALUES
('Cardiology'),
('Dermatology'),
('Pediatrics');

INSERT INTO DoctorSpecializations (doctor_id, specialization_id) VALUES
(1, 1), -- Dr. Cynthia: Cardiology
(2, 2), -- Dr. Tshiamo: Dermatology
(2, 3); -- Dr. Tshiamo: Pediatrics

INSERT INTO Rooms (room_number, floor) VALUES
('101A', 1),
('202B', 2);

INSERT INTO Appointments (patient_id, doctor_id, room_id, appointment_date, reason) VALUES
(1, 1, 1, '2025-05-01 10:30:00', 'Routine heart checkup'),
(2, 2, 2, '2025-05-02 14:00:00', 'Skin rash consultation');
