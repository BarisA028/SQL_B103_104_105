--ALIASES
drop table if exists calisanlar04
CREATE TABLE calisanlar04  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar04 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar04 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar04 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar04

-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar04
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar04

-- IS NULL CONDITION
-- Arama yapilan field’da NULL degeri almis kayitlari getirir

CREATE TABLE insanlar ( 
    ssn char(9),
 isim varchar(50),
 adres varchar(50) );
 INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
 INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
 INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
 INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
 INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select  * from insanlar

--name sutunuda nulolan degerleri listeleyelim

select isim from insanlar where isim is null

--insanlar tablosunda sadece null olmayan degerleri listeleyiniz
SELECT isim FROM insanlar WHERE isim IS NOT NULL

-- --insanlar tablosunda sadece null deger almis verileri no name olarak degistiriniz

update insanlar
set isim ='no name'
where isim is null;

-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
	ascend(cikmak)-kucukten buyuge siralama 
	descend(inmek)-buyukten kucuge siralama
	/*
	Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
	Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
	Default olarak küçükten büyüğe sıralama yapar ASC
	Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
*/

drop table if exists insanlar
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar

--Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar order by adres

select * from insanlar order by soyisim

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select* from insanlar where isim='Mine' order by ssn

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar where soyisim='Bulut' order by 1

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar order by ssn desc;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar order by isim asc,soyisim desc;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz 
ve yine uzunlugu buyukten kucuge siralamak istersek sonuna DESC komutunu ekleriz
*/

select isim,soyisim from insanlar order by length(soyisim) desc; 

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

select isim||' '||soyisim as isim_soyisim from insanlar order by length(isim||soyisim);--1.yol

select isim||' '||soyisim as isim_soyisim from insanlar order by length(isim)+length (soyisim);--2.yol

select concat (isim,' ',soyisim) as isim_soyisim from insanlar order by length(isim)+length (soyisim);--3.yol

select concat (isim,' ',soyisim) as isim_soyisim from insanlar order by length(concat(isim,soyisim));--4.yol

-- 									GROUP BY CLAUSE
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
-- komutuyla birlikte kullanılır

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--Isme gore alinan toplam urunleri bulun

select  isim,sum(urun_miktar) as aldigi_toplam_urun from manav
group by isim;


--Isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge listeleyiniz

select  isim,sum(urun_miktar) as aldigi_toplam_urun from manav
group by isim
order by aldigi_toplam_urun desc;

-- Urun ismine gore urunu alan toplam kisi sayisi

select urun_adi,count(isim) from manav
group by urun_adi;

select isim,count(urun_adi) as aldigi_urun_cesidi from manav
group by isim;



