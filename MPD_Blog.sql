#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Article
#------------------------------------------------------------

CREATE TABLE Article(
        id            Int  Auto_increment  NOT NULL ,
        titre         Varchar (50) NOT NULL ,
        contenu       Text NOT NULL ,
        date_parution Date NOT NULL
	,CONSTRAINT Article_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commentaire
#------------------------------------------------------------

CREATE TABLE Commentaire(
        id         Int  Auto_increment  NOT NULL ,
        contenu    Text NOT NULL ,
        date_post  Date NOT NULL ,
        id_Article Int NOT NULL
	,CONSTRAINT Commentaire_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Administrateur
#------------------------------------------------------------

CREATE TABLE Administrateur(
        id    Int  Auto_increment  NOT NULL ,
        email Varchar (50) NOT NULL ,
        login Varchar (50) NOT NULL ,
        mdp   Varchar (50) NOT NULL
	,CONSTRAINT Administrateur_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: News_Letter
#------------------------------------------------------------

CREATE TABLE News_Letter(
        id          Int  Auto_increment  NOT NULL ,
        sujet       Varchar (50) NOT NULL ,
        Titre       Varchar (50) NOT NULL ,
        contenu     Text NOT NULL ,
        date_envoie Date NOT NULL
	,CONSTRAINT News_Letter_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Abonne
#------------------------------------------------------------

CREATE TABLE Abonne(
        id     Int  Auto_increment  NOT NULL ,
        nom    Varchar (50) NOT NULL ,
        prenom Varchar (50) NOT NULL ,
        email  Varchar (100) NOT NULL
	,CONSTRAINT Abonne_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Reçoit
#------------------------------------------------------------

CREATE TABLE Recoit(
        id             Int NOT NULL ,
        id_News_Letter Int NOT NULL
	,CONSTRAINT Recoit_PK PRIMARY KEY (id,id_News_Letter)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Categorie
#------------------------------------------------------------

CREATE TABLE Categorie(
        id           Int  Auto_increment  NOT NULL ,
        nom          Varchar (50) NOT NULL ,
        id_Categorie Int
	,CONSTRAINT Categorie_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Catégorise
#------------------------------------------------------------

CREATE TABLE Categorise(
        id         Int NOT NULL ,
        id_Article Int NOT NULL
	,CONSTRAINT Categorise_PK PRIMARY KEY (id,id_Article)
)ENGINE=InnoDB;




ALTER TABLE Commentaire
	ADD CONSTRAINT Commentaire_Article0_FK
	FOREIGN KEY (id_Article)
	REFERENCES Article(id);

ALTER TABLE Recoit
	ADD CONSTRAINT Recoit_Abonne0_FK
	FOREIGN KEY (id)
	REFERENCES Abonne(id);

ALTER TABLE Recoit
	ADD CONSTRAINT Recoit_News_Letter1_FK
	FOREIGN KEY (id_News_Letter)
	REFERENCES News_Letter(id);

ALTER TABLE Categorie
	ADD CONSTRAINT Categorie_Categorie0_FK
	FOREIGN KEY (id_Categorie)
	REFERENCES Categorie(id);

ALTER TABLE Categorise
	ADD CONSTRAINT Categorise_Categorie0_FK
	FOREIGN KEY (id)
	REFERENCES Categorie(id);

ALTER TABLE Categorise
	ADD CONSTRAINT Categorise_Article1_FK
	FOREIGN KEY (id_Article)
	REFERENCES Article(id);
	

#------------------------------------------------------------
# Index: Abonne
#------------------------------------------------------------	
CREATE INDEX abonne_index ON abonne (nom,prenom);

