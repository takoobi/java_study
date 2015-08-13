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
	good number(5) DEFAULT 0,
	bad number(5) DEFAULT 0,
	hit number(10) DEFAULT 0,
	tag varchar2(20) not null,
	email varchar2(20) not null,
	create_date date default sysdate,
	foreign key(email) references member(email)
);


select * from board_cafe where regexp_like(tag, '%,man%');

select * from board_cafe where tag in (like '%man');

drop table board_cafe;

create sequence board_seq start with 1 increment by 1 ;
 
WITH TT AS
    (
        SELECT 'AAA,BBB,CCC,DDD.EEE' TXT FROM DUAL
    )
    SELECT TRIM(REGEXP_SUBSTR(TXT, '[^,]+', 1, LEVEL)) AS TXT 
        FROM TT
        CONNECT BY INSTR(TXT, ',', 1, LEVEL - 1) > 0
;

select * from board_cafe;

SELECT             TRIM(REGEXP_SUBSTR(MSG, '[^,]+', 1, LEVEL)) AS MESSAGE
FROM               (SELECT tag AS MSG FROM board_cafe)
CONNECT BY   INSTR(MSG, ',', 1, LEVEL - 1) > 0 

