show tables;

/* 신고 테이블 (claim)*/
create table claim(
	idx int not null auto_increment,/* 신고테이블 고유번호 */
	part varchar(15) not null,    /* 신고게시판분류(게시판:board, 자료실:pds, 방명록:guest) */
	partIdx int not null,				 	/* 신고분류항목 글의 고유번호 */
	claimMid varchar(30) not null, /* 신고자 아이디*/
	claimContent text not null,  	/* 신고사유*/
	claimDate datetime default now(), /* 신고 날짜*/
	primary key(idx)
);
desc claim;
--drop table claim;

select * from claim;

insert into claim values(default, 'board', 22, 'etom', '도배,스팸', default);

select c.*,b.title,b.nickName, b.mid from claim c, board b where c.partIdx=b.idx;
/* c의 partIdx컬럼과 b의 idx컬럼을 조인 , c.*:c의 내용 다 봄 */

select c.*,b.title as title,b.nickName as nickName, b.mid as mid from claim c, board b where c.partIdx=b.idx;
/* as로 변수를 주면 vo에서 필드로 등록할 수 있음= vo에서 한 덩어리로 가지고 다닐 수 있음*/


