create table member (
  email  VARCHAR2(20) PRIMARY KEY,
  pw     VARCHAR2(20) not null,  
  nickname VARCHAR2(20) unique not null,
  image  VARCHAR2(30),
  description   VARCHAR2(100),
  gender VARCHAR2(1) CHECK (gender IN ('M', 'F')),
  point number(5) DEFAULT 0,
  create_date date default sysdate
);

insert into member values('aa@aa','1234','aa','1234','1234','M',0,sysdate)

select * from member;

select id from member where email='1234'

drop table member purge;

alter table member
add
(
	cd date
);

create sequence member_seq start with 1 increment by 1;

drop sequence member_seq;

select * from member where email='sbv200@hanmail.net'

delete from member;