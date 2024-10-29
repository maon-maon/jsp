show tables;

create table member (
	idx		    int not null auto_increment, /* 회원 고유번호*/
	mid 			varchar(30) not null,		  /* 회원 아이디(중복불허=유니큐 키)*/
	pwd 			varchar(100) not null,		/* 회원 비밀번호(SHA256 암호화처리)*/ /* 암호화처리하면 몇 글자가 들어갈지 알수없음*/
	nickName	varchar(30) not null,			/* 회원 닉네임(중복불허/수정가능)*/
	name			varchar(30) not null,			/* 회원 성명(중복허용)*/
	gender 		char(2) default '여자',			/* 회원 성별*/
	birthday datetime default now(),	 	/* 회원 생일*/
	tel 			varchar(15),							/* 전화번호 : 010-1234-5678*/
	address 	varchar(100),							/* 주소(우편번호:다음 API 활용)*/
	email 		varchar(60) not null,			/* 이메일(아이디/비밀번호 분실시 사용) - 형식체크 필수(유효성검사)*/
	content   text,											/* 자기소개*/
	photo 		varchar(100) default 'noimage.jpg', /* 회원 사진*/
	userInfo  char(3) default '공개',  		/* 회원의 정보 공개유무(공개/비공개)*/  /*char(3):고정길이. 회원정보 숨김 처리*/
	userDel 	char(2) default 'NO',		 	/* 회원 탈퇴 신청 여부(NO:현재 활동중, OK:탈퇴신청)*/
	level 		int default	1,						/* 회원 등급(0:관리자, 1:준회원, 2:정회원, 3:우수회원), (4:운영자), 99:탈퇴신청회원*/	
	point 		int default 100,					/* 회원 누적포인트(최초 가입 포인트 100지급, 1회 방문시 10포인트 증가, 1일 최대 50포인트까지 허용, 물건구매시 100원당 1포인트 증가)*/
	visitCnt  int default 0,						/* 총 방문 횟수*/
	todayCnt  int default 0,						/* 오늘 방문 카운트*/
	startDate datetime default now(), 	/* 최초 가입일*/
	lastDate  datetime default now(),		/* 마지막 접속일(탈퇴시는 탈퇴한 날짜)*/
	primary key(idx),
	unique key(mid)
);
desc member;
-- drop table member;

select * from member;

insert into member values(default,'admin','asdf1234','관리맨','관리자','남자',default,'010-1234-5678','28575 충북 청주시 서원구 사직대로 109, 4층','admin@kakao.com','관리자입니다.',default,default,default,default,default,default,default,default,default);

-- delete from member where idx = 2;

alter table member auto_increment = 10;


