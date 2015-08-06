카페 board_cafe
선술집 board_bar
학교 board_school
옥탑방 board_penthouse
군대 board_military
유배지 board_exile
노래방 board_music
방송국 board_broadcast

create table board_cafe(
pk number(7) primary key,
title varchar2(50) not null,
description varchar2(1000) not null,
image varchar2(80),
empathy number(5) DEFAULT 0,
notempathy number(5) DEFAULT 0,
count number(10) DEFAULT 0,
nickname varchar2(30) not null,
tag varchar2(60) not null,
email varchar2(20) not null,
create_date date default sysdate,
foreign key(email) references member(email)
);

select * from board_cafe;

drop table board_cafe;

create sequence board_seq start with 1 increment by 1 ;
