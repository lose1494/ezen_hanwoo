-- 회사홈피 db 만들기
-- 회원가입, 로그인, 로그아웃, 아이디 찾기, 
-- 비밀번호 찾기, 아이디 중복확인

drop table company_member;
create table company_member(
    member_idx       number(4) primary key,
    member_id      varchar2(20),
    member_pw     varchar2(20),
    member_name   varchar2(20),
    member_email   varchar2(100),
    member_email_receive   number(1),	--0: 비수신 1: 수신
    member_pw_question   number(4),
    member_pw_answer   varchar2(100),
    member_gender   varchar2(10), -- male, female
    member_birth_date      date,
    member_join_date      date default sysdate
);

drop sequence company_member_seq;
create sequence company_member_seq;

insert into company_member(member_idx, member_id, member_pw, member_name, member_email, member_email_receive, member_pw_question, member_pw_answer, member_gender, member_birth_date, member_join_date) 
values (company_member_seq.nextval, 'hong', '1234', '홍길동', 'test@gmail.com', 0,0,0,'male','2000/01/01', sysdate);

-- 공지사항,홍보자료,채용정보, 
--FAQ(자주묻는질문),1:1문의, 묻고답하기(비밀글),   
drop table company_notice;
create table company_notice(
    notice_idx      number(4) primary key,
    notice_title    varchar2(100),
    notice_content  varchar2(2000),
    notice_member_id     varchar2(20), -- admin
    notice_date     date default sysdate
);

drop sequence company_notice_seq;
create sequence company_notice_seq;   

-- 홍보자료(뉴스)
drop table company_news;
create table company_news(
    news_idx      number(4) primary key,
    news_title    varchar2(100),
    news_content  varchar2(2000),
    news_member_id     varchar2(20),
    news_date     date default sysdate
);

drop sequence company_news_seq;
create sequence company_news_seq;      
   
-- 채용정보   
drop table company_job;
create table company_job(
    job_idx      number(4) primary key,
    job_title    varchar2(100),
    job_content  varchar2(2000),
    job_member_id     varchar2(20),
    job_date     date default sysdate
);

drop sequence company_job_seq;
create sequence company_job_seq;
   
drop table company_faq;
create table company_faq(
    faq_idx      number(4) primary key,
    faq_title    varchar2(100),
    faq_content  varchar2(2000)
);

drop sequence company_faq_seq;
create sequence company_faq_seq;
   
-- 1:1문의
drop table company_one2one;
create table company_one2one(
    one2one_idx      number(4) primary key,
    one2one_name     varchar2(20), -- 고객이름
    one2one_phone    varchar2(20), 
    one2one_email     varchar2(100),
    one2one_address   varchar2(200),
    one2one_title    varchar2(100),
    one2one_content  varchar2(2000),
    one2one_date     date default sysdate
);

drop sequence company_one2one_seq;
create sequence company_one2one_seq;

-- 묻고답하기(비밀글)
drop table company_qna;
create table company_qna(
    qna_idx      number(4) primary key,
    qna_name     varchar2(20),
    qna_pw       varchar2(20),
    qna_title    varchar2(100),
    qna_content  varchar2(2000),
    qna_date     date default sysdate
);
drop sequence company_qna_seq;
create sequence company_qna_seq;