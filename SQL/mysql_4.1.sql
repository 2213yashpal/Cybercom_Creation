
-- 1.	Write a query to find all books published in the year 2020.

SELECT * FROM books WHERE year(publication_date)=2020;

-- 2.	Write a query to find the name of the author who has written the most number of books.

SELECT a.name,
    COUNT(*) AS num_books 
    FROM authors a 
    JOIN books b ON a.id=b.author_id 
    GROUP by a.name 
    ORDER BY num_books 
    DESC LIMIT 1;

-- 3.	Write a query to find the name of the category with the most number of books.

SELECT bc.name AS category_name, 
    COUNT(*) AS num_books
    FROM book_categories bc
    JOIN book_category_mappings bcm ON bc.id = bcm.category_id
    GROUP BY bc.name
    ORDER BY num_books DESC
    LIMIT 1;

 -- 4.	Write a query to find the name of the author who has written the most number of books in the category "fiction"

 SELECT a.name AS author_name, 
    COUNT(*) AS num_books
    FROM authors a
    JOIN books b ON a.id = b.author_id
    JOIN book_category_mappings bcm ON b.id = bcm.book_id
    JOIN book_categories bc ON bcm.category_id = bc.id
    WHERE bc.name = 'fiction'
    GROUP BY a.name
    ORDER BY num_books DESC
    LIMIT 1;
