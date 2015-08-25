create table member (
  email  varchar2(20) primary key,
  pw     varchar2(20) not null,  
  nickname varchar2(20) unique not null,
  image  varchar2(30) default 'original_image.jpg',
  title varchar2(50),
  description   varchar2(300),
  gender varchar2(1) check (gender IN ('M', 'F')),
  point number(5) default 0,
  create_date date default sysdate
);

insert into member values('1234','1234','1234','1234','1234','M',0,sysdate)

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

update member set pw='1234', nickname='1234', image='1234', description='1234', gender='F'  where email='sbv200@hanmail.net'

drop table member;

////////////////////////////////////////////////////////////////////////////////////////////////////
create table reply
(
	pk number(7) primary key,
	email varchar2(20) not null,
	description varchar2(500),
	create_date date default sysdate,
	board_key number(7) not null
);
foreign key(board_key) references board(pk),
foreign key(email) references member(email)

create sequence reply_seq start with 1 increment by 1;

select * from reply;

drop table reply purge;

//////////////////////////////////////////////////////////////////////////////////////////////////////
카페 board_cafe
선술집 board_bar
학교 board_school
옥탑방 board_penthouse
군대 board_military
유배지 board_exile
노래방 board_music
방송국 board_broadcast

create table board_broadcast(
pk number(7) primary key,
title varchar2(50) not null,
description varchar2(1000) not null,
image varchar2(80),
good number(5) DEFAULT 0,
good_id varchar2(4000),
bad number(5) DEFAULT 0,
bad_id varchar2(4000),
hit number(10) DEFAULT 0,
tag varchar2(60) not null,
email varchar2(20) not null,
create_date date default sysdate
);
foreign key(email) references member(email)

select * from board_cafe;
select * from board_bar;
select * from board_school;
select * from board_penthouse;
select * from board_military;
select * from board_exile;
select * from board_music;
select * from board_broadcast;

delete from board_cafe where pk=121

drop table board_cafe purge;
drop table board_bar purge;
drop table board_school purge;
drop table board_penthouse purge;
drop table board_military purge;
drop table board_exile purge;
drop table board_music purge;
drop table board_broadcast purge;

create sequence board_seq start with 1 increment by 1 ;

delete from board_cafe;
delete from board_bar;
delete from board_school;
delete from board_penthouse;
delete from board_military;
delete from board_exile;
delete from board_music;
delete from board_broadcast;

select * from board_cafe where tag like '%worry%' or tag like '%boy%';
select * from board_cafe where tag='boy';
select * from board_cafe where tag like '%girl%';
select * from board_cafe where tag='fun';
select * from board_cafe where tag='emp';

select a.* from (select rownum as rnum, b.* from (select * from board_cafe order by create_date desc)b)a where a.rnum>=1 and a.rnum<=6

    	select * from 
(select * from board_cafe Union 
	select * from board_bar Union
	select * from board_school Union 
	select * from board_penthouse Union 
	select * from board_military Union 
	select * from board_exile Union 
	select * from board_music Union 
	select * from board_broadcast)
		where pk=112

///////////////////////////////////////////////////////////////////////////////////////////////////////////

모든 테이블 확인하기
select * from tab;

쓰레기통 비우기, 휴지통 비우기
purge recyclebin;