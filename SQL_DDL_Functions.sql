--create a table
create table TBLDERSLER
( 
DERSID tinyint,
DERSAD varchar(20)
)

--We wanted to add a new column:
alter table TBLDERSLER
Add KONTENJAN smallint

--We wanted to delete the existing column:
alter table TBLDERSLER
drop column KONTENJAN

--select
select * from TBLOGRENCILER
SELECT OGRAD, OGRCINSIYET FROM TBLOGRENCILER

--select with conditions
SELECT * FROM TBLOGRENCILER WHERE OGRAD='Ali' 
SELECT * FROM TBLOGRENCILER WHERE OGRAD='Ali' or OGRKULUP= 'satranç'
SELECT * FROM TBLNOTLAR
SELECT (SINAV1 + SINAV2+  SINAV3)/3 FROM TBLNOTLAR 
SELECT t.OGRENCI as ýd , (SINAV1 + SINAV2+  SINAV3)/3 as ortalama FROM TBLNOTLAR t order by OGRENCI

--INSERT
select * from TBLOGRENCILER
insert into TBLOGRENCILER(OGRAD, OGRSOYAD, OGRSEHIR) VALUES ( 'BARAN', 'YÜCEDAÐ', 'ELAZIÐ')

Insert into TBLNOTLAR (OGRENCI, DERS, SINAV1, SINAV3) VALUES (6, 2, 88, 67)

--delete

delete from TBLDERSLER where DERSID = 2

--TRUNCATE
truncate table TBLDERSLER -- RESET THE LESSONS TABLE.

--UPDATE

UPDATE TBLOGRENCILER set OGRCINSIYET = 'erkek' where OGRAD = 'baran'

insert into TBLNOTLAR (OGRENCI, ders, sýnav1, sýnav2) values (5, 2, 78, 66)

update TBLNOTLAR set ortalama= (sýnav1 + sýnav2 + sýnav3 )/3 
update TBLNOTLAR set DURUM=1 WHERE ortalama >=50
update TBLNOTLAR set DURUM=0 WHERE ortalama <50


--count, sum, avg, max, min
select COUNT(*) as mevcut from TBLOGRENCILER 
select SUM(sýnav1), SUM(sýnav2), SUM(sýnav3) from TBLNOTLAR
select AVG(sýnav1),AVG(sýnav2),AVG(sýnav3) from TBLNOTLAR
select MAX(sýnav1),MAX(sýnav2),MAX(sýnav3) from TBLNOTLAR
select Min(sýnav1),Min(sýnav2),Min(sýnav3) from TBLNOTLAR

--GROUP BY
select t.OGRCINSIYET, count(*) as toplam from TBLOGRENCILER t group by t.OGRCINSIYET
select t.OGRKULUP, COUNT(*) as toplam from TBLOGRENCILER t group by t.OGRKULUP

--having
select t.OGRKULUP, COUNT(*) as toplam from TBLOGRENCILER t group by t.OGRKULUP having t.OGRKULUP= 1
select t.OGRSEHIR, COUNT(*) from TBLOGRENCILER t group by t.OGRSEHIR having count(*)=2


--like
select * from TBLOGRENCILER where OGRAD like'a%' 
select * from TBLOGRENCILER where OGRAD like'a%' or OGRSEHIR like '%a%'-- neden and uymadý
select * from TBLOGRENCILER where OGRAD not like'a%'

--distinct (recurring fetch)
select OGRSEHIR from TBLOGRENCILER
select distinct OGRSEHIR from TBLOGRENCILER
select COUNT(distinct(OGRSEHIR)) AS 'ÞEHÝR SAYISI' from TBLOGRENCILER


--ORDER BY (ARRANGEMENT)
select OGRSEHIR from TBLOGRENCILER order by OGRSEHIR
select distinct OGRSEHIR from TBLOGRENCILER -- distinct te zaten asc sýrasýnda geliyor
select distinct OGRSEHIR from TBLOGRENCILER order by OGRSEHIR desc

--like
select* from TBLOGRENCILER where OGRAD like '%a%'--those with the letter "a" in the student name.
select* from TBLOGRENCILER where OGRSEHIR like '%ir%'
select* from TBLOGRENCILER where OGRSEHIR like '%ir_%'--Let there be an "r" in it, but something else after it.
select* from TBLOGRENCILER where OGRAD like '%[a,b]%'-- those with "a" or "b" in them.
select* from TBLOGRENCILER where OGRAD like '[a,b]%' -- starting with "a" or "b".
select* from TBLOGRENCILER where OGRKULUP like '[a-m]%' -- Get those whose name starts with any between "a" and "m".
select* from TBLOGRENCILER where OGRKULUP like '%[ç,z]'

--top
select top 3 * from TBLOGRENCILER -- fetch the first 3 records.
select top 3 * from TBLOGRENCILER order by OGRID desc -- fetch the last 3 records.

--percent
select top 30 percent * from TBLOGRENCILER -- fetch the first 30 percent record.
select top 35 percent * from TBLOGRENCILER -- There are normally 10 records. If a percentage between 30-40 is written, it acts as if 40 is written.
select top 35 percent * from TBLOGRENCILER order by OGRID desc

--in( It is a command that saves the or statement.)
select * from TBLOGRENCILER where OGRSEHIR= 'adana' or OGRSEHIR= 'ankara' or OGRSEHIR= 'edirne'
select * from TBLOGRENCILER where OGRSEHIR in ('adana', 'ankara', 'edirne')
select * from TBLNOTLAR where sýnav1 in (70, 75, 80, 85, 90)
select * from TBLNOTLAR where sýnav1 not in (70, 75, 80, 85, 90)-- bring those that don't include them.

--between(The "between" function includes the 1st value but not the 2nd value.)
select * from TBLNOTLAR where ORTALAMA between 74 and 90
select * from TBLOGRENCILER where OGRAD between 'a' and 'c'
select * from TBLOGRENCILER where OGRAD not between 'a' and 'c'

update TBLOGRENCILER set OGRKULUP= 5 where OGRKULUP= 'temizlik'
insert into TBLOGRENCILER(OGRAD, OGRKULUP, OGRCINSIYET, OGRSEHIR) values('Berna', 4, 'kýz', 'Ankara') 

--Merge Process. Join....
select NOTID, DERSAD from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID
select NOTID, DERSAD,sýnav1, sýnav2, sýnav3, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID
select NOTID, DERSAD, ograd,OGRSOYAD, sýnav1, sýnav2, sýnav3, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID 
inner join TBLOGRENCILER on TBLOGRENCILER.OGRID = TBLNOTLAR.OGRENCI 
select NOTID, DERSAD, ograd+OGRSOYAD as [isim soyisim], sýnav1, sýnav2, sýnav3, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID 
inner join TBLOGRENCILER on TBLOGRENCILER.OGRID = TBLNOTLAR.OGRENCI 

update TBLNOTLAR set durum= 'geçemedi' where DURUM='0'

UPDATE TBLNOTLAR SET ORTALAMA=(SINAV1+ SINAV2+ SINAV3)/3 WHERE DERS=1
UPDATE TBLNOTLAR SET DURUM='geçti' where ortalama>=50
UPDATE TBLNOTLAR SET DURUM='geçemedi' where ortalama<50

--EXAM GRADE INFORMATION FOR THE COURSE NAMED MATHEMATICS IN THE COURSES TABLE
--answer1
select ogrencý, dersad, sýnav1, sýnav2, sýnav3, ortalama, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLDERSLER.DERSID = TBLNOTLAR.DERS where dersad= 'MATEMATÝK'
--answer2
SELECT * FROM TBLNOTLAR WHERE DERS=1 
SELECT * FROM TBLNOTLAR WHERE DERS=(SELECT DERSID FROM TBLDERSLER WHERE DERSAD= 'MATEMATÝK')

--HIGHEST exam1 GRADE FOR THE ALGORITHM course in the TABLE OF GRADES?
select * from TBLNOTLAR where sýnav1=(select max(sýnav1) from TBLNOTLAR) 

--Let all the common records in the student and grades table come.
select * from  TBLNOTLAR inner join TBLOGRENCILER on TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID

--right- left join
--It is desired to see which students have not entered grades.
select * from  TBLNOTLAR right join TBLOGRENCILER on TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID

--full join
select * from  TBLNOTLAR full join TBLOGRENCILER on TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID

--arithmetic operations
--For course 1, 10 points should be added to the students whose 2nd exam grade is below 45.
 select * from TBLNOTLAR where DERS=1
 select AVG(ortalama) as ortalama from TBLNOTLAR where DERS=1 



--MATHEMATICAL FUNCTIONS
--abs
select abs(90) as 'mutlak'
--power
select POWER(2,5) as 'üs alma'
select POWER(sýnav1,2) as bbb from TBLNOTLAR
--sqrt
select SQRT(81) as 'karekök'
select SQRT(83) as 'karekök'--ondalýklýyý da getirir.
--floor, ceiling 
select FLOOR(4.895) as 'taban' , CEILING(4.895) as 'tavan'

--sum
select sum(sýnav1) from TBLNOTLAR where ogrencý=1
select sýnav1, DERS from TBLNOTLAR where ogrencý=1

select dersad, sýnav1, sýnav2, sýnav3 from TBLNOTLAR inner join TBLDERSLER on TBLDERSLER.DERSID = TBLNOTLAR.DERS where 
OGRENCI=(select ogrýd from TBLOGRENCILER where OGRAD='ayþe' and OGRSOYAD= 'çýnar') 


--ALPHABETIC FUNCTIONS
--upper,lower
select upper('merhaba') as sütun
select UPPER(ograd) as ad, UPPER(ogrsoyad) as soyad, LOWER(ogrsehýr) as þehir from TBLOGRENCILER


--substring -- dersin sonundaki soruyu yap
select SUBSTRING(ograd,1,1) +'.'  + ' ' + ogrsoyad as [ad soyad], OGRKULUP from TBLOGRENCILER--kaçýncý karakterden itibaren kaçýncýyý alsýn.


--len
select len('merhaba')

select ograd, len(ograd), ogrkulup from TBLOGRENCILER where OGRSEHIR= 'adana' and OGRKULUP=(select kulupýd from TBLKULUPLER where KULUPAD= 'biliþim')
--People whose name is 3 and 4 characters long.
select t.OGRAD from TBLOGRENCILER t where LEN(OGRAD)=3 or LEN(OGRAD)=4 


--ltrim- rtrim
select ('             Dicle Acet')
select ('Dicle Acet             ')
select rtrim ('Dicle Acet             ')
select ltrim('             Dicle Acet')

--replace
select replace(' Dicle', 'Dicle', 'can')
 
 --charindex
select CHARINDEX('e', 'SQL derslerine devam ediyoruz')
select CHARINDEX('e', 'SQL derslerine devam ediyoruz',7)
select CHARINDEX('a',ograd) from TBLOGRENCILER
 -- reverse
 select REVERSE('Beyza')
 select reverse(dersad) from TBLDERSLER


 --DDL COMMANDS 
 create database SatisVT

 USE SatisVT
 create table TBLKATEGORI
 (
 KATEGORIID tinyint identity(1,1) primary key,
 KATEGORIAD VARCHAR(50) 
 )

 create table TBLURUNLER
 (
 URUNID int identity(1,1) primary key,
 URUNAD varchar(50),
 URUNMARKA varchar(50),
 KATEGORI tinyint,
 URUNALISFIYAT decimal(18,2),
 URUNSTOK decimal(18,2),
 URUNDURUM bit default '1'
 )


 create table TBLPERSONEL
 (
 PERSONELID smallint identity(1,1) primary key,
 PERSONELADSOYAD VARCHAR(50)
  
 )

 create table TBLMUSTERI
 (
 MUSTERIID int primary key  identity(1,1),
 MUSTERIAD varchar(50),
 MUSTERISOYAD varchar(50),
 MUSTERISEHIR varchar(13),
 MUSTERIBAKIYE decimal(18,2)
 
 )

 create table TBLHAREKET
 (
 HAREKETID int primary key identity(1,1),
 URUN int,
 MUSTERI int,
 PERSONEL smallint,
 ADET int,
 TUTAR decimal(18,2),
 TARIH smalldatetime
 )

 insert into TBLKATEGORI(KATEGORIAD) values('BILGISAYAR')
 insert into TBLKATEGORI(KATEGORIAD) values('BEYAZ EÞYA')
 insert into TBLKATEGORI(KATEGORIAD) values('KUÇUK EV ALETI')
 insert into TBLKATEGORI(KATEGORIAD) values('TV')

 insert into TBLURUNLER(URUNAD, URUNMARKA, KATEGORI, URUNALISFIYAT, URUNSATISFIYAT, URUNSTOK) values('BUZDOLABI', 'SIEMENS', 2, 4356, 4588, 10)
 
 --DML COMMANDS 
 SELECT * FROM TBLURUNLER

 UPDATE TBLURUNLER SET URUNAD= 'KETTLE' WHERE URUNAD= 'SU ISITICISI'
 UPDATE TBLURUNLER SET URUNAD= 'SU ISITICISI' WHERE URUNAD= 'KETTLE'

 --HOW MANY PRODUCTS ARE IN EACH CATEGORY TOTAL?
 select * from TBLURUNLER
 select KATEGORIAD,COUNT(*) as [toplam ürün] from TBLKATEGORI inner join TBLURUNLER on 
 TBLURUNLER.KATEGORI= TBLKATEGORI.KATEGORIID group by KATEGORIAD order by COUNT(*)--------------------------------------------------------------------------------------------------------------------------------------------------------


select KATEGORI, COUNT(*) AS TOPLAM from TBLURUNLER GROUP BY KATEGORI

 --500 TL increase in the sales price of the products whose category is computer.
 update TBLURUNLER set URUNSATISFIYAT= URUNSATISFIYAT + 500 where KATEGORI=1
 update TBLURUNLER set URUNSATISFIYAT= URUNSATISFIYAT + 500 where 
 KATEGORI=(select kategorýýd from TBLKATEGORI where KATEGORIAD= 'bilgisayar')--same as above.

 --(EXAMPLE)The query that gives 10 percent discount on products in the TV category?
update TBLURUNLER set URUNSATISFIYAT= URUNALISFIYAT + URUNSATISFIYAT* 0.11 where kategorý=4

select count(*) as 'kaç farklý ürün', sum(URUNSTOK) as 'stok sayýsý' from TBLURUNLER

--(EXAMPLE)How much profit is made if all the items in stock are sold?
select * from TBLURUNLER
select  SUM(t.URUNSTOK*t.URUNSATISFIYAT) as [toplam kazanç] from TBLURUNLER t 
--(EXAMPLE) How much profit does each product bring in itself when it is sold?
select urunad, SUM(t.URUNSTOK*t.URUNSATISFIYAT) as [toplam kazanç] from TBLURUNLER t group by URUNAD

select URUNID, URUNAD, URUNMARKA, kategorýad, URUNSATISFIYAT, URUNALISFIYAT, URUNSTOK, (URUNSATISFIYAT-URUNALISFIYAT) as kar, 
urunstok*(urunsatýsfýyat - urunalýsfýyat) as [toplam kar] from TBLURUNLER  inner join tblkategorý  on tblkategorý.kategorýýd = tblurunler.kategorý

--PROCEDURE
select HAREKETID, urunad, musterýad + ' ' + musterýsoyad as müþteri, personeladsoyad as personel, adet, tutar, tarýh from 
TBLHAREKET inner join TBLURUNLER on TBLHAREKET.urun= TBLURUNLER.URUNID 
inner join TBLMUSTERI on TBLMUSTERI.musterýýd = tblhareket.musterý inner join TBLPERSONEL on TBLPERSONEL.personelýd= tblhareket.personel
--INSTEAD OF WRITTING THE ABOVE QUESTION, WE CAN MAKE IT AS A SINGLE EXPRESSION AND CALL IT WHEN WE WANT. THAT'S WHAT PROCEDURE WORKS.
CREATE PROCEDURE HAREKETLER AS 
select HAREKETID, urunad, musterýad + ' ' + musterýsoyad as müþteri, personeladsoyad as personel, adet, tutar, tarýh from TBLHAREKET inner join TBLURUNLER on 
TBLHAREKET.urun= TBLURUNLER.URUNID 
inner join TBLMUSTERI on TBLMUSTERI.musterýýd = tblhareket.musterý inner join TBLPERSONEL on TBLPERSONEL.personelýd= tblhareket.personel
--THIS IS NOW A PROCEDURE, WITH THE FOLLOWING EXPRESSION, WE CAN MAKE IT WORKING AS FOLLOWS:
EXECUTE HAREKETLER
--IF WE WANT TO DELETE THIS PROCEDURE, THE FOLLOWING COMMAND IS USED.
DROP PROCEDURE HAREKETLER

--DATAPART(DATEPART)
SELECT * FROM TBLHAREKET
SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 3
SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 3 AND 3
SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 3 AND MUSTERI=1

--LIST CUSTOMERS WHICH WERE ANKARA ON 1 AND 2 OCTOBER.
--ANSWER1
SELECT * FROM TBLHAREKET
SELECT MUSTERI,MUSTERIAD,TARIH, MUSTERISEHIR FROM TBLHAREKET inner join TBLMUSTERI on TBLMUSTERI.MUSTERIID= TBLHAREKET.MUSTERI WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 2 and MUSTERISEHIR= 'ankara' 
--ANSWER1
SELECT * FROM TBLHAREKET  WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 2 and MUSTERI=(SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR= 'ANKARA')

--DATANAME(DATENAME)

select DATENAME(month,GETDATE())--today's date (in months)
select DATENAME(day, getdate())
select DATENAME(WEEKDAY,'1999.08.23')--What day of the week was August 23rd in 1999?
select DATENAME(month, '1999.08.23')
--We wondered what day a date coincides with.
select DATENAME(weekday,'2022.05.11')

--DATEDIFF
SELECT DATEDIFF(DAY,'1999.08.23', '2021.05.09')
SELECT DATEDIFF(MONTH,'1999.08.23', '2021.05.09')
SELECT DATEDIFF(YEAR,'1999.08.23', '2021.05.09')

SELECT DATEDIFF(DAY,TARIH,GETDATE()) FROM TBLHAREKET WHERE HAREKETID=1 -- ÝLK ÝÞLEMDEN BU YANA BU KADAR GÜN GEÇMÝÞ

--DATEADD
SELECT DATEADD(DAY,30,GETDATE())--BUGÜNÜN ÜZERÝNE 30 GÜN EKLEDÝK VE TARÝHÝ GÖRDÜK.
SELECT DATEADD(DAY,30,'1999.08.23')-- BU TARÝHÝN ÜZERÝNE 30 GÜN EKLEDÝK VE TARÝHÝ GÖRDÜK.

--SUBQUERY EXAMPLES

--HOW MANY OF EACH PRODUCT ARE SOLD?
SELECT  URUN, COUNT(*) AS ADET  FROM TBLHAREKET  group by URUN order by adet

SELECT  URUNAD, COUNT(*) AS ADET FROM TBLHAREKET inner join TBLURUNLER on TBLURUNLER.URUNID= TBLHAREKET.URUN  group by URUNAD --group by inner joinden önce gelemez.

--PRODUCTS SOLD IN THE COMPUTER CATEGORY ONLY?
SELECT URUN,COUNT(*) FROM TBLHAREKET GROUP BY URUN having urun=(select KATEGORIID from TBLKATEGORI where KATEGORIAD='bilgisayar')

--(EXAMPLE) BRING THE ABOVE WITH THE NAME OF THE PRODUCT SHOWN.

--ANSWER
SELECT * FROM TBLHAREKET WHERE URUN IN(SELECT URUNID FROM TBLURUNLER WHERE KATEGORI=1)-- neden eþitlik yerine in var?.....> biyerde altsorguda 1 den fazla deðer dönüyorsa o zaman in komutu kullanýlmalý.

--LET'S FIND THE EXPENDITURES OF ADANA CUSTOMERS.
SELECT MUSTERIAD + ' ' + MUSTERISOYAD as 'müþteri ad soyad', ADET* URUNSATISFIYAT as 'harcama' FROM TBLHAREKET inner join TBLMUSTERI on TBLMUSTERI.MUSTERIID = TBLHAREKET.MUSTERI 
inner join TBLURUNLER on TBLURUNLER.URUNID= TBLHAREKET.URUN WHERE MUSTERI in (SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA')

SELECT  MUSTERIAD + ' ' + MUSTERISOYAD as  'müþteri ad soyad',ADET* URUNSATISFIYAT as 'harcama' FROM TBLHAREKET inner join TBLMUSTERI on TBLMUSTERI.MUSTERIID = TBLHAREKET.MUSTERI 
inner join TBLURUNLER on TBLURUNLER.URUNID= TBLHAREKET.URUN where MUSTERI in (SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA')

--ANSWER2
SELECT * FROM TBLHAREKET WHERE MUSTERI in (SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA')

--THE BALANCE OF CUSTOMERS EXPENDING ON WHITE GOODS?
--ANSWER1
select musterýad + ' ' +musterýsoyad [müþteriler],MUSTERIBAKIYE from TBLMUSTERI inner join TBLHAREKET on TBLHAREKET.musterý= TBLMUSTERI.musterýýd where urun=2

--ANSWER2
Select * from TBLHAREKET where urun= (select kategoRIID from TBLKATEGORI where KATEGORIAD='beyaz eþya')



--total price of products sold to adana or ankara customers?
select sum(TUTAR) from TBLHAREKET where musterý in ( select musterýýd from TBLMUSTERI where MUSTERISEHIR= 'adana' or MUSTERISEHIR= 'ankara')

--THE CASH TABLE NEEDS TO BE ADDED TO SEE THE GAIN:
CREATE TABLE TBLKASA
(
TOPLAM decimal(18,2)
)
 
 insert into TBLKASA values(0)
 select * from TBLKASA
 update TBLKASA set TOPLAM=(select SUM(tutar) from TBLHAREKET)

 --TRÝGGER

 create table TBLSAYAC
 (
 ÝSLEM int 
 )
 insert into TBLSAYAC values(0)
 update TBLSAYAC set islem= (select COUNT(*) from TBLHAREKET)

 --When a data is entered in the motion table, the counter value increases by 1.
 create trigger ISLEMARTIS on tblhareket after insert as update tblsayac set islem= islem + 1

 create table TOPLAMKATEGORI
 ( 
 ADET tinyint
 )
 insert into TOPLAMKATEGORI values(0)

 update TOPLAMKATEGORI set ADET= (select count(*) from TBLKATEGORI)

 --Let's create the trigger:
 create trigger KATEGORIARTIS on tblkategorý after insert as update toplamkategorý set adet= adet + 1
 
 --Let's create a trigger.
 create trigger KATEGORIAZALIS on tblkategorý after delete as update toplamkategorý set adet= adet-1

 --VÝEW
 create view test1 as select * from TBLKATEGORI
 select * from test1
 --Let's make changes in test 1:
 alter view test1 
 as 
 select * from TBLKATEGORI where KATEGORIID<2
 SELECT * FROM TEST1

 select * from test2
 SELECT * FROM TEST3 





