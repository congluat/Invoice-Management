CREATE DATABASE InvoiceManagement;


USE InvoiceManagement;

CREATE TABLE Users(
	Id INT NOT NULL AUTO_INCREMENT,
	Name NVARCHAR(100) NOT NULL,
	Age INT NOT NULL,
	PRIMARY KEY (Id)
);

CREATE TABLE Categories(
	Id INT NOT NULL AUTO_INCREMENT,
	Name NVARCHAR(100) NOT NULL UNIQUE,
	Description NVARCHAR(200),
	Logo NVARCHAR(200),
	PRIMARY KEY (Id)
);


CREATE TABLE Invoices(
	Id INT NOT NULL AUTO_INCREMENT,
	Name NVARCHAR(100) NOT NULL,
	Amount NUMERIC(15,3) NOT NULL,
	Time Datetime NOT NULL,
	Comment NVARCHAR(200),
	IsWarning BIT NOT NULL DEFAULT 0,
	Place NVARCHAR(200),
	CategoryId INT NOT NULL,
	UserId INT NOT NULL,
	PRIMARY KEY (Id),
	CONSTRAINT FK_invoice_cate FOREIGN KEY(CategoryId) REFERENCES Categories(Id),
	CONSTRAINT FK_invoice_user FOREIGN KEY(UserId) REFERENCES Users(Id)
);