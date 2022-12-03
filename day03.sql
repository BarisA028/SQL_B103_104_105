CREATE TABLE ogrenciler10
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
iNSERT INTO ogrenciler10 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler10 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler10 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler10 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler10;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler10 where isim= 'Nesibe Yilmaz' or isim ='Mustafa Bak';

--Veli ismi hasan datayi silelim
DELETE FROM ogrenciler10 WHERE veli_isim='Hasan';

--TRUNCATE --
--Bir tablodaki tum verileri geri alamayacagimiz sekilde siler sartli silme yapmaz.

TRUNCATE TABLE ogrenciler10














