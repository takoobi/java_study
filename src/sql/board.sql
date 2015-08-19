카페 board_cafe
선술집 board_bar
학교 board_school
옥탑방 board_penthouse
군대 board_military
유배지 board_exile
노래방 board_music
방송국 board_broadcast

create table board_military(
	pk number(10) primary key,
	title varchar2(50) not null,
	description varchar2(1000) not null,
	image varchar2(80),
	good number(5) DEFAULT 0,
	bad number(5) DEFAULT 0,
	hit number(10) DEFAULT 0,
	member_pk number(10),
	create_date date default sysdate,
	foreign key(member_pk) references member(pk)
);

create table tags(
	board_pk number(10),
	member_pk number(10),
	name varchar2(20),
	foreign key(member_pk) references member(pk),
	foreign key(board_pk) references board(pk)
);


select * from board;

select * from member;

select * from tags;

select board_seq.currval from dual;

insert into board (pk, title, description, create_date) values(board_seq.nextval, '두번째',
		'멍멍', sysdate);	


create sequence board_seq start with 1 increment by 1 ;
drop sequence board_seq;

