create database GestVote
on primary (
name=GestVote_data,
filename='C:\Users\bouti\OneDrive\سطح المكتب\Base De donne\Tp\Tp 5\GestVote\GestVote.mdf',
size= 10 MB
)
log on(
name=GestVote_log,
filename='C:\Users\bouti\OneDrive\سطح المكتب\Base De donne\Tp\Tp 5\GestVote\GestVote.ldf',
size= 10 MB
)
use GestVote

-- 3-	Ecrire les requêtes SQL pour créer la base de données « GestVote » et les tables correspondantes en 
-- La table Categorie
create table Categorie(
codeCat varchar(10) primary key,
libelle varchar(50)
)

-- La table Film
create table Film(
codeF varchar(10) primary key,
titre varchar(30),
[Description] varchar(50),
langue varchar(20),
anne_production int,
codeCat varchar(10) ,
constraint fk_codeCat_Categorie foreign key(codeCat) references Categorie(codeCat)
)
-- La table Juge
create table Juge(
codeJ varchar(10) primary key,
num int ,
prenom varchar(20),
nationalite varchar(20)
)
-- La table Vote
create table Vote(
codeF varchar(10),
codeJ varchar(10),
constraint pk_Vote primary key(codeF,codeJ),
constraint fk_codeF foreign key(codeF) references Film(codeF),
constraint fk_codeJ foreign key(codeJ) references Juge(codeJ)
)
-- 4-	Insérer des jeux d’essai.
-- la remplissage de table Categorie
insert into Categorie values('c1','Action')
insert into Categorie values('c2','Drama')
insert into Categorie values('c3','science fiction')
insert into Categorie values('c4','comedie')

-- la remplissage de table Film
insert into Film values('F1','The Shawshank Redemption','description:The Shawshank Redemption... ','anglais',1996,'C2')
insert into Film values('F2',' The Godfather','description: The Godfather... ','anglais',1972,'C1')
insert into Film values('F3',' 12 Angry men','description: 12 Angry men... ','anglais',1957,'C2')
insert into Film values('F4','  UpSide Down','description:  Upside Down... ','anglais',2012,'C3')
insert into Film values('F5',' Spy','description: Spy... ','anglais',2015,'C4')
insert into Film values('F6','Bloodshot','description: Bloodshot...','anglais',2020,'C1')

-- la remplissage de table Juge
insert into Juge values('J1',1,'mohammed','Marocaine') 
insert into Juge values('J2',2,'tanirte','Marocaine') 
insert into Juge values('J3',3,'idder','Marocaine') 
insert into Juge values('J4',4,'youba','Marocaine') 
insert into Juge values('J5',5,'ghilas','Marocaine') 
insert into Juge values('J6',6,'toudrt','Marocaine') 
insert into Juge values('J7',7,'mina','Marocaine') 
insert into Juge values('J8',8,'fatima','Marocaine') 
insert into Juge values('J9',9,'amnay','Marocaine') 
insert into Juge values('J10',10,'tilila','Marocaine') 

-- la remplissage de Vote
insert into Vote values('F1','J1')
insert into Vote values('F1','J2')
insert into Vote values('F5','J3')
insert into Vote values('F2','J4')
insert into Vote values('F1','J5')
insert into Vote values('F1','J6')
insert into Vote values('F5','J7')
insert into Vote values('F4','J8')
insert into Vote values('F5','J9')
insert into Vote values('F3','J10')

-- 5-	Ecrire une requête pour modifier la table Film en ajoutant 
--      une contrainte permettant d’empêcher d’insérer un film avec 
--      une année de production supérieure à l’année en cour
alter table Film add constraint anProduction check(anne_production < datePart(Year,getdate()))

-- 6-	Ecrire une requête qui affiche tous les films de la catégorie
--      Action et qui ont été produit a partir de l’année 2019 
select * from Film
where codeCat='C1' and anne_production>=2019
