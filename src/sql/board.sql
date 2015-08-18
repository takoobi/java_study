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

create table testx(
	pk number(10),
	tags varchar2(100)
)

insert into testx (pk, tags) values(2,'abc, dfab, cab, bbb')

select tags from testx where tags like '%a%'

drop table testx

select pk, column_value tags 
from (
	select pk, column_value tags 
	from testx, table(tags)
) data, table(data.tags)

select tags from (select tags from tabla(tags))



 CREATE OR REPLACE FUNCTION vs (vlist club.members%type, sub integer)
  2  RETURN VARCHAR2
  3  IS
  4  BEGIN
  5    IF vlist.exists(1) THEN
  6     IF sub <= vlist.last THEN
  7       RETURN vlist(sub);
  8     ELSE
  9       RETURN 'Less than '||sub||' members';
 10     END IF;
 11    ELSE
 12     RETURN 'No members';
 13    END IF;
 14  END vs;
  /
  
create or replace function vs (vlist testx.tags%type, sub in varchar2)
return varchar2
is
begin
	if vlist.exists(sub) then
		return 'true';
	else
		return 'false';
	end if;
end vs;
/




CREATE TYPE BODY employee_typ AS
  MAP MEMBER FUNCTION get_idno RETURN NUMBER IS
  BEGIN
    RETURN employee_id;
  END;
  MEMBER PROCEDURE display_address ( SELF IN OUT NOCOPY employee_typ ) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(first_name || ' '  || last_name);
    DBMS_OUTPUT.PUT_LINE(address.street);
    DBMS_OUTPUT.PUT_LINE(address.city || ', '  || address.state || ' ' ||
                         address.postal_code);   
  END;
END;
/
CREATE TABLE employee_tab OF employee_typ;




select tags from testx
CREATE TYPE TAG_ARRAY IS VARRAY (10) OF varchar2(30)

select * from
		(select rownum rnum,pk,title,description,image,good,bad,hit,tag,create_date from
		(select * from board_cafe order by create_date desc))
		where rnum >= ((1-1)*10+1) and rnum <= (1*10)


insert into board_cafe (pk, title, description, tag, email, create_date) values(board_seq.nextval, 'zxcvzxcv',
		'asdasdxczc', 'woman', 'aa@aa', sysdate);	

create sequence board_seq start with 1 increment by 1 ;
 
WITH TT AS
    (
        SELECT 'AAA,BBB,CCC,DDD,EEE' TXT FROM DUAL
    )
    SELECT TRIM(REGEXP_SUBSTR(TXT, '[^,]+', 1, LEVEL)) AS TXT 
        FROM TT
        CONNECT BY INSTR(TXT, ',', 1, LEVEL - 1) > 0
;

select * from board_cafe;

SELECT             TRIM(REGEXP_SUBSTR(MSG, '[^,]+', 1, LEVEL)) AS MESSAGE
FROM               (SELECT tag AS MSG FROM board_cafe)
CONNECT BY   INSTR(MSG, ',', 1, LEVEL - 1) > 0 

