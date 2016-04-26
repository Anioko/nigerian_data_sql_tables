CREATE TABLE VillageArea
(
  VillageID INT NOT NULL,
  VillageName VARCHAR(25) NOT NULL,
  PRIMARY KEY (VillageID)
);

CREATE TABLE Sex
(
  SexID INT NOT NULL,
  SexDescription VARCHAR(25) NOT NULL,
  PRIMARY KEY (SexID)
);

CREATE TABLE MaritalStatus
(
  MaritalStatusID INT NOT NULL,
  MaritalDescription VARCHAR(10) NOT NULL,
  PRIMARY KEY (MaritalStatusID)
);

CREATE TABLE Contact_Details
(
  ContactID INT NOT NULL,
  StreetName VARCHAR(25) NOT NULL,
  HouseAddress INT NOT NULL,
  ZipNo INT NOT NULL,
  PhoneNo INT NOT NULL,
  PoBox INT NOT NULL,
  Fax INT NOT NULL,
  Email VARCHAR(50) NOT NULL,
  VillageID INT NOT NULL,
  PRIMARY KEY (ContactID),
  FOREIGN KEY (VillageID) REFERENCES VillageArea(VillageID),
  UNIQUE (Email)
);

CREATE TABLE Skill
(
  SkillID INT NOT NULL,
  SkillName VARCHAR(25) NOT NULL,
  Description VARCHAR(90) NOT NULL,
  PRIMARY KEY (SkillID)
);

CREATE TABLE WorkStatus
(
  WorkStatusID INT NOT NULL,
  WorkDescription VARCHAR(25) NOT NULL,
  PRIMARY KEY (WorkStatusID)
);

CREATE TABLE Education
(
  EducationID INT NOT NULL,
  SchoolName VARCHAR(50) NOT NULL,
  StartDate DATE NOT NULL,
  GraduateDate DATE NOT NULL,
  PRIMARY KEY (EducationID)
);

CREATE TABLE WorkPlace
(
  WorkPlaceID INT NOT NULL,
  WorkPlaceName VARCHAR NOT NULL,
  ContactID INT NOT NULL,
  PRIMARY KEY (WorkPlaceID),
  FOREIGN KEY (ContactID) REFERENCES Contact_Details(ContactID)
);

CREATE TABLE Lga
(
  lgaID INT NOT NULL,
  LgaName VARCHAR(25) NOT NULL,
  VillageID INT NOT NULL,
  PRIMARY KEY (lgaID),
  FOREIGN KEY (VillageID) REFERENCES VillageArea(VillageID)
);

CREATE TABLE Person
(
  PersonID INT NOT NULL,
  FirstName VARCHAR(25) NOT NULL,
  LastName VARCHAR(25) NOT NULL,
  MiddleName VARCHAR(25) NOT NULL,
  BirthDate DATE NOT NULL,
  DeathDate DATE NOT NULL,
  ContactID INT NOT NULL,
  SkillID INT NOT NULL,
  WorkStatusID INT NOT NULL,
  SexID INT NOT NULL,
  MaritalStatusID INT NOT NULL,
  EducationID INT NOT NULL,
  PRIMARY KEY (PersonID),
  FOREIGN KEY (ContactID) REFERENCES Contact_Details(ContactID),
  FOREIGN KEY (SkillID) REFERENCES Skill(SkillID),
  FOREIGN KEY (WorkStatusID) REFERENCES WorkStatus(WorkStatusID),
  FOREIGN KEY (SexID) REFERENCES Sex(SexID),
  FOREIGN KEY (MaritalStatusID) REFERENCES MaritalStatus(MaritalStatusID),
  FOREIGN KEY (EducationID) REFERENCES Education(EducationID)
);

CREATE TABLE State
(
  stateID INT NOT NULL,
  LgaName VARCHAR(25) NOT NULL,
  LgaID INT NOT NULL,
  PRIMARY KEY (stateID),
  FOREIGN KEY (LgaID) REFERENCES Lga(lgaID)
);
