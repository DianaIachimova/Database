drop database if exists Cristina;
create database Cristina;
use Cristina;

create table Pozitie(
id_pozitie int primary key not null auto_increment,
etaj int not null,
butic int not null);


create table Oras(
id_oras int not null primary key auto_increment,
denumire_oras  varchar(25) not null ); /*denumirea orasului in care se afla compania*/


create table Tara(
id_tara int  not null primary key auto_increment ,
denumire_tara  varchar(25) not null, /*denumirea tarii in care se afla compania*/
id_oras int not null,
foreign key (id_oras) references Oras(id_oras)); 



create table Companie( /*producatori de incaltaminte*/
id_companie int primary key not null auto_increment,
/*denumirea companii*/
denumire varchar(50) not null,
id_tara int not null,
foreign key (id_tara) references Tara(id_tara),
adresa varchar(40) not null); 


create table Count_categorie  /*tabelul va stoca cate produse are fiecare categorie*/
(id_count int not null ,
categorie  varchar(40) not null primary key,
nr_de_produse int not null
);


create table Produs(
id_produs int primary key not null auto_increment,
tip_client varchar(40) not null, /* femei, barbati, fete, baieti*/
categorie varchar(40) not null, /*categoria : pantofi, adidasi, cizme, etc.*/
foreign key (categorie) references Count_categorie(categorie),
den varchar(40) not null unique, /*denumirea incaltamintei prin cod specific pentru usurarinta*/
culoare varchar(60) not null,
material varchar(60) not null,
pret double not null,
id_companie int not null,
foreign key (id_companie) references Companie(id_companie),
id_pozitie int not null,
foreign key (id_pozitie) references Pozitie(id_pozitie),
stoc char(15) not null,
check (stoc='este' or stoc='nu este')); /* este sau nu in stoc*/


insert into Pozitie values 
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,5),
(6,1,6),
(7,2,7),
(8,2,8),
(9,2,9),
(10,2,10),
(11,2,11),
(12,2,12),
(13,3,13),
(14,3,14),
(15,3,15),
(16,3,16),
(17,3,17),
(18,3,18),
(19,4,19),
(20,4,20),
(21,4,21),
(22,4,22),
(23,4, 23),
(24,4,24);

insert into Oras values
(1, 'Chisinau'),
(2,'Reghin'),
(3, 'Bucuresti'),
(4, 'Pitesti'),
(5,'Oradea'),
(6, 'Potgoria'),
(7, 'Vicovau de Sud' ),
(8, 'Sibiu'),
(9,'Alba Iulia'),
(10, 'Lutsk'),
(11,'Dnepr'),
(12, 'Kiev'),
(13,'Odesa'),
(14, 'Gungoren' ),
(15, 'Instanbul'),
(16, 'Lagadas'),
(17, 'Athens');


insert into Tara values
(1, 'Moldova', 1),
(2, 'Romania', 2 ),
(3, 'Romania', 3),
(4, 'Romania', 4),
(5, 'Romania', 5),
(6, 'Romania', 6),
(7, 'Romania', 7),
(8, 'Romania', 8),
(9, 'Romania', 9),
(10, 'Ucraina', 10),
(11, 'Ucraina', 11),
(12, 'Ucraina', 12),
(13, 'Ucraina', 13),
(14, 'Turcia', 14),
(15, 'Turcia', 15),
(16, 'Grecia', 16),
(17, 'Grecia', 17);



insert into Companie values
(1, 'OLDCOM', 1,'str.Industriala 3'),
(2, 'Frunza', 1,'str.Alexei Mateevici 49/7'),
(3,'Cadentzza', 2, 'str.Castanilor 19'),
(4,'Corvaris', 3, 'str.Sfantul Gheorghe 2'),
(5,'Mateo', 4, 'str.Marasesti 20'),
(6, 'Leofex', 5, 'str.Matei Corvin 68'),
(7,'Mopiel', 6,'str.Podgoriei 29'),
(8,'Nevalis', 7, 'str.Calea Cernauti'),
(9,'Marelbo', 8, 'str.Nicolae Balcescu 14'),
(10, 'Rekord',  9, 'str.Alba Iulia 40A'),
(11, 'BELTSA',  10, 'str.Ershova 11'),
(12, 'Grace',11, 'str.Kedrina 49'),
(13,'MTI',  12, 'str. Pimonenko 13'),
(14,'Lotos', 12, 'str.Yaroslavliv 10b'),
(15, 'Garda', 13, 'str.Elisavetinska 1'),
(16, 'Actas', 14,'str.Sanayi 34'),
(17, 'Livens', 15, 'str.Oruc Reis 9'),
(18, 'Deco', 15, 'str.Emin Sinan 89'),
(19, 'Katia', 16, 'str. Kavalari 572'),
(20, 'Sea', 17, 'str.Filotheis 111');





insert into Produs values
(1, 'femei', 'pantofi','90/20', 'bordo', 'textil',760,1, 1, 'este'),
(2, 'femei', 'pantofi','89/10', 'auriu', 'piele naturala',632, 2, 2, 'este'),
(3, 'femei','sandale', '56/30','albastru', 'textil',1000,3, 3,'este'),
(4, 'femei','cizme', '67/45','gri', 'piele ecologica',800, 4, 4, 'este'),
(5, 'femei', 'cizme', '54/54','rosu','piele ecologica',1900,5, 5, 'este'),
(6, 'femei', 'adidasi', '78/76','roz','piele ecologica', 2000,6, 6, 'este'),
(7, 'femei','adidasi','11/109','negru','piele ecologica',700,7,1, 'nu este'),
(8, 'femei', 'botine', '9/119','mov','textil',780,8, 2, 'este'),
(9, 'femei', 'botine','99/10','negru','piele naturala',890,9,3, 'este'),
(10, 'femei', 'balerini','34/11','albastru','piele naturala', 1200,10,4, 'este'),
(11, 'femei', 'tenisi','17/22','khaki','piele naturala',900,11, 5, 'nu este'),
(12, 'femei','tenisi', '18/67','alb','piele ecologica', 750,12,6, 'este'),
(13, 'femei','sandale', '55/202','maro','textil', 550,13,6, 'este'),
(14, 'barbati', 'adidasi','49/203', 'negru','piele ecologica', 760,14,7, 'este'),
(15, 'barbati','adidasi','23/56', 'alb', 'piele ecologica', 1250,15, 8, 'este'),
(16, 'barbati','pantofi','60/47','visiniu', 'piele naturala',650,16, 9, 'este'),
(17, 'barbati', 'pantofi', '7/111', 'negru','piele naturala' , 800,17, 10, 'nu este'),
(18, 'barbati','ghete','102/21','albastru', 'piele naturala', 700,18, 11, 'este'),
(19, 'barbati','ghete','589/90','galben', 'piele egologica', 1200,19, 12, 'este'),
(20, 'barbati','mocasini', '6/909','rosu', 'piele ecologica', 900,20,7, 'este'),
(21, 'barbati','mocasini', '90/11','maro', 'piele ecologica', 890,1, 8, 'nu este'),
(22, 'barbati','tenisi', '34/670','negru', 'textil', 1250,2, 9, 'este'),
(23, 'barbati','tenisi','121/12', 'verde','textil',670,3, 10,'este'),
(24, 'barbati','sandale', '708/79','rosu cu negru', 'textil',700, 4, 11, 'este'),
(25, 'barbati','sandale','9123/89','khaki', 'textil', 1350, 5, 12, 'este'),
(26, 'barbati','adidasi','612/908','negru cu alb', 'textil', 890, 6, 7, 'este'),
(27, 'fete','ghete','97/22','roz', 'piele naturala', 400,7, 13, 'nu este'),
(28, 'fete','ghete','82/21','violet','poliuretan', 330,8, 14, 'este'),
(29, 'fete','cizme','681/98','roz','sintetic',450, 9,15, 'este'),
(30, 'fete','cizme', '78/200','bordo','textil', 280, 10, 16, 'este'),
(31, 'fete','pantofi','42/962', 'alb', 'piele naturala',320, 11,17, 'este'),
(32, 'fete','pantofi','77/7789','roz', 'sintetic', 100, 12,18, 'este'),
(33, 'fete','pantofi','899/99','portocaliu', 'textil', 200, 13, 13,'nu este'),
(34, 'fete','balerini', '729/212','azuriu', 'textil', 180,14,14, 'este'),
(35, 'fete','balerini','123/344', 'roz', 'textil', 200, 16,15, 'este'),
(36, 'fete','sandale','3/44', 'albastru','sintetic', 180, 17,16, 'este'),
(37, 'fete','sandale','74/321','alb', 'sintetic', 99.99, 18,17, 'este'),
(38, 'fete','adidasi', '9/134','roz','sintetic',120, 19,18, 'este'),
(39, 'fete','adidasi','77/88','rosu','mesh', 300, 20,15, 'este'),
(40, 'baieti','cizme','14/102','negru','sintetic',550, 1,19, 'este'),
(41, 'baieti','cizme','2/3','albastru', 'sintetic',600, 2,20, 'este'),
(42, 'baieti','ghete','17/900', 'negru','sintetic', 200, 3, 21, 'este'),
(43, 'baieti','ghete','92/88','maro', 'sintetic', 280, 4, 22, 'nu este'),
(44, 'baieti','ghete','78/35','negru','piele', 320, 5, 23, 'este'),
(45, 'baieti','pantofi','31/7','negru','piele naturala', 300, 6,24, 'este'),
(46, 'baieti','pantofi','8/105','bej','piele ecologica',400, 7,19, 'este'),
(47, 'baieti','adidasi','11/1110','albastru','textil',200, 9,20, 'este'),
(48, 'baieti','adidasi','79/778', 'negru','mesh',220, 10,  21, 'este'),
(49, 'baieti','sandale','79/680','verde', 'textil', 150, 14, 22, 'este'),
(50, 'baieti','sandale','56/999','sur','textil', 100, 20,23, 'este');


insert into Count_categorie values
(1, 'pantofi',9),
(2, 'sandale', 8),
(3, 'cizme', 6),
(4, 'adidasi', 9),
(5, 'botine', 2), 
(6, 'balerini', 3),
(7 , 'tenisi', 4),     
(8, 'ghete', 7),
(9, 'mocasini', 2);



/*adaugarea unui nou produs*/

insert into Produs(id_produs,tip_client,categorie, den, culoare, material, pret, id_companie,id_pozitie,stoc) values
(51, 'mame', 'sandale', '89/00','negru','textil', 700, 5,1,'este');
select *from Produs;

/*cate produse sunt din piele ecologica din Romania*/
drop view if exists NrProd;
create view NrProd as
select count(den) as Nr_produse
from Produs natural join Companie natural join Tara
where material='piele ecologica'
and
denumire_tara='Romania';

/*stergerea incaltamintei care nu e in stoc*/

delete from Produs 
where stoc='nu este';
select * from Produs;

/*modificarea adresei a companiei OLDCOM din  Moldova, Chisinau*/

update Companie
natural join Tara natural join Oras
Set adresa='str. Ciocarlia 14'
where denumire='OLDCOM'
and
denumire_tara='Moldova'
and 
denumire_oras='Chisinau';
select * from Companie;


/*dobanda totala, daca se vand toate perechile de pantofi
stiind ca dobanda pentru fiecare pereche e 20%*/
drop view if exists Dobanda;
create view Dobanda as 
select sum(pret*0.2*nr_de_produse) 
as Dobanda_totala
from Produs 
natural join Count_categorie; 

select * from Dobanda;

/*majorarea pretului produselor care sunt minime in stoc cu 15%*/
update Produs natural join Count_categorie
set Pret=Pret+((Pret*15)/100)
where nr_de_produse in
(select min(nr_de_produse) 
from Count_categorie);

select *from Produs;



/* compania cel mai scump produs, si datete produsului*/
drop view if exists Scump;
create view Scump as 
select    tip_client ,categorie, pret, culoare , material, denumire, denumire_tara, denumire_oras
from Produs natural join Companie natural join Tara natural join Oras 
where Pret in 
( select max(Pret)
from Produs);

select * from Scump; 


/*produsele ale producatorului Cadentzza*/
drop view if exists AlegProducator;
create view AlegProducator as
select tip_client,categorie, den, culoare, material, pret, denumire
from Produs
natural join Companie 
where denumire='Cadentzza'; 
select * from AlegProducator;


/*Afisarea tuturor produselor din Romania ordonate ascendent dupa id*/
drop view if exists Afisare;
create view Afisare as 
select id_produs,tip_client,categorie, den, culoare, material, pret,  denumire_tara, denumire_oras, stoc
from Produs natural join Companie natural join Tara natural join  Oras
where denumire_tara='Romania'
order by id_produs asc;

select * from Afisare;


/*Nr de produse pentru fiecare tip de client*/
drop view if exists Client;
create view Client as
select count(*)as Nr_produse, tip_client
From Produs
group by tip_client;

select * from Client;


/*afisarea adidasilor pentru fete, baieti si barbati*/
drop view if exists Adidasi;
create view Adidasi as
select id_produs,tip_client,categorie, den, culoare, material, pret,  denumire_tara, denumire_oras, stoc
from Produs natural join Companie natural join Tara natural join  Oras
where tip_client in('fete', 'baieti', 'barbati')
and
categorie='adidasi';

select *from Adidasi; 


/*afiseaza nr d produse in companiile care se incep cu M ordonate crescator*/
drop view if exists Litera ;
create view Litera as
select count(den) as Nr_produse, denumire
from Produs natural join Companie
where denumire like 'M%'
group by id_companie
order by denumire asc;

select *from Litera;



/*toate produsele din Ucraina care au pretul >700 s <1500*/
drop view if exists PretStabilit;
create view PretStabilit as
select id_produs,tip_client, categorie, den, culoare, material, pret,stoc
from Produs natural join  Companie natural join Tara
where pret>700
and pret<1500
and
 denumire_tara='Ucraina';
 
 select *from PretStabilit;


/*numarul de produse din buticul 6 */
drop view if exists Aranjare;
create view Aranjare as
select count(den) as Nr_produse
from Produs natural join Pozitie
where butic=6;

select * from Aranjare;



/*date depre ghetele pentru baieti de  culoarea neagra*/
drop view if exists ProdusSpecific;
create view ProdusSpecific as
select *from Produs
where tip_client='baieti'
and 
categorie='ghete'
and
culoare ='negru';

select * from ProdusSpecific;
