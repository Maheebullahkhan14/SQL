/* DELETE DUPLICATE VALUES USING JOIN STATEMENT*/
SELECT * FROM EMP ;

/* i WANT TO DELETE DUPLICATE FROM THE SAME TABLE */
/* USING WHERE CLAUSE I DELETE THAT ROW IF MY E1  NAME IS MATCH WITH E2 NAME */

DELETE E1 FROM EMP E1 , EMP E2
WHERE E1.NAME = E2.NAME AND
E1.ID > E2.ID ;
