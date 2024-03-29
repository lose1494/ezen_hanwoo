--회원
drop table ezen_users;
create table ezen_users(
    users_idx       number(4) primary key,
    users_id      varchar2(20),
    users_pw     varchar2(20),
    users_name   varchar2(20),
    users_email   varchar2(100),
    users_email_receive   number(1),	--0: 비수신 1: 수신
    users_phone         varchar2(20),
    users_phone_receive   number(1),	--0: 비수신 1: 수신
    users_birth_date      date,
    users_point    varchar2(20)
);

drop sequence ezen_users_seq;
create sequence ezen_users_seq;
--상품
drop table product;
create table product(
    product_idx number(4) primary key,
    product_name varchar2(20),
    product_price varchar2(20),
    product_sort varchar2(20),
    product_explanation varchar2(40),
    product_gram varchar2(20)
);
drop sequence product_seq;
create sequence product_seq;
--상품 문의
drop table product_qna;
create table product_qna(
    qna_idx number(4) primary key,
    qna_name varchar2(20),
    qna_title varchar2(20),
    qna_content varchar2(300),
    qna_date date,
    qna_secret   number(1), --0: 비밀글 설정안함 1: 비밀글 설정
    qna_pw varchar2(20),
    product_idx number(4),
    users_idx    number(4)
);
drop sequence product_qna_seq;
create sequence product_qna_seq;
--상품 문의 답변
drop table product_qna_reply;
create table product_qna_reply(
    reply_idx number(4) primary key,
    reply_name varchar2(20),
    reply_content varchar2(300),
    reply_date date,
    qna_idx number(4)
);
drop sequence product_qna_reply_seq;
create sequence product_qna_reply_seq;
--상품 리뷰
drop table product_review;
create table product_review(
    review_idx number(4) primary key,
    review_name varchar2(20),
    review_title varchar2(20),
    review_content varchar2(300),
    review_date date,
    review_star_rating number(4),
    product_idx number(4)
);
drop sequence product_review_seq;
create sequence product_review_seq;
--FAQ
drop table FAQ;
create table FAQ(
    faq_idx number(4) primary key,
    faq_title varchar2(40),
    faq_content varchar2(300),
    faq_type varchar2(40)
);
drop sequence FAQ_seq;
create sequence FAQ_seq;
--공지사항
drop table Notice;
create table Notice(
    notice_idx number(4) primary key,
    notice_name varchar2(20),
    notice_title varchar2(20),
    notice_content varchar2(300),
    notice_date date
);

INSERT INTO Notice
  (notice_idx, notice_name, notice_title, notice_content, notice_date)
VALUES
  (notice_seq.nextval, '관리자', '제목입니다.', '내용입니다.' , to_date(sysdate,'yyyy.mm.dd'));
  
  select * from user_sequences;
  select * from Notice;
drop sequence Notice_seq;
create sequence Notice_seq;
--1:1문의
create table one2one;
create table one2one(
    one2one_idx number(4) primary key,
    one2one_name varchar2(20),
    one2one_title varchar2(20),
    one2one_content varchar2(300),
    one2one_date date
);
drop sequence one2one_seq;
create sequence one2one_seq;
--1:1문의 답변
drop table one2one_answer;
create table one2one_answer(
    answer_idx number(4) primary key,
    answer_name varchar2(20),
    answer_title varchar2(20),
    answer_content varchar2(300),
    answer_date date,
    one2one_answer_idx number(4)
);
drop sequence one2one_answer_seq;
create sequence one2one_answer_seq;
--주문
drop table orderlist;
create table orderlist(
order_idx number(4) primary key,
order_no number(8),
order_users_id varchar2(20),
order_product_name varchar2(20),
order_total_price number(4),
order_comment varchar2(100),
order_date date,
order_address varchar(100),
order_phone number(20)
);
INSERT INTO Notice
  (order_idx, order_no, order_users_id, order_product_name, order_total_price,
   order_comment, order_date, order_address, order_phone)
VALUES
  (order_seq.nextval, '관리자', '제목입니다.', '내용입니다.' , to_date(sysdate,'yyyy.mm.dd'));
drop sequence order_seq;
create sequence order_seq;
--장바구니
drop table cart;
create table cart(
cart_idx number(4) primary key,
users_idx number(4),
cart_product_name varchar(20),
cart_count number(4)
);
drop sequence cart_seq;
create sequence cart_seq;
--관심품목
drop table wishlist;
create table wishlist(
list_idx number(4) primary key,
list_users_id varchar(20),
list_product_name varchar(20),
list_count number(4)
);
drop sequence wishlist_seq;
create sequence wishlist_seq;
commit;




