create table reply
(
pk number(7) primary key,
image varchar2(80),
email varchar2(20) not null,
nickname varchar2(30) not null,
create_date date default sysdate,
empathy number(5) default 0,
notempathy number(5) default 0,
board_key number(7) not null,
foreign key(board_key) references board(pk),
foreign key(email) references member(email)
);

drop table reply;