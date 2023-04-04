--- #1.	 Who is the most senior employee based on job title ?

SELECT *
FROM EMPLOYEE
ORDER BY LEVELS DESC
LIMIT 1

---#2.	Which countries have most invoices ?

SELECT COUNT(*) AS C,
	BILLING_COUNTRY
FROM INVOICE
GROUP BY BILLING_COUNTRY
ORDER BY C DESC


---#3.	What are top 3 values of total invoice ?

SELECT TOTAL
FROM INVOICE
ORDER BY TOTAL DESC
LIMIT 3


---#4.	Which city has the best customer ? 
--we would like to throw a promotional music festival in the city we made the most money
--write a  query that returns one city that has the highest sum  of invoice
--totals Return both the city name & sum of all invoice totals ?


SELECT SUM(TOTAL) AS TOTAL,
	BILLING_CITY
FROM INVOICE
GROUP BY BILLING_CITY
ORDER BY TOTAL DESC


---#5.Who is the best customer ?
--the customer who have spent the most money will be declared the best customer.
--write a query that returns the person who has spent the most money ?

SELECT C.FIRST_NAME,
	C.LAST_NAME,
	SUM(I.TOTAL) AS TOTAL
FROM CUSTOMER C
JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID
ORDER BY TOTAL DESC
LIMIT 1

---#6.Write a query to return the email, first name,
---last name, & genre off all rock music listeners
--return your list ordered alphabetically by email starting with A.

SELECT DISTINCT C.EMAIL,
	C.FIRST_NAME,
	C.LAST_NAME
FROM CUSTOMER C
JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID
JOIN INVOICE_LINE I2 ON I.INVOICE_ID = I2.INVOICE_ID
WHERE TRACK_ID in
		(SELECT TRACK_ID
			FROM TRACK
			JOIN GENRE ON TRACK.GENRE_ID = GENRE.GENRE_ID
			WHERE GENRE.NAME like 'Rock')
ORDER BY C.EMAIL


---#7.Lets invite the artist who have written the most rock music in our dataset.
---Write a query that returns the artist name and total track count of the top 10 rock bands


SELECT A.ARTIST_ID,
	A.NAME,
	COUNT(A.ARTIST_ID) AS TRACK_COUNTS
FROM ARTIST A
JOIN ALBUM A2 ON A.ARTIST_ID = A2.ARTIST_ID
JOIN TRACK T ON A2.ALBUM_ID = T.ALBUM_ID
JOIN GENRE G ON T.GENRE_ID = G.GENRE_ID
WHERE G.NAME like 'Rock'
GROUP BY A.ARTIST_ID
ORDER BY TRACK_COUNTS DESC
LIMIT 10


---#8.	Return all the track name that have a song length longer than
---the average song length return the name and milliseconds for each track 
---order by the song length with the longest songs listed first


SELECT NAME,
	MILLISECONDS
FROM TRACK
WHERE MILLISECONDS >
		(SELECT AVG(MILLISECONDS)
			FROM TRACK)
ORDER BY MILLISECONDS DESC










































































































































