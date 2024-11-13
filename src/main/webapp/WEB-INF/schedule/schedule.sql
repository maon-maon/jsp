show tables;
/* 주간 스케줄은 스타트위크 라스트 필요함*/
create table schedule (
  idx   int not null auto_increment,	/* 스케줄관리 고유번호 */
  mid		varchar(20) not null,					/* 회원 아이디 */
  sDate datetime not null,						/* 일정이 있는날짜 */
  part  varchar(10) not null,					/* 일정분류(1.모임, 2.업무, 3.학습, 4.여행, 5.기타 */
  content text not null,							/* 일정 상세내역 */
  primary key(idx),
  foreign key(mid) references member(mid)
);
desc schedule;

select * from schedule;

insert into schedule values();


insert into schedule values (default, 'hkd1234', '2024-9-5', '학습', 'JSP 컨트롤러 학습'); /*데이터에 자동으로 0이 들어감 2024-09-05*/
insert into schedule values (default, 'hkd1234', '2024-11-10', '학습', '프로젝트 기획서 설계');
insert into schedule values (default, 'hkd1234', '2024-11-12', '업무', '자바 네트워크과정 설명회');
insert into schedule values (default, 'hkd1234', '2024-11-16', '모임', '초등학교 동창회');
insert into schedule values (default, 'kms1234', '2024-11-12', '학습', '프로젝트 기획서 설계시작');
insert into schedule values (default, 'hkd1234', '2024-11-20', '학습', '스케줄관리 편집처리');
insert into schedule values (default, 'kms1234', '2024-11-17', '모임', '백앤드과정 송년회');
insert into schedule values (default, 'hkd1234', '2024-11-22', '업무', '과정평가');
insert into schedule values (default, 'hkd1234', '2024-11-25', '학습', '프로젝트 발표');
insert into schedule values (default, 'hkd1234', '2024-11-30', '모임', '고등학교 동창회');
insert into schedule values (default, 'hkd1234', '2024-11-30', '모임', '대학교 동창회');
insert into schedule values (default, 'kms1234', '2024-11-24', '모임', '볼링 동호회');
insert into schedule values (default, 'hkd1234', '2024-11-30', '학습', '프로젝트 수정기획안 발표');
insert into schedule values (default, 'kms1234', '2024-11-30', '학습', '자바 평가');
insert into schedule values (default, 'kms1234', '2024-12-01', '여행', '겨울 여행');
insert into schedule values (default, 'hkd1234', '2024-12-02', '학습', '스프링 프로젝트 기획');
insert into schedule values (default, 'hkd1234', '2024-12-25', '모임', '크리스마스 모임');
insert into schedule values (default, 'kms1234', '2024-12-22', '모임', '가족 송년회');

select * from schedule order by idx desc;
select * from schedule where mid='hkd1234' and substring(sDate,1,10)='2024-11-12' order by idx desc;
-- select * from schedule where mid='hkd1234' and substring(sDate,1,10)='2024-12-2' order by idx desc; (검색불가)
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m-%d')='2024-12-02' order by idx desc;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m-%d')='2024-12-2' order by idx desc;

select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2024-09' order by idx desc;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2024-11' order by idx desc;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2024-11' order by sDate;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2024-11' order by sDate, part;
select *,count(*) from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2024-11' order by sDate, part;
select *,count(*) from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2024-11' group by sDate order by sDate, part;
select *,count(*) from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2024-11' group by sDate,part order by sDate, part;
select *,count(*) from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m-%d')='2024-11-30' group by sDate,part order by sDate, part;

/* group by : sum, avg, max,min직계함수와 같이 사용*/
