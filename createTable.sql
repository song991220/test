CREATE SCHEMA IF NOT EXISTS music DEFAULT CHARACTER SET utf8 ;
use music;

drop table IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
	id varchar(100) not null comment '아이디'
	,psw varchar(100) not null comment '패스워드'
	,membership varchar(50) not null comment '회원타입'
	,alies varchar(50) not null comment '별칭'
	,delyn varchar(1) not null comment '삭제여부'
	,reg_user varchar(100)  comment '생성자'
	,reg_date date  comment '생성일'
	,up_user varchar(100)  comment '수정자'
	,up_date date  comment '수정일'
    ,primary key(id)
);
drop table IF EXISTS album;
CREATE TABLE IF NOT EXISTS album(
id int not null auto_increment comment '아이디'
,title varchar(100) not null comment '타이틀'
,singersong varchar(100) not null comment '가수'
,img varchar(100)  comment '파일명'
-- ,delyn varchar(1) not null comment '삭제여부'
,reg_user varchar(100)  comment '생성자'
,reg_date date  comment '생성일'
,up_user varchar(100)  comment '수정자'
,up_date date  comment '수정일'
    ,primary key(id)
);
ALTER TABLE music.album  add COLUMN delyn varchar(1) NOT NULL COMMENT '삭제여부';

drop table IF EXISTS item;
CREATE TABLE IF NOT EXISTS item
(
id int not null auto_increment comment '아이디'
,albumid int not null comment '앨범아이디'
,categoryid varchar(10) not null comment '장르'
,title varchar(500)  comment '제목'
,delyn varchar(1) not null comment '삭제여부'
,reg_user varchar(100)  comment '생성자'
,reg_date date  comment '생성일'
,up_user varchar(100)  comment '수정자'
,up_date date  comment '수정일'
,primary key(id)
);
drop table IF EXISTS comcode;
CREATE TABLE IF NOT EXISTS comcode(
parentscd varchar(100) not null comment '부모코드  PK'
,groupcd varchar(100) not null comment '그룹코드 pk'
,code varchar(50) not null comment '코드 PK'
,value varchar(100) not null comment '값'
,orderseq int comment '정렬순서'
,delyn varchar(1) not null comment '삭제여부'
,reg_user varchar(100)  comment '생성자'
,reg_date date  comment '생성일'
,up_user varchar(100)  comment '수정자'
,up_date date  comment '수정일'
,primary key(parentscd,code,groupcd)
);
drop table IF EXISTS board;
CREATE TABLE IF NOT EXISTS board(
id int not null auto_increment  comment '아이디'
,boardid varchar(10) not null  comment '게시판아이디'
,type varchar(10) not null  comment '뎃글종류(일반,문의)001:일반 002:문의'
,content varchar(500) not null  comment '내용'
,delyn varchar(1) not null  comment '삭제여부'
,reg_user varchar(100)   comment '생성자'
,reg_date date  comment '생성일'
,up_user varchar(100)  comment '수정자'
,up_date date  comment '수정일'
,primary key(id)
);
drop table IF EXISTS reply;
CREATE TABLE IF NOT EXISTS reply(
id int not null auto_increment comment '아이디'
,boardid varchar(10) not null comment '게시판아이디'
,type varchar(10) not null comment '뎃글종류(일반,문의)001:일반 002:문의'
,content varchar(500) not null comment '내용'
,delyn varchar(1) not null comment '삭제여부'
,reg_user varchar(100)  comment '생성자'
,reg_date date  comment '생성일'
,up_user varchar(100)  comment '수정자'
,up_date date  comment '수정일'
,primary key(id)
);

drop table IF EXISTS auth;
CREATE TABLE auth (
  id int NOT NULL AUTO_INCREMENT COMMENT '아이디',
  member_id varchar(100) not null COMMENT '맴버아이디',
  authtype varchar(100) COMMENT '타입\r\n001 관리자\r\n002 매니저\r\n003 일반유저',
  delyn varchar(1) DEFAULT NULL COMMENT '삭제여부',
  reg_user varchar(100) DEFAULT NULL COMMENT '생성자',
  reg_date date DEFAULT NULL COMMENT '생성일',
  up_user varchar(100) DEFAULT NULL COMMENT '수정자',
  up_date date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (id)
);

INSERT INTO music.comcode (parentscd,groupcd,code,value,orderseq ,delyn,reg_user,reg_date,up_user,up_date) VALUES
	 ('001','boardt','001','앨범',1,'N','admin','2022-07-10',NULL,NULL),
	 ('001','boardt','002','Q&A',2,'N','admin','2022-07-10',NULL,NULL),
	 ('002','etc','001','OST',1,'N','admin','2022-07-10',NULL,NULL),
	 ('002','etc','002','클래식',2,'N','admin','2022-07-10',NULL,NULL),
	 ('002','etc','003','재즈',3,'N','admin','2022-07-10',NULL,NULL),
	 ('002','foc','004','pop',1,'N','admin','2022-07-10',NULL,NULL),
	 ('002','foc','005','/메탈',2,'N','admin','2022-07-10',NULL,NULL),
	 ('002','foc','006','R&B/Soul',3,'N','admin','2022-07-10',NULL,NULL),
	 ('002','koc','007','발라드',1,'N','admin','2022-07-10',NULL,NULL),
	 ('002','koc','008','댄스',2,'N','admin','2022-07-10',NULL,NULL),
	 ('002','koc','009','힙팝',3,'N','admin','2022-07-10',NULL,NULL),
	 ('003','member','001','관리자',1,'N','admin','2022-07-10',NULL,NULL),
	 ('003','member','002','일반회원',2,'N','admin','2022-07-10',NULL,NULL),
	 ('003','member','003','유료회원',3,'N','admin','2022-07-10',NULL,NULL),
	 ('003','member','004','탈퇴/휴먼회원',4,'N','admin','2022-07-10',NULL,NULL);

insert into item(albumid,categoryid,title,delyn,reg_user,reg_date)
values
(1,'001','노래타이틀1','N','admin',now() ),
(1,'002','노래타이틀2','N','admin',now() ),
(1,'003','노래타이틀3','N','admin',now() )
;   

insert into album(title,singersong,img,reg_user,reg_date)
values
('Why Not','와이낫 크루 (KCM & 권은비 & 박현규 & Mudd the student)','','admin',now() ),
('Moodswings In To Order','DPR IAN','','admin',now() ),
('오늘의 웹툰 OST Part.1','지효 (TWICE)','','admin',now() ),
('Break My Heart Myself (feat. YEJI & RYUJIN of ITZY)','Bebe Rexha, ITZY (있지)','','admin',now() ),
('Freaky','미란이 (Mirani)','','admin',now() )
;  

insert into auth(member_id,authtype,delyn,reg_user,reg_date) values
('admin','001','N','admin',now()),
('user001','001','N','admin',now()),
('admin','001','N','admin',now()),
('admin','001','N','admin',now()),
('admin','001','N','admin',now())
;

insert into member(id,psw,membership,alies,delyn,reg_user,reg_date)
values
('admin','1234','001','admin','N','admin',now()),
('user001','1234','002','admin','N','admin',now()),
('user002','1234','003','admin','N','admin',now()),
('user003','1234','004','admin','N','admin',now())
;

INSERT INTO music.comcode (parentscd,groupcd,code,value,orderseq,delyn,reg_user,reg_date) VALUES
	 ('004','auth','001','관리자',1,'N','admin',now()),
     ('004','auth','002','매니저(앨범리스트관리자)',2,'N','admin',now()),
     ('004','auth','003','매니저(게시판관리자)',3,'N','admin',now()),
     ('004','auth','004','매니저(회원관리자)',4,'N','admin',now()),
     ('004','auth','005','유저(일반회원)',5,'N','admin',now()),
     ('004','auth','006','유저(유료회원)',6,'N','admin',now())    
;   
commit;     



select 
*
from 
album
;

-- 테이블 복사(구조와 데이터)  기존 album을 album2로복사
create table if not exists album2 select * from album; 

-- insert into album2 select * from album ;

-- 데이터 복사
insert into album(title,singersong,img,reg_user)
select title,singersong,img,reg_user
from album ;

select * from `member` m ;

insert into member(id,psw,membership,alies,delyn)
values('','1','001','1','N')
;


INSERT INTO music.album (title,singersong,img,delyn,reg_user,reg_date) VALUES
    ("조각집",'아이유','','admin','2021-12-29'),
     ("사랑인가봐",'멜로망스',','N','admin','2022-02-18'),
     ("열이올라요",'선미','','admin','2022-06-29'),
     ("THE WORLD EP.1 : MOVEMENT",'ATEEZ (에이티즈)','','admin','2022-07-29'),
     ("너의 잠을 채워줄게",'폴킴','','admin','2022-07-28'),
     ("환승연애2 OST Part 1",'강승식 (빅톤)','','admin','2022-07-29'),
     ("My Star",'UNDERHILLS (언더힐즈)','','admin','2022-07-29'),
     ("2022 월간 윤종신 7월호",'윤종신','','admin','2022-07-28'),
     ("이브닝",'유주 (YUJU)','','admin','2022-07-28'),
     ("Grown Ass Kid",'지코 (ZICO)','','admin','2022-07-27'),
     ("You're not alone",'빨간의자','','admin','2022-07-28'),
     ("사랑은 창밖에 빗물 같아요",'앤씨아','','admin','2022-07-28'),
     ("YOU.F.O",'니콜','','admin','2022-07-27'),
     ("Cookie",'그_냥, 민서 (MINSEO)','','admin','2022-07-27'),
     ("부서진 조각",'면지','','admin','2022-07-28'),
     ("Hello 여름",'런치송 프로젝트','','admin','2022-07-27'),
     ("Summer Dream",'서교동의 밤','','admin','2022-07-27'),
    ("THIS MOMENT",'JEMINN','','admin','2022-07-27'),
     ("[Genuine]",'선예','','admin','2022-07-26'),
     ("W SERIES ‘2TAN’(we ver)",'TAN','','admin','2022-07-26'),
    ("Linked Up",'TAN','','admin','2022-07-27'),
     ("It’s time",'김진호 (SG워너비)','','admin','2022-07-26'),
     ("Geekyland",'퍼플키스 (PURPLE KISS)','','admin','2022-07-25'),
     ("WE (Oui)",'OuiOui (위위)','','admin','2022-07-25'),
    ("Somebody",'로꼬, 화사 (Hwa Sa)','','admin','2022-07-25'),
    ("SPORTS",'태인 (TAIN)','','admin','2022-07-26'),
    ("City of Star",'Taebeen','','admin','2022-07-26');
      
     update album  set delyn = 'N' ;
