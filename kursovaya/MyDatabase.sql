---- Создание базы данных
CREATE DATABASE VetClinic;
GO

-- Использование базы данных
USE VetClinic;
GO

-- Создание таблицы Employees
CREATE TABLE Employees (	
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
	Speciality NVARCHAR(20) NOT NULL,
	ImageData NVARCHAR(100) NOT NULL
);

-- Создание таблицы Animals
CREATE TABLE Animals (
	AnimalId INT IDENTITY(1,1) PRIMARY KEY,
    Species NVARCHAR(50) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    EmployeeId INT FOREIGN KEY REFERENCES Employees(EmployeeId),
	Complaint NVARCHAR(50) NOT NULL
);

CREATE TABLE Logpass (
LogpassId INT IDENTITY(1,1) PRIMARY KEY,
Login NVARCHAR(200) NOT NULL,
Password NVARCHAR(200) NOT NULL,
);

CREATE TABLE Services (
    ServiceId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
	AppointmentTime NVARCHAR(5) NOT NULL,
);
CREATE TABLE EmployeeServices (
    EmployeeServiceId INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeName NVARCHAR(100),
	ServiceName NVARCHAR(100),
    EmployeeId INT FOREIGN KEY REFERENCES Employees(EmployeeId),
    ServiceId INT FOREIGN KEY REFERENCES Services(ServiceId),
);


-- Вставка тестовых данных в таблицу Employees
INSERT INTO Employees (Name, Address, Phone, Speciality)
VALUES
    ('Давид Багратунян', 'г. Москва, Можайское шоссе 33', '+7 (925) 020-53-12', 'Кардиолог'),
    ('Владимир Скорописцев', 'г. Москва, ул. Ленина, д. 1, кв. 2', '+7 (982) 987-65-43', 'крол'),
    ('Ясос Биба', 'г. Москва, ул. Разбитых фонарей, д. 21, кв. 420', '+7 (985) 456-78-90', 'Терапевт'),
    ('Елена Головач', 'г. Москва, улица Сезам, д. 13, кв. 77', '+7 (987) 234-56-78', 'Терапевт');

-- Вставка тестовых данных в таблицу Animals
INSERT INTO Animals (Species, Name, Age, EmployeeId, Complaint)
VALUES
    ('Кот', 'Кики', 5, 1, 'чешется лапа'),
    ('Собака', 'Бим', 5, 2, 'чешется пузо');

-- Вставка тестовых данных в таблицу Services
INSERT INTO Services (Name, Price, AppointmentTime)
VALUES
    ('Груминг ', 1500.00, '18:30'),
    ('Зоогостиница', 1300.00, '07:30'),
    ('Вакцинация', 500.00, '12:00'),
    ('Измерения АД', 500.00, '14:00'),
    ('Кардиология', 2000.00, '16:00');

-- Вставка тестовых данных в таблицу EmployeeServices
INSERT INTO EmployeeServices (EmployeeId, ServiceId)
VALUES
    (1, 1), -- Давид Багратунян предоставляет услуги по грумингу
    (2, 2), -- Владимир Скорописцев предоставляет услуги по зоогостинице
    (3, 3), -- Ясос Биба предоставляет услуги по вакцинация
    (4, 4); -- Елена Головач предоставляет услуги по кардиологии
GO