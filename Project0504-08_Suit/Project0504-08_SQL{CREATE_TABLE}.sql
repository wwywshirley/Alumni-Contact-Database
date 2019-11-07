CREATE TABLE [Skill] (
	skillId CHAR (8) NOT NULL,
	skillName VARCHAR(30),
	skillType VARCHAR(30),

	CONSTRAINT pk_skill_AlskillId PRIMARY KEY (skillId));


CREATE TABLE [JobRole] (
	jobId CHAR (6) NOT NULL,
	jobTitle VARCHAR(50),
	jobDescription VARCHAR(MAX) NULL,
	CONSTRAINT pk_JobRole_jobId PRIMARY KEY (jobId));

CREATE TABLE [Location] (
	locId CHAR (6) NOT NULL,
	city VARCHAR(20),
	locState VARCHAR(7),

	CONSTRAINT pk_Location_locId PRIMARY KEY (locId));

CREATE TABLE [Company] (
	comId CHAR (6) NOT NULL,
	comName VARCHAR(50),
	industry VARCHAR (50),
	comCapital VARCHAR(50)NULL,

	CONSTRAINT pk_Company_comId PRIMARY KEY (comId));


CREATE TABLE [Alumni] (
	alumniId CHAR (7) NOT NULL,
	fName VARCHAR (20),
	mName VARCHAR (20),
	lName VARCHAR (20),
	gradYear Datetime,
	gradTerm VARCHAR (10),
	empstatus VARCHAR (30),
	workYears NUMERIC(2,1),
	eMail VARCHAR(100),
	linkdinURL VARCHAR(100),
	officeNum CHAR(15) NULL,
	mobileNUM CHAR(15) NULL,
	comId CHAR(6),
	locId CHAR(6),
	jobId CHAR(6),
	
	CONSTRAINT pk_Alumni_id PRIMARY KEY (alumniId),
	CONSTRAINT fk_Alumni_comId FOREIGN KEY (comId)
		REFERENCES [Company](comId)
		ON DELETE SET NULL ON UPDATE CASCADE,
	
	CONSTRAINT fk_Alumni_locId FOREIGN KEY (locId)
		REFERENCES [Location](locId)
		ON DELETE SET NULL ON UPDATE CASCADE,

	CONSTRAINT fk_Alumni_jobId FOREIGN KEY (jobId)
		REFERENCES [JobRole](jobId)
		ON DELETE SET NULL ON UPDATE CASCADE
	);

CREATE TABLE [Certification] (
	alumniId CHAR (7) NOT NULL,
	skillId CHAR(8) Not Null,
	certName VARCHAR(MAX) Null,
	certDate Datetime Null,

	CONSTRAINT pk_Certification_alumniId_skillId PRIMARY KEY (alumniId,skillId),
	CONSTRAINT fk_Certification_alumniId FOREIGN KEY (alumniId)
		REFERENCES [Alumni](alumniId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Certification_skillId FOREIGN KEY (skillId)
		REFERENCES [Skill](skillId)
		ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE TABLE [Locatedin](
	comId CHAR(6) NOT NULL,
	locId CHAR (6) NOT NULL,
	CONSTRAINT pk_Locatiedin_comId_locId PRIMARY KEY(comId,locId),
	CONSTRAINT fk_Locatiedin_comId FOREIGN KEY (comId)
		REFERENCES [Company](comId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Locatedin_locId FOREIGN KEY (locId)
		REFERENCES [Location](locId)
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
