SELECT * FROM MYEMP ;

DESC MYEMP ;
CREATE TABLE DEMO(EMP_ID DECIMAL(6,0) ,  FIRST_NAME VARCHAR(20),c VARCHAR(25),SALARY DECIMAL(8,2),DEP_ID DECIMAL(4,0));


INSERT INTO DEMO (SELECT EMP_ID ,FIRST_NAME,LAST_NAME ,SALARY ,DEP_ID FROM MYEMP LIMIT 10 );
SELECT * FROM DEMO ;