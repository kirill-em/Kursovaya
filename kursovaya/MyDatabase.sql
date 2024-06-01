---- �������� ���� ������
CREATE DATABASE VetClinic;
GO

-- ������������� ���� ������
USE VetClinic;
GO

-- �������� ������� Employees
CREATE TABLE Employees (	
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
	Speciality NVARCHAR(20) NOT NULL,
	ImageData NVARCHAR(100) NOT NULL
);

-- �������� ������� Animals
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


-- ������� �������� ������ � ������� Employees
INSERT INTO Employees (Name, Address, Phone, Speciality)
VALUES
    ('����� ����������', '�. ������, ��������� ����� 33', '+7 (925) 020-53-12', '���������'),
    ('�������� �����������', '�. ������, ��. ������, �. 1, ��. 2', '+7 (982) 987-65-43', '����'),
    ('���� ����', '�. ������, ��. �������� �������, �. 21, ��. 420', '+7 (985) 456-78-90', '��������'),
    ('����� �������', '�. ������, ����� �����, �. 13, ��. 77', '+7 (987) 234-56-78', '��������');

-- ������� �������� ������ � ������� Animals
INSERT INTO Animals (Species, Name, Age, EmployeeId, Complaint)
VALUES
    ('���', '����', 5, 1, '������� ����'),
    ('������', '���', 5, 2, '������� ����');

-- ������� �������� ������ � ������� Services
INSERT INTO Services (Name, Price, AppointmentTime)
VALUES
    ('������� ', 1500.00, '18:30'),
    ('������������', 1300.00, '07:30'),
    ('����������', 500.00, '12:00'),
    ('��������� ��', 500.00, '14:00'),
    ('�����������', 2000.00, '16:00');

-- ������� �������� ������ � ������� EmployeeServices
INSERT INTO EmployeeServices (EmployeeId, ServiceId)
VALUES
    (1, 1), -- ����� ���������� ������������� ������ �� ��������
    (2, 2), -- �������� ����������� ������������� ������ �� ������������
    (3, 3), -- ���� ���� ������������� ������ �� ����������
    (4, 4); -- ����� ������� ������������� ������ �� �����������
GO