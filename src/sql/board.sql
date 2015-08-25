카페 board_cafe
선술집 board_bar
학교 board_school
옥탑방 board_penthouse
군대 board_military
유배지 board_exile
노래방 board_music
방송국 board_broadcast


create table board(
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

drop table board;

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

create table goodbad(
	board_pk number(10),
	member_pk number(10),
	category varchar2(10),
	good varchar2(5),
	bad varchar2()
);

select r.board_pk,nickname,image,content,good,bad,r.create_date from reply r,member m where r.board_pk=18 and r.member_pk=m.pk;
select * from member ;
select * from reply;
update member set point=point+10 where nickname='아이언맨';
select * from board_cafe ;
(select board_pk from tags where name in ('꿀잼', '여자',));

select * from board_cafe;
select * from member where nickname like '%배트%';
select * from tags where board_pk=27;
select * from tags;
drop table tags;

select board_pk as pk from tags where name='고민';

select * from
		(select rownum rnum,pk,title,description,image,good,bad,hit,create_date from
		(select * from board where pk in 
		(select board_pk from tags where name in ('고민')) order by create_date desc))
		where rnum >= ((1-1)*10+1) and rnum <= (1*10);

select pk,title,create_date from 
		(select rownum,pk,title, create_date from board where category='cafe' order by create_date desc)
		where rownum <= 10

insert into board (pk, title, description, create_date) values(board_seq.nextval, '두번째',
		'멍멍', sysdate);	
delete from member where nickname='족발';
		
select title,create_date from 
		(select rownum,title, create_date from board_cafe order by create_date desc)
		where rownum <= 10
		

create sequence board_seq start with 1 increment by 1 ;
drop sequence board_seq;

