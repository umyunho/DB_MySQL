--04_Limitiffset

--select  명령의 결과 레코드가 갯수가 많을때, 일부만 지목해서 열람할 수 있다.

--오라클에서는 rownum이라는 키워드를 이용한다.
--SELECT ROWNUM,테이블이름.*FROM 테이블이름
--SELECT*FROM 테이블이름 WHERE ROWNUM>=1 AND ROWNUM<=10


--LIMIT
--SELECT로 데이터 조회할때 조회할 레코드의 갯수를 조절 제한 할 수있다.
SELECT*FROM memberlist ORDER BY membernum desc limit 5;
--회원 정보 조회하여 5개의 레코드만 리턴

--OFFSET //최초값0
--SELECT로 데이터 조회할때, 맨위에서 부터 OFFSET에 지정한 번째까지는 뛰어 넘고 그 다음부터 리턴
SELECT*FROM memberlist order by membernum desc;
SELECT*FROM memberlist order by membernum desc limit 5 offset 1;
--3번째 데이터부터 5개의 레코드 리턴 - 개수가 모자르면 있는 곳 까지 리턴



