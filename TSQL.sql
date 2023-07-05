--"Declare" is used to define functions in SQL. The defined function name starts with "@" and its type must also be entered.
declare @Sayi int
set @Sayi= 24
select @Sayi as 'sonuc'

declare @kisi1 varchar(10)
set @kisi1='Beyza' 
select @kisi1 as kiþi

declare @sayý1 int, @sayý2 int, @sayý3 int
set @sayý1= 10 
set @sayý2= 15
set @sayý3= 2

select @sayý1 + @sayý2 * @sayý3 

--Query that returns the sum and digits of a 3-digit number
--123= 6
--answer..> A total of 5 definitions, with 3 digit values, the sum of the number itself.
declare @sayý int, @yüzler_basamaðý int, @onlar_basamaðý int, @birler_basamaðý int, @toplam int
set @sayý= 125
set @yüzler_basamaðý= @sayý/100
set @onlar_basamaðý= (@sayý/10) % 10
set @birler_basamaðý= @sayý %10
set @toplam = @yüzler_basamaðý + @onlar_basamaðý + @birler_basamaðý

select @sayý, @yüzler_basamaðý, @onlar_basamaðý, @birler_basamaðý, @toplam

--How are variables used in tables? Let's see.
use SatisVT
--let's bring the highest balance value but not with "max"; Let's do it with a variable.
select * from TBLMUSTERI

declare @bakiye int
set @bakiye= (select MAX(musterýbakýye) from TBLMUSTERI)

select @bakiye

--Let's bring the information of the product with the most stock with the variable.
select * from TBLURUNLER
declare @stok int
set @stok=(select MAX(urunstok) from TBLURUNLER)

select @stok as maxstok

select * from TBLURUNLER where URUNSTOK= @stok

--system functions
select @@ERROR, @@MICROSOFTVERSION, @@SERVERNAME

--print--There is no table-based value here, it always comes based on messages.
print 'hello'
--Let's make a program that calculates the product of 2 numbers.
declare @s1 int, @s2 int, @çarpým int
set @s1= 10
set @s2=15
set @çarpým= @s1*@s2

print '10 ve 15 sayýlarýnýn çarpýmý'
print '****************************'
print @çarpým
select @çarpým

--Table type variables-- Allows holding more than one table value with the help of a variable (like a temporary table).
--Let's make an example of people's name, surname, city.
declare @kiþiler table 
(
kiþiýd int identity(1,1),
kiþiad varchar(10),
kiþiþehir varchar(15)
)

insert into @kiþiler (kiþiad, kiþiþehir) values ( 'mehmet', 'ankara')
insert into @kiþiler values ('ayþe', 'istanbul')
select * from  @kiþiler
select kiþiad from @kiþiler where kiþiad like 'a%'

--IF-ELSE
if(1<5)
print 'merhaba'
else
print 'selam'

--Is there a total of 100 products or not?
select * from TBLURUNLER
 if(select sum(URUNSTOK) from TBLURUNLER)>100
print 'yes'
else
print 'no'

--CASE--They are structures used in cases where there is a lot of branching.
select * from TBLURUNLER 
select URUNAD, URUNMARKA, URUNDURUM=
case urundurum
when '1' then 'ürün var'
when '0' then 'ürün yok'
end
from TBLURUNLER

select urunad, urunmarka, KATEGORI=
case kategorý
when '1' then 'laptop'
when '2' then 'beyaz eþya'
when '3' then 'küçük ev aleti'
end
from TBLURUNLER

--case --find critical level

select URUNAD, URUNMARKA, URUNSTOK, URUNSTOK=
case
when urunstok>=1 and urunstok<=5 then 'kritik seviye'
when urunstok>=6 and urunstok<=10 then 'takviye yapýlmalý'
when urunstok>10 then 'ürün stok sayýsý yeterli'
end
from tblurunler

--WHILE 
declare @sayac int
set @sayac= 1
while @sayac<=5
begin
print 'merhaba sql dersleri'
set @sayac+=1
end

--EXAMPLE --Let's print the numbers between 1 and 10 on the screen.
declare @sayý int
set @sayý= 1
while @sayý<=10
begin
print @sayý
set @sayý+=1
end

--Here the program prints after adding 1.
declare @sayý int
set @sayý= 1
while @sayý<=10
begin
set @sayý+=1
print @sayý
end


--EXAMPLE--Let's calculate the sum of the numbers between 1 and 10.
declare @toplam int, @sayac int
set @toplam= 0
set @sayac=1
while @sayac<=10
begin
set @toplam = @toplam + @sayac
set @sayac+=1
end
print @toplam

--EXAMPLE-- Let's increase the sales prices by 10 percent until the profit rate reaches 450.
while (select avg(URUNSATISFIYAT - URUNALISFIYAT) from TBLURUNLER where KATEGORI= 2)<=450
begin
update TBLURUNLER set URUNSATISFIYAT+= URUNSATISFIYAT*10/100
end
select * from TBLURUNLER

--waitfor-- It has a meaning like run my query at this minute, this hour, this second.
waitfor delay '00:00:05'
select * from TBLURUNLER

waitfor delay '00:00:05'
insert into TBLKATEGORI(KATEGORIAD) values('diðer')
select * from TBLKATEGORI
--delete from TBLKATEGORI where KATEGORIID=8





