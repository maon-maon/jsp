show tables;

create table memberMessage (
  idx  int not null auto_increment,	/* 메세지 고유번호 */
  senderId varchar(30) not null,		/* 보내는 사람 */
  receiverId varchar(30) not null,	/* 받는사람 */
  content		 text  not null,				/* 메세지 내용 */
  msgDate		 datetime default now(),/* 메세지 보낸 날짜 */  
  primary key(idx),
  foreign key(senderId) references member(mid) on delete cascade,
  foreign key(receiverId) references member(mid) on delete cascade
);
desc memberMessage;
-- drop table memberMessage;

select * from memberMessage;




