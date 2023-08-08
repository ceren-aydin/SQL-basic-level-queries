
/* yeni bir database oluşturulması */
CREATE DATABASE okul;


/* database olarak okul'un kullanılması */
USE okul;


/* sinif1 tablosunun gösterilmesi */
SELECT * FROM sinif1;


/* sinif1 tablosuna veri girişi */
INSERT INTO sinif1(ogrenci_numarasi,isim,soyisim) 
VALUES(1,'a','b'),
(2,'c','d'),
(3,'e','f'),
(4,'a','g');


/* sinif1 tablosunun yalnızca 2 satırının gösterilmesi */
SELECT * FROM sinif1 LIMIT 2;


/* tekrarlanan isimlerin sadece 1 defa gösterilmesi */
SELECT DISTINCT(isim) FROM sinif1;


/* soyisimi d olan kişinin isim ve soyisim bilgilerinin gösterilmesi */
SELECT isim,soyisim FROM sinif1 
WHERE soyisim = 'd';


/* soyisimi b veya d olan kişilerin gösterilmesi */
SELECT * FROM sinif1
WHERE soyisim IN('b','d');


/* ogrenci_numarasi 1 ile 3 arasındaki kişilerin gösterilmesi */
SELECT * FROM sinif1 
WHERE ogrenci_numarasi 
BETWEEN '1' AND '3';


/* isimin a veya soyisimin f olduğu kişilerin gösterilmesi */
SELECT * FROM sinif1 
WHERE isim = 'a' 
OR soyisim = 'f';


/* ogrenci_numarasi'nin 2'den büyük olan kişilerin gösterilmesi */
SELECT * FROM sinif1 
WHERE ogrenci_numarasi > 2;


/* ogrenci_numarasi 4 olan kişinin soyisiminin z olarak değiştirilmesi */
UPDATE sinif1 SET soyisim = 'z'
WHERE ogrenci_numarasi = 4;


/* isim değeri c olan satırın silinmesi */
/* DELETE İŞLEMİ KALICI DEĞİLDİR */
DELETE FROM sinif1 WHERE isim='c';


/* sinif1 tablosunun isim kolonunun kaldırılması */
/* DROP İŞLEMİ KALICIDIR */
ALTER TABLE sinif1 
DROP COLUMN isim;


/* sinif1 tablosunun kaldırılması */
DROP TABLE sinif1;


/* sinif1 tablosunun içeriğinin kalıcı olarak silinmesi */
/* TRUNCATE İŞLEMİ KALICIDIR */
TRUNCATE sinif1;

