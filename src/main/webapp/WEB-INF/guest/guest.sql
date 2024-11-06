show tables;

create table guest (
	idx int not null auto_increment primary key, /* 방명록 고유번호*/
	name varchar(20) not null, 				/* 방명록 작성자 성명 */
	content text not null, 						/* 방명록 글 내용*/ /* text=메모리 제한 없는 글상자*/.
	email varchar(60),								/* 메일주소 */ /* 강제사항 아님= not null 안 씀*/
	homePage varchar(60),							/* 홈페이지주소(유투브, 블로그주소) */
	visitDate datetime default now(), /* 방문일자 */ /*입력요구하지 않음 시스템에서 가져옴*/
	hostIp varchar(30) not null 			/* 방문자의 접속 IP */ /* 필수입력 아님.입력요구하지 않음 서버에서 가져옴*/
);
desc guest;
drop table;

insert into guest values (default, '관리자', '방명록 서비스를 시작합니다.', 'green@gmail.com', 'blog.green.naver.com', default, '192.168.50.52'); 

select * from guest;

select datediff(visitDate, now()) as date_diff from guest order by date_diff desc;

select count(*) as newGuestCnt from guest where datediff(visitDate, now())=0;