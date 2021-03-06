DROP TABLE ANSWER01;
DROP TABLE ANSWER02;
DROP TABLE ANSWER03;
DROP TABLE ANSWER04;
DROP TABLE TEMP0;
DROP TABLE TEMP1;
DROP TABLE TEMP2;
DROP TABLE TEMP3;
DROP TABLE TEMP4;
DROP TABLE TEMP5;
DROP TABLE TEMP6;
DROP TABLE TEMP7;
DROP TABLE TEMP8;
DROP TABLE TEMP9;
DROP TABLE TEMP10;
DROP TABLE TEMP11;
DROP TABLE TEMP12;
DROP TABLE TEMP13;
DROP TABLE TEMP14;
DROP TABLE TEMP15;
DROP TABLE TEMP16;
DROP TABLE TEMP17;
DROP TABLE TEMP18;
DROP TABLE TEMP19;
DROP TABLE TEMP20;
DROP TABLE ADVISES;
DROP TABLE BORROWS;
DROP TABLE LIBRARIAN;
DROP TABLE PATRON;
DROP TABLE PERSON;
DROP TABLE AUTHOR;
DROP TABLE COPY;
DROP TABLE BOOK;
DROP TABLE CITY;
DROP TABLE PUBLISHER;

CREATE TABLE PERSON(
	LNUMBER CHAR(30) PRIMARY KEY,
	NAME CHAR(30) NOT NULL,
	EMAIL CHAR(30)
);
CREATE TABLE LIBRARIAN(
	LNUMBER CHAR(30) PRIMARY KEY,
	SALARY CHAR(30),
	SSN CHAR(30) NOT NULL,
	SUPERVISOR CHAR(30),
	FOREIGN KEY(LNUMBER) REFERENCES PERSON(LNUMBER) ON DELETE CASCADE
);
CREATE TABLE PATRON(
	LNUMBER CHAR(30) PRIMARY KEY,
	TYPE CHAR(30) NOT NULL,
	VALUE CHAR(30) NOT NULL,
	FOREIGN KEY(LNUMBER) REFERENCES PERSON(LNUMBER) ON DELETE CASCADE
);
CREATE TABLE ADVISES(
	LIBRARIAN CHAR(30),
	PATRON CHAR(30),
	LATESTDATE DATE NOT NULL,
	PRIMARY KEY(LIBRARIAN, PATRON),
	FOREIGN KEY(LIBRARIAN) REFERENCES LIBRARIAN(LNUMBER) ON DELETE CASCADE,
	FOREIGN KEY(PATRON) REFERENCES PATRON(LNUMBER) ON DELETE CASCADE
);
CREATE TABLE CITY(
	NAME CHAR(30),
	STATE CHAR(30),
	PRIMARY KEY(STATE, NAME)
);
CREATE TABLE PUBLISHER(
	NAME CHAR(30) PRIMARY KEY,
	EDITOR CHAR(30)
);
CREATE TABLE BOOK(
	ISBN CHAR(30),
	NAME CHAR(30) NOT NULL,
	STATE CHAR(30) NOT NULL,
	PUBNAME CHAR(30) NOT NULL,
	TITLE CHAR(30) NOT NULL,
	YEAR CHAR(30) NOT NULL,
	PRIMARY KEY(ISBN),
	FOREIGN KEY(STATE, NAME) REFERENCES CITY(STATE, NAME) ON DELETE CASCADE,
	FOREIGN KEY(PUBNAME) REFERENCES PUBLISHER(NAME) ON DELETE CASCADE
);
CREATE TABLE COPY(
	COPYNUMBER CHAR(30),
	ISBN CHAR(30),
	PRIMARY KEY(COPYNUMBER, ISBN),
	FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN) ON DELETE CASCADE
);
CREATE TABLE BORROWS(
	LNUMBER CHAR(30),
	COPYNUMBER CHAR(30),
	ISBN CHAR(30),
	DUE DATE,
	PRIMARY KEY(LNUMBER, COPYNUMBER, ISBN),
	FOREIGN KEY(LNUMBER) REFERENCES PATRON(LNUMBER) ON DELETE CASCADE,
	FOREIGN KEY(COPYNUMBER, ISBN) REFERENCES COPY(COPYNUMBER, ISBN) ON DELETE CASCADE
);
CREATE TABLE AUTHOR(
	AUTHOR CHAR(30),
	ISBN CHAR(30),
	PRIMARY KEY(AUTHOR, ISBN),
	FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN) ON DELETE CASCADE
);

INSERT INTO PERSON VALUES('101', 'Abigail Black', 'ablack@abc.com');
INSERT INTO PERSON VALUES('102', 'Diane Fisher', null);
INSERT INTO PERSON VALUES('103', 'Penelope Nolan', null);
INSERT INTO PERSON VALUES('104', 'Steven Lewis', 'slewis@abc.com');
INSERT INTO PERSON VALUES('105', 'Jane Ross', 'jross@abc.com');
INSERT INTO PERSON VALUES('106', 'Bernadette Morgan', null);
INSERT INTO PERSON VALUES('107', 'Lily Springer', null);
INSERT INTO PERSON VALUES('108', 'Zoe Smith', 'zsmith@abc.com');
INSERT INTO PERSON VALUES('109', 'Amanda Mackenzie', null);
INSERT INTO PERSON VALUES('110', 'Adrian Butler', 'abutler@abc.com');
INSERT INTO PERSON VALUES('111', 'Abigail Black', null);
INSERT INTO PERSON VALUES('112', 'Hannah Black', null);
INSERT INTO PERSON VALUES('113', 'Vanessa Gill', 'vgrill@abc.com');
INSERT INTO PERSON VALUES('114', 'Bella Clark', 'bclark@abc.com');
INSERT INTO PERSON VALUES('115', 'Jake Underwood', 'junderwood@abc.com');
INSERT INTO PERSON VALUES('116', 'Virgini Wright', 'vwright@abc.com');
INSERT INTO PERSON VALUES('117', 'Joseph Young', 'jyoung@abc.com');
INSERT INTO PERSON VALUES('118', 'Dorothy Miller', 'dmiller@abc.com');

INSERT INTO LIBRARIAN VALUES('101', '2000', '063224862', '105');
INSERT INTO LIBRARIAN VALUES('102', null, '612317668', null);
INSERT INTO LIBRARIAN VALUES('105', '1000', '319174164', null);
INSERT INTO LIBRARIAN VALUES('106', '1500', '937204618', '118');
INSERT INTO LIBRARIAN VALUES('109', '2000', '847905486', null);
INSERT INTO LIBRARIAN VALUES('113', null, '407204157', null);
INSERT INTO LIBRARIAN VALUES('114', null, '888570720', '106');
INSERT INTO LIBRARIAN VALUES('115', '1000', '789570268', '101');
INSERT INTO LIBRARIAN VALUES('118', null, '597392662', null);

INSERT INTO PATRON VALUES('102', 'Passport', '7830');
INSERT INTO PATRON VALUES('103', 'Passport', '5923');
INSERT INTO PATRON VALUES('107', 'Driver License', '3210');
INSERT INTO PATRON VALUES('108', 'Driver License', '4207');
INSERT INTO PATRON VALUES('109', 'Driver License', '4977');
INSERT INTO PATRON VALUES('110', 'Passport', '6092');
INSERT INTO PATRON VALUES('111', 'Passport', '9451');
INSERT INTO PATRON VALUES('104', 'Driver License', '1411');
INSERT INTO PATRON VALUES('116', 'Passport', '3809');
INSERT INTO PATRON VALUES('117', 'Driver License', '0484');
INSERT INTO PATRON VALUES('112', 'Passport', '5570');
INSERT INTO PATRON VALUES('115', 'Passport', '2395');

INSERT INTO ADVISES VALUES('105','102', TO_DATE('1/1/2017','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('115','112', TO_DATE('2/10/2017','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('113','109', TO_DATE('12/1/2016','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('106','102', TO_DATE('1/13/2017','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('109','108', TO_DATE('1/7/2017','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('105','109', TO_DATE('12/1/2016','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('109','115', TO_DATE('1/1/2016','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('114','112', TO_DATE('2/1/2017','MM/DD/YYYY'));
INSERT INTO ADVISES VALUES('101','112', TO_DATE('2/5/2017','MM/DD/YYYY'));

INSERT INTO CITY VALUES('New York City', 'New York');
INSERT INTO CITY VALUES('Anchorage', 'Alaska');
INSERT INTO CITY VALUES('Phoenix', 'Arizona');
INSERT INTO CITY VALUES('Louisville', 'Kentucky');
INSERT INTO CITY VALUES('Wichita', 'Kansas');
INSERT INTO CITY VALUES('Baltimore', 'Maryland');
INSERT INTO CITY VALUES('Seattle', 'Washington');
INSERT INTO CITY VALUES('Columbia', 'South Carolina');
INSERT INTO CITY VALUES('Philadelphia', 'Pennsylvania');
INSERT INTO CITY VALUES('Charlotte', 'North Carolina');
INSERT INTO CITY VALUES('Houston', 'Texas');
INSERT INTO CITY VALUES('Nevada', 'Las Vegas');
INSERT INTO CITY VALUES('Newark', 'New Jersey');

INSERT INTO PUBLISHER VALUES('Algonquin Press', 'Kathy Pories');
INSERT INTO PUBLISHER VALUES('FaithWords', 'Anne Goldsmith');
INSERT INTO PUBLISHER VALUES('Genesis Press', 'Niani Colom');
INSERT INTO PUBLISHER VALUES('Broadway Books', 'Ann Campbell');
INSERT INTO PUBLISHER VALUES('Harlem Moon', 'Janet Hil');
INSERT INTO PUBLISHER VALUES('Hyperion', 'Gretchen Young');
INSERT INTO PUBLISHER VALUES('Doubleday', 'Steve Rubins');
INSERT INTO PUBLISHER VALUES('Lyons Press', 'Tom McCarthy');
INSERT INTO PUBLISHER VALUES('AMinotaur', 'Kelley Ragland');
INSERT INTO PUBLISHER VALUES('William Morrow', 'Henry Ferris');
INSERT INTO PUBLISHER VALUES('Black Pearl Books', 'Crystal Parker');
INSERT INTO PUBLISHER VALUES('Biblion Publishing', 'Celeste Dickson');

INSERT INTO BOOK VALUES('1001', 'Nevada', 'Las Vegas', 'Hyperion', 'Hamlet', '2002');
INSERT INTO BOOK VALUES('1002', 'Phoenix', 'Arizona', 'Broadway Books', 'Macbeth', '1999');
INSERT INTO BOOK VALUES('1003', 'Columbia', 'South Carolina', 'William Morrow', 'Dracula', '1990');
INSERT INTO BOOK VALUES('1004', 'Seattle', 'Washington', 'AMinotaur', 'Othello', '2005');
INSERT INTO BOOK VALUES('1005', 'Baltimore', 'Maryland', 'Algonquin Press', 'Persuasion', '2004');
INSERT INTO BOOK VALUES('1006', 'Charlotte', 'North Carolina', 'Biblion Publishing', 'Night', '2008');
INSERT INTO BOOK VALUES('1007', 'Seattle', 'Washington', 'Hyperion', 'Rebecca', '2003');
INSERT INTO BOOK VALUES('1008', 'Anchorage', 'Alaska', 'Biblion Publishing', 'Emma', '2007');
INSERT INTO BOOK VALUES('1009', 'Seattle', 'Washington', 'Broadway Books', 'Heidi', '2005');
INSERT INTO BOOK VALUES('1010', 'Seattle', 'Washington', 'Broadway Books', 'Atonement', '2016');
INSERT INTO BOOK VALUES('1011', 'Baltimore', 'Maryland', 'Algonquin Press', 'Cranford', '2004');
INSERT INTO BOOK VALUES('1012', 'Phoenix', 'Arizona', 'Broadway Books', 'Matilda', '2002');
INSERT INTO BOOK VALUES('1013', 'Charlotte', 'North Carolina', 'William Morrow', 'Shogun', '2005');
INSERT INTO BOOK VALUES('1014', 'Columbia', 'South Carolina', 'Hyperion', 'Room', '2004');
INSERT INTO BOOK VALUES('1015', 'Nevada', 'Las Vegas', 'Algonquin Press', 'Carrie', '2003');
INSERT INTO BOOK VALUES('1016', 'Philadelphia', 'Pennsylvania', 'Algonquin Press', 'Otage', '2001');
INSERT INTO BOOK VALUES('1017', 'Anchorage', 'Alaska', 'Biblion Publishing', 'Mary Barton', '2005');
INSERT INTO BOOK VALUES('1018', 'Houston', 'Texas', 'Biblion Publishing', 'The Shining', '2004');
INSERT INTO BOOK VALUES('1019', 'Newark', 'New Jersey', 'AMinotaur', 'It', '2005');
INSERT INTO BOOK VALUES('1020', 'Anchorage', 'Alaska', 'Hyperion', 'The Snakes Pass', '2004');

INSERT INTO AUTHOR VALUES('William Shakespeare','1001');
INSERT INTO AUTHOR VALUES('William Shakespeare','1002');
INSERT INTO AUTHOR VALUES('Bram Stoker','1003');
INSERT INTO AUTHOR VALUES('William Shakespeare','1004');
INSERT INTO AUTHOR VALUES('Jane Austen','1005');
INSERT INTO AUTHOR VALUES('Elie Wiesel','1006');
INSERT INTO AUTHOR VALUES('Daphne du Maurier','1007');
INSERT INTO AUTHOR VALUES('Jane Austen','1008');
INSERT INTO AUTHOR VALUES('Johanna Spyri','1009');
INSERT INTO AUTHOR VALUES('Bram Stoker','1017');
INSERT INTO AUTHOR VALUES('Ian McEwan','1010');
INSERT INTO AUTHOR VALUES('Elizabeth Gaskell','1011');
INSERT INTO AUTHOR VALUES('Roald Dahl','1012');
INSERT INTO AUTHOR VALUES('James Clavell','1013');
INSERT INTO AUTHOR VALUES('Emma Donoghue','1014');
INSERT INTO AUTHOR VALUES('Stephen King','1015');
INSERT INTO AUTHOR VALUES('Elie Wiesel','1016');
INSERT INTO AUTHOR VALUES('Elizabeth Gaskell','1017');
INSERT INTO AUTHOR VALUES('Stephen King','1018');
INSERT INTO AUTHOR VALUES('Fred Potter','1008');
INSERT INTO AUTHOR VALUES('Fred Potter','1005');
INSERT INTO AUTHOR VALUES('Stephen King','1019');
INSERT INTO AUTHOR VALUES('Bram Stoker','1020');

INSERT INTO COPY VALUES('1','1001');
INSERT INTO COPY VALUES('2','1001');
INSERT INTO COPY VALUES('3','1001');
INSERT INTO COPY VALUES('1','1002');
INSERT INTO COPY VALUES('2','1002');
INSERT INTO COPY VALUES('1','1003');
INSERT INTO COPY VALUES('2','1003');
INSERT INTO COPY VALUES('3','1003');
INSERT INTO COPY VALUES('4','1003');
INSERT INTO COPY VALUES('1','1005');
INSERT INTO COPY VALUES('1','1006');
INSERT INTO COPY VALUES('2','1006');
INSERT INTO COPY VALUES('3','1006');
INSERT INTO COPY VALUES('1','1008');
INSERT INTO COPY VALUES('2','1008');
INSERT INTO COPY VALUES('3','1008');
INSERT INTO COPY VALUES('4','1008');
INSERT INTO COPY VALUES('5','1008');
INSERT INTO COPY VALUES('1','1009');
INSERT INTO COPY VALUES('2','1009');
INSERT INTO COPY VALUES('3','1009');
INSERT INTO COPY VALUES('4','1009');
INSERT INTO COPY VALUES('1','1011');
INSERT INTO COPY VALUES('1','1012');
INSERT INTO COPY VALUES('2','1012');
INSERT INTO COPY VALUES('3','1012');
INSERT INTO COPY VALUES('4','1012');
INSERT INTO COPY VALUES('5','1012');
INSERT INTO COPY VALUES('1','1013');
INSERT INTO COPY VALUES('1','1014');
INSERT INTO COPY VALUES('1','1015');
INSERT INTO COPY VALUES('2','1015');
INSERT INTO COPY VALUES('1','1016');
INSERT INTO COPY VALUES('2','1016');
INSERT INTO COPY VALUES('1','1018');
INSERT INTO COPY VALUES('1','1019');
INSERT INTO COPY VALUES('2','1019');

INSERT INTO BORROWS VALUES('103', '1', '1003', TO_DATE('1/13/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('112', '1', '1014', TO_DATE('1/10/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('111', '2', '1001', TO_DATE('3/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('107', '3', '1012', TO_DATE('1/5/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('112', '2', '1009', TO_DATE('1/9/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('107', '3', '1003', TO_DATE('2/16/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('115', '4', '1009', TO_DATE('2/20/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('116', '4', '1012', TO_DATE('1/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('104', '1', '1006', TO_DATE('2/25/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('117', '1', '1013', TO_DATE('1/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('112', '2', '1003', TO_DATE('3/15/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('109', '1', '1002', TO_DATE('1/19/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('115', '5', '1012', TO_DATE('1/16/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('108', '1', '1009', TO_DATE('2/28/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('107', '1', '1008', TO_DATE('1/30/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('115', '4', '1003', TO_DATE('4/9/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('111', '3', '1008', TO_DATE('2/26/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('103', '2', '1002', TO_DATE('1/18/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('102', '1', '1012', TO_DATE('2/10/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('109', '2', '1008', TO_DATE('1/26/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('104', '1', '1015', TO_DATE('3/17/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('104', '2', '1006', TO_DATE('3/10/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('103', '3', '1001', TO_DATE('4/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('103', '1', '1018', TO_DATE('4/5/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('111', '1', '1019', TO_DATE('4/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('107', '1', '1016', TO_DATE('4/5/2017','MM/DD/YYYY'));

/* 1. Produce table Answer01 (Person_Name) which contains all the patrons who don't have an */
/*    advisor and who have borrowed at least 2 books. (While your query specifically assumes */
/*    2 books, write in a sufficiently general way that it would work for 20 books by simply */
/*    replacing "2" by "20", but do not write this second query.) */

/* LNUMBER of all patron who don't have an advisor */
CREATE TABLE TEMP0 AS
SELECT LNUMBER AS LNUMBER
FROM PATRON
MINUS
SELECT PATRON
FROM ADVISES;

/* Count the number of books borrowed for each LNUMBER */
CREATE TABLE TEMP1 AS
SELECT DISTINCT LNUMBER AS LNUMBER, COUNT(LNUMBER) AS NUM_OF_BOOKS
FROM BORROWS
GROUP BY LNUMBER;

/* LNUMBER of all patron who don't have an advisor and who borrowed at least 2 books. */
CREATE TABLE TEMP2 AS
SELECT TEMP0.LNUMBER AS LNUMBER
FROM TEMP0, TEMP1
WHERE TEMP0.LNUMBER = TEMP1.LNUMBER AND TEMP1.NUM_OF_BOOKS > 1;

CREATE TABLE ANSWER01 AS
SELECT DISTINCT NAME AS PERSON_NAME
FROM PERSON, TEMP2
WHERE PERSON.LNUMBER = TEMP2.LNUMBER
ORDER BY PERSON_NAME ASC;



/* 2. Produce table Answer02 (Author_Name) which contains all the authors who satisfy the following */
/*    condition. The author's books were published by at least all the publishers who published at */
/*    least one book by Jane Austen; however, do not include Jane Austen in your answer. */

/* Publishers which published at least one book by Jane Austen */
CREATE TABLE TEMP3 AS
SELECT DISTINCT BOOK.PUBNAME AS PUBNAME
FROM BOOK, AUTHOR
WHERE BOOK.ISBN = AUTHOR.ISBN AND AUTHOR.AUTHOR = 'Jane Austen';

/* ISBN and Publisher of every book published by any publishers of TEMP3 */
CREATE TABLE TEMP4 AS
SELECT BOOK.ISBN AS ISBN, BOOK.PUBNAME AS PUBNAME
FROM BOOK, TEMP3
WHERE BOOK.PUBNAME = TEMP3.PUBNAME;

/* Authors of books published by any publishers of TEMP3, except Jane Austen */
CREATE TABLE TEMP5 AS
SELECT DISTINCT AUTHOR.AUTHOR AS AUTHOR, TEMP4.PUBNAME AS PUBNAME
FROM AUTHOR, TEMP4
WHERE AUTHOR.ISBN = TEMP4.ISBN AND AUTHOR != 'Jane Austen';

/* Count the number of times each author occurs in TEMP5 */
CREATE TABLE TEMP6 AS
SELECT AUTHOR AS AUTHOR, COUNT(AUTHOR) AS NUM_AUTHOR
FROM TEMP5
GROUP BY AUTHOR;

/* Count the number of publishers in TEMP3 */
CREATE TABLE TEMP7 AS
SELECT COUNT(*) AS NUM_PUBS FROM TEMP3;

CREATE TABLE ANSWER02 AS
SELECT DISTINCT TEMP6.AUTHOR AS AUTHOR_NAME
FROM TEMP6, TEMP7
WHERE TEMP6.NUM_AUTHOR = TEMP7.NUM_PUBS
ORDER BY TEMP6.AUTHOR ASC;


/* 3. Produce table Answer03 (Author_Name, Book_ISBN) which contains the books all of whose copies */
/*    are currently borrowed and the authors of those books. */

/* Count the number of copies for each ISBN */
CREATE TABLE TEMP8 AS
SELECT ISBN AS ISBN, COUNT(ISBN) AS NUM_OF_COPIES
FROM COPY
GROUP BY ISBN;

/* Count the number of copies borrowed for each ISBN */
CREATE TABLE TEMP9 AS
SELECT ISBN AS ISBN, COUNT(ISBN) AS NUM_OF_BORROWED
FROM BORROWS
GROUP BY ISBN;

/* All ISBN of books that all their copies have been borrowed */
CREATE TABLE TEMP10 AS
SELECT TEMP8.ISBN AS ISBN
FROM TEMP8, TEMP9
WHERE TEMP8.ISBN = TEMP9.ISBN AND TEMP8.NUM_OF_COPIES = TEMP9.NUM_OF_BORROWED;

CREATE TABLE ANSWER03 AS
SELECT DISTINCT AUTHOR AS AUTHOR_NAME, TEMP10.ISBN AS BOOK_ISBN
FROM AUTHOR, TEMP10
WHERE AUTHOR.ISBN = TEMP10.ISBN
ORDER BY AUTHOR_NAME ASC;


/* 4. Produce table Answer04 (Person_Name, Book_ISBN, Author) which contains all the persons, the */
/*    books they have borrowed which were published by the Broadway Books before the year 2006, */
/*    and the authors of those books. */

/* Books published by the Broadway Books before the year 2006 */
CREATE TABLE TEMP11 AS
SELECT ISBN AS ISBN
FROM BOOK
WHERE PUBNAME = 'Broadway Books' AND YEAR < 2006;

/* LNUMBER of borrowers and ISBN of books of TEMP11 */
CREATE TABLE TEMP12 AS
SELECT BORROWS.LNUMBER AS LNUMBER, BORROWS.ISBN AS ISBN
FROM BORROWS, TEMP11
WHERE BORROWS.ISBN = TEMP11.ISBN;

CREATE TABLE ANSWER04 AS
SELECT DISTINCT PERSON.NAME AS PERSON_NAME, TEMP12.ISBN AS BOOK_ISBN, AUTHOR.AUTHOR AS AUTHOR
FROM PERSON, TEMP12, AUTHOR
WHERE PERSON.LNUMBER = TEMP12.LNUMBER AND AUTHOR.ISBN = TEMP12.ISBN
ORDER BY PERSON_NAME ASC;

spool Homework04Spool.txt;

SELECT * FROM ANSWER01;
SELECT * FROM ANSWER02;
SELECT * FROM ANSWER03;
SELECT * FROM ANSWER04;

spool off;