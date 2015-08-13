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
bad number(5) DEFAULT 0,
hit number(10) DEFAULT 0,
tag varchar2(60) not null,
email varchar2(20) not null,
create_date date default sysdate,
foreign key(email) references member(email)
);

select * from board_cafe;
select * from board_bar;
select * from board_school;
select * from board_penthouse;
select * from board_military;
select * from board_exile;
select * from board_music;
select * from board_broadcast;


drop table board_cafe;

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