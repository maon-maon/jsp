show tables;
/*
 회원제: 준회원은 자료실의 목록검색만 가능(업로드/다운로드 불가),상세보기 불가
			 정회원은 자료실의 목록검색과 다운로드만 가능, 업로드불가
 */

create table pds (
 idx int not null auto_increment,	/* 자료실 고유번호 */
 mid varchar(30) not null,				/* 올린이 아이디 */
 nickName varchar(30) not null,		/* 올린이 닉네임 */
 fName varchar(200) not null,			/* 업로드시 원본 파일명 */
 fSName varchar(300) not null,		/* 실제 서버에 저장되는 파일명 */
 fSize int not null,  						/* 업로드 파일의 총 사이즈 */
 part varchar(30) not null,				/* 파일 분류(학습/여행/음식/기타) */
 title varchar(100) not null,			/* 업로드 파일의 간단한 제목*/
 content text,									  /* 업로드 파일의 상세 설명*/
 openSw varchar(3) default '공개', /* 파일 공개여부(공개/비공개)*/ 
 hostIp varchar(30) not null,			/* 업로드한 클라이언트 IP*/
 fDate datetime default now(),		/* 업로드 날짜*/ 
 downNum int default 0,						/* 파일 다운횟수 */
 primary key(idx),
 foreign key(mid) references member(mid) 
);
desc pds;
-- drop table pds;

select * from pds;

select * from pds order by idx desc;


create table review(
	idx int not null auto_increment, /* 리뷰 고유번호 */
	part varchar(30) not null,			/* 분야(게시판:board, 자료실:pds, ......)*/
	partIdx int not null,						/* 해당 분야의 고유번호:*/
	mid varchar(30) not null,				/* 리뷰 올린이 아이디 */
 	nickName varchar(30) not null,		/* 리뷰 올린이 닉네임 */
	content text,											/* 리뷰 내용*/
 	star int not null default 0,      /* 별점 부여 점수*/
	reviewDate datetime default now(), /* 리뷰 작성일 */
	primary key(idx),
	foreign key(mid) references member(mid) 
);
desc review;
-- drop table review;

select * from review;

select * from review order by idx desc;


/* 리뷰 댓글 달기 */
create table reviewReply(
	replyIdx int not null auto_increment, /* 리뷰 댓글의 고유번호 */
	reviewIdx int not null,								/* 원본글(부모:리뷰)의 고유번호*/
	replyMid varchar(30) not null,				/* 리뷰댓글 올린이 아이디 */
 	replyNickName varchar(30) not null,		/* 리뷰댓글 올린이 닉네임 */
	replyContent text,											/* 리뷰댓글 내용*/
	replyDate datetime default now(), /* 리뷰댓글 작성일 */
	primary key(replyIdx),
	foreign key(reviewIdx) references review(idx),
	foreign key(replyMid) references member(mid)
);
desc reviewReply;
-- drop table reviewReply;

select * from reviewReply;

