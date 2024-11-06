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

select * from board order by idx desc;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','공개 게시판입니다. 많이 사랑해주세요',
'192.168.50.20',default,default,default,default,default);

select idx, mid, title, datediff(wDate ,now()) as date_diff from board order by idx desc;

select idx, mid, title, timestampdiff(hour, wDate ,now()) as time_diff from board order by idx desc;

-- 이전글 / 다음글 연습
select idx, title from board where idx < 26 order by idx desc limit 1;
select idx, title from board where idx > 26 order by idx  limit 1;

/* 댓글 테이블(boardReply) */ -- 댓글은 테이블 별도 필요
create table boardReply (
	idx int not null auto_increment,  /* 댓글 고유번호 */ 
	boardIdx int not null,						/* 원본글(부모글)의 고유 번호 - 왜리키 지정 */
	mid varchar(30) not null,					/* 댓글 작성자의 아이디 */
	nickName varchar(30) not null,		/* 댓글 작성자의 닉네임 */
	content text not null,						/* 댓글 내용 */
	hostIp varchar(50) not null,		  /* 댓글 작성자 IP */
	wDate datetime default now(),			/* 댓글 작성일 */
	primary key(idx),
	foreign key(boardIdx) references board(idx) on update cascade on delete cascade /*restrict:댓글 달리면 원본글 삭제 불가*/
);
desc boardReply;
-- drop table boardReply;

select * from boardReply order by idx;

insert into boardReply values(default, 60, 'hdk1234', '홍장군', '댓글 연습입니다.11', '192.168.50.52' ,default);
insert into boardReply values(default, 59, 'atom1234', '아톰맨', '댓글 연습입니다.22', '192.168.50.53' ,default);
insert into boardReply values(default, 58, 'dtom', '디톰맨', '댓글 연습입니다.33', '192.168.50.55' ,default);

/* 서브쿼리 : ()안에 적음*/
select * from board order by idx desc;
select b.*, r.content from board b, boardReply r where b.idx=r.boardIdx order by idx desc;
select b.*, (select count(idx) from boardReply where boardIdx=b.idx) from board b order by idx desc;


select count(*) as newBoardCnt from board where datediff(wDate, now()) = 0;


