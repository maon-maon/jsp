show tables;

create table board(
	idx int not null auto_increment,  /*게시글 고유번호*/
	mid varchar(30) not null,  /* 게시글 올린이 아이디*/ 
	nickName	varchar(30) not null,	/* 게시글 올린이 닉네임 */
	title varchar(100) not null, /* 게시글 제목 */
	content text not null,  /* 글 내용 */
	hostIp varchar(40) not null, /* 글 올린이 IP */
	openSw char(3) default '공개', /* 공개글 유무(공개:, 비공개)*/
	readNum int default 0,  /* 글 조회수 누적 */
	good int default 0,  /* 해당글의 '좋아요' 클릭수 누적 */
	wDate datetime default now(),  /* 글 올린 날짜 */
	claim char(2) default 'NO', /* 신고글 유무(신고당한글:OK, 정상글:'NO') */
	primary key(idx),
	foreign key(mid) references member(mid)
);
desc board;
-- drop table;
select * from board;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','공개 게시판입니다. 많이 사랑해주세요',
'192.168.50.20',default,default,default,default,default);



