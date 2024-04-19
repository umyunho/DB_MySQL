--01_DDL.SQL

CREATE TABLE `scott`.`memberlist` (
  `membernum` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `birth` DATETIME NULL DEFAULT now(),
  `age` INT NULL DEFAULT '20',
  `bpoint` INT NULL DEFAULT 0,
  PRIMARY KEY (`membernum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

select*from memberlist

--booklist테이블 생성
CREATE TABLE `scott`.`booklist` (
  `booknum` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(100) NOT NULL,
  `makeyear` INT NULL,
  `inprice` INT NOT NULL,
  `rentprice` INT NOT NULL,
  `grade` VARCHAR(5) NULL DEFAULT 'all',
  PRIMARY KEY (`booknum`))
  ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



--자주쓰는 자료형
--INT : 정수자료형(FLOAT,DOUBLE은 실수)
--VARCHAR:문자열 자료형, 가변길이(CHAR은 고정길이)
--TEXT:긴 문자열은 TEXT로 별도 저장
--DATETIME:날짜 자료형 저장
--TINYINT : -128에서 127까지 저장하지만 여기서 1또는 0만 저장해 BOOLEAN값 표현

--자주쓰는 제약 조건
-- NOT NULL: 빈 값은 받지 않는다는 뜻(NULL은 빈 값 허용)
-- AUTO_INCREMENT: 숫자 자료형인 경우 다음 로우가 저장될 때 자동으로 1 증가
-- UNSIGNED: 0과 양수만 허용
-- ZEROFILL: 숫자의 자리 수가 고정된 경우 빈 자리에 0을 넣음
-- DEFAULT now(): 날짜 컬럼의 기본값을 현재 시간으로. DATETIME 자료형에 적용 가능

--rentlist table 생성
CREATE TABLE `scott`.`rentlist` (
  `numseq` INT NOT NULL AUTO_INCREMENT,
  `rentdate` DATETIME NULL DEFAULT now(),
  `bnum` INT NOT NULL,
  `mnum` INT NOT NULL,
  `discount` INT NULL DEFAULT 0,
  PRIMARY KEY (`numseq`, `mnum`, `bnum`),
  INDEX `fk1_idx` (`bnum` ASC) VISIBLE,
  INDEX `fk2_idx` (`mnum` ASC) VISIBLE,
  CONSTRAINT `fk1`
    FOREIGN KEY (`bnum`)
    REFERENCES `scott`.`booklist` (`booknum`)
    ON DELETE CASCADE   ON UPDATE CASCADE,
  CONSTRAINT `fk2`
    FOREIGN KEY (`mnum`)
    REFERENCES `scott`.`memberlist` (`membernum`)
    ON DELETE CASCADE   ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

select*from rentlist;



--필드의 수정
ALTER TABLE `scott`.`memberlist`
CHANGE COLUMN `birthday` `birth` DATE NOT NULL;

ALTER TABLE `scott`.`memberlist`
CHANGE COLUMN `birth` `birthday` DATE NOT NULL;


--필드의 삭제
ALTER TABLE `scott`,`memberlist`
DROP COLUMN `gender`;

--필드의 추가
ALTER TABLE `scott`.`memberlist`
ADD COLUMN `gender` VERCHAR(3)NULL AFTER `AGE`;

ALTER TABLE `scott`.`memberlist`
ADD COLUMN `gender` VARCHAR(3) NULL AFTER `age`;


--테이블의 삭제
DROP TABLE `scott`.`rentlist`;


CREATE TABLE `scott`.`rentlist` (
  `rent_seq` INT NOT NULL,
  `rentdate` DATETIME NOT NULL DEFAULT now(),
  `bnum` INT NOT NULL,
  `mnum` INT NOT NULL,
  `discount` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`rent_seq`));

  --외래키 추
  ALTER TABLE `scott`.`rentlist` 
ADD INDEX `fk1_idx` (`bnum` ASC) VISIBLE,
ADD INDEX `fk2_idx` (`mnum` ASC) VISIBLE;
;
ALTER TABLE `scott`.`rentlist` 
ADD CONSTRAINT `fk1`
  FOREIGN KEY (`bnum`)
  REFERENCES `scott`.`booklist` (`booknum`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk2`
  FOREIGN KEY (`mnum`)
  REFERENCES `scott`.`memberlist` (`membernum`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


CREATE OR REPLACE VIEW rentDetail AS
SELECT a.rent_seq, a.rentdate, a.bnum, b.subject, a.mnum, c.name, b.rentprice, a.discount, 
   (b.rentprice - a.discount) AS "amount"
FROM rentlist a, booklist b, memberlist c
WHERE a.bnum = b.booknum AND a.mnum=c.membernum;
















