use gb;
create table t_user(
	useridx int primary key auto_increment,
    userid varchar(300) unique not null,
    userpw varchar(300) not null,
    username varchar(300) not null,
    usergender enum('M','W'),
	zipcode varchar(300) not null,
    addr varchar(1000),
    addrdetail varchar(1000) not null,
    addretc varchar(300),
    userhobby varchar(2000)
);

create table t_board(
	boardnum bigint primary key auto_increment,
    boardtitle varchar(300) not null,
    boardcontents text not null,
    regdate datetime default now(),
    updatedate datetime default now(),
    readcount int default 0,
    userid varchar(300)
);

select * from t_user;

insert into t_board(boardtitle,boardcontents,userid) values('테스트 제목1','테스트 내용1','apple');
insert into t_board(boardtitle,boardcontents,userid) values('테스트 제목2','테스트 내용2','banana');
insert into t_board(boardtitle,boardcontents,userid) values('테스트 제목3','테스트 내용3','cherry');

select * from t_board;

