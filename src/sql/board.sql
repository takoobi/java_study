카페 board_cafe
선술집 board_bar
학교 board_school
옥탑방 board_penthouse
군대 board_military
유배지 board_exile
노래방 board_music
방송국 board_broadcast


create table board_penthouse(
	pk number(10) primary key,
	title varchar2(50) not null,
	description varchar2(1000) not null,
	image varchar2(80),
	good number(5) DEFAULT 0,
	bad number(5) DEFAULT 0,
	hit number(10) DEFAULT 0,
	member_pk number(10),
	category varchar2(10),
	create_date date default sysdate,
	foreign key(member_pk) references member(pk)
);

create table member (
  pk number(10) primary key,
  email  VARCHAR2(20) not null,
  pw     VARCHAR2(20) not null,  
  nickname VARCHAR2(20) unique not null,
  image  VARCHAR2(30) default 'profile.jpg',
  title VARCHAR2(30),
  description   VARCHAR2(100),
  gender VARCHAR2(1) CHECK (gender IN ('M', 'F')),
  point number(5) DEFAULT 0,
  create_date date default sysdate
);


create table tags(
	board_pk number(10),
	member_pk number(10),
	name varchar2(20),
	category varchar2(20),
	foreign key(member_pk) references member(pk)
);

create table reply(
	board_pk number(10),
	member_pk number(10),
	content varchar2(1000),
	good number(5) default 0,
	bad number(5) default 0,
	create_date date default sysdate
);


select * from board_cafe where pk in 
(select board_pk from tags where name in ('꿀잼', '여자',));

select * from board_cafe;
select * from member where nickname like '%배트%';
select * from tags where board_pk=27;
select * from tags;

select board_pk as pk from tags where name='고민';

select * from
		(select rownum rnum,pk,title,description,image,good,bad,hit,create_date from
		(select * from board_cafe where pk in 
		(select board_pk from tags where name in ('고민')) order by create_date desc))
		where rnum >= ((1-1)*10+1) and rnum <= (1*10);

drop table board_cafe;
drop table board_military;
drop table board_bar;
drop table board_school;
drop table board_square;
drop table board_penthouse;
select board_seq.currval from dual;

insert into board (pk, title, description, create_date) values(board_seq.nextval, '두번째',
		'멍멍', sysdate);	


create sequence board_seq start with 1 increment by 1 ;
drop sequence board_seq;

