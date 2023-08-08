
/* sakila database'in kullanılması */
USE sakila;


/* actor tablosunun tamamının görüntülenmesi */
SELECT * FROM actor;


/* actor tablosundaki tüm aktörlerin actor_id,first_name ve last_name sütunlarının görüntülenmesi */
SELECT actor_id, first_name, last_name 
FROM actor;


/* actor tablosunda first_name'i ED olan satırların actor_id,first_name ve last_name sütunlarıyla görüntülenmesi */
SELECT actor_id, first_name, last_name 
FROM actor
WHERE first_name like 'ED'; 


/* actor tablosunda first_name'i 'SAN' içeren satırların actor_id,first_name ve last_name sütunlarıyla görüntülenmesi */
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name like '%SAN%';


/* actor tablosunda last_name'i 'AN' içeren satırların first_name ve last_name sütunlarıyla getirilmesi,
bu sütunların getirilirken first_name'lerin alfabetik olarak azalarak sıralanması*/
SELECT first_name, last_name
FROM actor
WHERE last_name like '%AN%'
ORDER BY first_name DESC;


/* actor tablosunda aynı last_name'e sahip olan kaç kişi olduğunun gösterilmesi */
SELECT last_name AS 'LAST NAME', count(last_name) AS 'AYNI LAST NAME SAYISI'
FROM actor
GROUP BY last_name;


/* actor tablosunda aynı last_name sayısı 1'in üzerinde olan kişilerin gösterilmesi */
SELECT last_name as 'Last Name', count(last_name) as 'Last Name Count'
FROM actor
GROUP BY last_name 
HAVING count(last_name) > 1;


/* customer ve address tablolarının address_id'sinin eşit olduğu sütunların birleştirilmesi */
SELECT 
	c.customer_id, 
	c.first_name, 
	c.last_name, 
	a.address
FROM customer c
JOIN address a ON c.address_id = a.address_id;


/* customer tablosunun customer_id, first_name, last_name sütunlarının tamamının,
actor tablosunun actor_id, first_name, last_name sütunlarının ise customer tablosundaki last_name'lerle aynı olduğu satırların getirilmesi
ve bunların last_name'e göre sıralanması*/
SELECT 
	c.customer_id, 
    c.first_name, 
    c.last_name,
    a.actor_id,
    a.first_name,
    a.last_name
FROM customer c
LEFT JOIN actor a 
ON c.last_name = a.last_name
ORDER BY c.last_name;


/* actor tablosunun actor_id, first_name, last_name sütunlarının tamamının,
customer tablosunun customer_id, first_name, last_name sütunlarının ise actor tablosundaki last_name'lerle aynı olduğu satırların getirilmesi
ve bunların last_name'e göre sıralanması*/
SELECT 
	c.customer_id, 
    c.first_name, 
    c.last_name,
    a.actor_id,
    a.first_name,
    a.last_name
FROM customer c
RIGHT JOIN actor a 
ON c.last_name = a.last_name
ORDER BY c.last_name;


/* customer ve actor tablolarının last_name'lerinin aynı oldukları satırların gösterilmesi */
SELECT 
	c.customer_id, 
    c.first_name, 
    c.last_name,
    a.actor_id,
    a.first_name,
    a.last_name
FROM customer c
INNER JOIN actor a 
ON c.last_name = a.last_name
ORDER BY c.last_name;


/* payment tablosuyla customer tablosunun customer_id'lerinin eşit olduğu satırların birleştirilmesi ve
her bir customer_id için toplam harcamanın SUM ile bulunması */
SELECT
	c.customer_id,
    SUM(p.amount) AS "Total Spending"
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY customer_id;


/* payment tablosundaki amount sütunun MAX ile maksimum değerinin gösterilmesi */
SELECT
	MAX(amount) AS "maksimum amount"
FROM payment;


/* actor tablosunun getirilmesi */
select * from actor;


/* actor tablosuna description sütununun eklenmesi */ 
ALTER TABLE actor
ADD COLUMN description VARCHAR(20);


/* actor tablosundan description sütununun kalıcı olarak silinmesi */
ALTER TABLE actor
DROP COLUMN description;


/* actor tablosuna yeni bir satırın eklenmesi */
INSERT INTO actor(actor_id,first_name,last_name,last_update) 
VALUES(201,'ABC','DEF','2006-02-15 04:34:33');


/* language tablosunun silinmesi */
DELETE FROM language;


/* language tablosunun name kolonunun kaldırılması */
/* DROP İŞLEMİ KALICIDIR */
ALTER TABLE language DROP COLUMN name;


/* staff tablosunun içeriğinin silinmesi */
TRUNCATE staff;


/* staff tablosunun veritabanından kalıcı olarak silinmesi */
DROP TABLE staff;

