--회원
drop table ezen_users;
create table ezen_users(
    users_idx       number(4) primary key,
    users_id      varchar2(20) UNIQUE,
    users_pw     varchar2(20),
    users_name   varchar2(20),
    users_email   varchar2(100),
    users_email_receive   number(1),	--0: 비수신 1: 수신
    users_phone         varchar2(20),
    users_phone_receive   number(1),	--0: 비수신 1: 수신
    users_birth_date      date,
    users_address1 varchar(20),
    users_address2 varchar(100),
    users_address3 varchar(100),
    users_address varchar2(100),
    users_joindate date default sysdate,
    users_point    number(10)
);

drop sequence ezen_users_seq;
create sequence ezen_users_seq;

insert into ezen_users(users_idx,users_id,users_pw,users_name,users_email,users_phone,users_birth_date,users_point,users_address,users_joindate )
values(ezen_users_seq.nextval, 'admin',1111,'관리자','admin@admin.com','010-0000-0000', '1993-11-02', '2000', '경기도 의정부시 민락동', TO_CHAR(SYSDATE,'YYYY-MM-DD') );
insert into ezen_users(users_idx,users_id,users_pw,users_name,users_email,users_phone,users_birth_date,users_point,users_address,users_joindate )
values(ezen_users_seq.nextval, 'test',1111,'테스트','test@test.com','010-0000-0000', '1993-11-02', '2000', '서울특별시 노원구 월계동', TO_CHAR(SYSDATE,'YYYY-MM-DD') );

--상품
drop table product;
create table product(
    product_idx number(4) primary key,
    product_name varchar2(400),
    product_image_ex clob,
    product_image clob,
    product_price varchar2(200),
    product_category varchar2(200),
    product_gram varchar2(400)
);
drop sequence product_seq;
create sequence product_seq;
insert into product
values ( product_seq.nextval, '한우 [1++No.9]등심',  'https://via.placeholder.com/700x1200',  '/img/product/등심3.png', '36,000', '구이용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]치마살',  'https://via.placeholder.com/700x1200', '/img/product/치마3.png', '54,000', '구이용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]살치살', 'https://via.placeholder.com/700x1200',  '/img/product/살치2.png', '60,000', '구이용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]제비추리', 'https://via.placeholder.com/700x1200',  '/img/product/제비추리2.png', '45,000', '구이용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]안심', 'https://via.placeholder.com/700x1200',  '/img/product/안심2.png', '54,000', '구이용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]채끝', 'https://via.placeholder.com/700x1200',  '/img/product/채끝2.png', '42,000', '구이용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]안창살',  'https://via.placeholder.com/700x1200', '/img/product/안창살2.png', '60,000', '구이용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]양지',  'https://via.placeholder.com/700x1200', '/img/product/양지2.png', '18,000', '국거리', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]사태',  'https://via.placeholder.com/700x1200', '/img/product/사태2.png', '13,500', '국거리', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]장조림', 'https://via.placeholder.com/700x1200',  '/img/product/홍두깨2.png', '15,000', '조리용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]불고기', 'https://via.placeholder.com/700x1200',  '/img/product/불고기2.png', '15,000', '조리용', '300g');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]육전', 'https://via.placeholder.com/700x1200',  '/img/product/육전2.png', '15,000', '조리용', '300g');
insert into product
values ( product_seq.nextval, '한우 조리용 세트', 'https://via.placeholder.com/700x1200',  '/img/product/13만원세트.png', '130,000', '선물세트', '상세페이지 참조');
insert into product
values ( product_seq.nextval, '한우 구이용 세트', 'https://via.placeholder.com/700x1200',  '/img/product/15만원세트.png', '150,000', '선물세트', '상세페이지 참조');
insert into product
values ( product_seq.nextval, '한우 구이용 세트', 'https://via.placeholder.com/700x1200',  '/img/product/28만원세트.png', '280,000', '선물세트', '상세페이지 참조');
insert into product
values ( product_seq.nextval, '한우 특수부위 세트', 'https://via.placeholder.com/700x1200',  '/img/product/40만원세트.png', '400,000', '선물세트', '상세페이지 참조');
commit;

--상품 문의
drop table product_qna;
create table product_qna(
    qna_idx number(4) primary key,
    qna_id varchar2(20),
    qna_title varchar2(60),
    qna_content varchar2(300),
    qna_date date,
    qna_secret   number(1), --0: 비밀글 설정안함 1: 비밀글 설정
    qna_pw varchar2(20),
    qna_status varchar2(20),
    product_idx number(4)
);
drop sequence product_qna_seq;
create sequence product_qna_seq;

--상품 문의 답변
drop table product_qna_reply;
create table product_qna_reply(
    reply_idx number(4) primary key,
    reply_id varchar2(20),
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
    review_id varchar2(20),
    review_title varchar2(60),
    review_content varchar2(300),
    review_image varchar2(100),
    review_date date,
    review_star_rating number(4),
    product_idx number(4)
);
drop sequence product_review_seq;
create sequence product_review_seq;

drop table review_star;
create table review_star(
    star_score number(1) primary key
);
insert into review_star values(1);
insert into review_star values(2);
insert into review_star values(3);
insert into review_star values(4);
insert into review_star values(5);

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
    notice_title varchar2(200),
    notice_content varchar2(300),
    notice_date date,
    notice_img clob,
    notice_hit number(4) DEFAULT 0
);

drop sequence Notice_seq;
create sequence Notice_seq;
--1:1문의
drop table one2one;
create table one2one(
    one2one_idx number(4) primary key,
    one2one_id varchar2(20),
    one2one_title varchar2(20),
    one2one_content varchar2(300),
    one2one_image varchar2(60),
    one2one_email varchar2(20),
    one2one_phone varchar2(20),
    one2one_date date,
    one2one_status varchar(20)
);
drop sequence one2one_seq;
create sequence one2one_seq;

--1:1문의 답변
drop table one2one_answer;
create table one2one_answer(
    answer_idx number(4) primary key,
    answer_id varchar2(20),
    answer_content varchar2(300),
    answer_date date,
    one2one_idx number(4) unique
);
drop sequence one2one_answer_seq;
create sequence one2one_answer_seq;

--주문
drop table orderlist;
create table orderlist(
order_idx number(4) primary key,
order_no varchar2(40),
users_id varchar2(20),
order_total_price varchar2(20),
order_comment varchar2(100),
order_product_name varchar2(40),
order_date date,
order_recipient varchar2(20),
order_address1 varchar(20),
order_address2 varchar(100),
order_address3 varchar(100),
order_phone varchar2(20),
order_usepoint varchar2(20)
);
drop sequence orderlist_seq;
create sequence orderlist_seq;

--주문 상세
drop table orderDetail;
create table orderDetail(
detail_idx number(4) primary key,
order_no varchar2(40),
product_idx number(4),
product_count number(2),
product_price varchar2(20),
pay_method varchar2(20)
);
select * from orderDetail;
select * from orderlist;
drop sequence orderDetail_seq;
create sequence orderDetail_seq;

--장바구니
drop table cart;
create table cart(
cart_idx number(4) primary key,
users_id varchar(20),
cart_product_name varchar(40),
product_idx number(4),
cart_count number(4),
cart_check number(1)
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

--적립금
drop table point;
create table point(
point_idx number(4) primary key,
point_users_id varchar(20),
point_start_date date,
point_point number(8),
point_end_date date,
point_content varchar(60)
);
drop sequence point_seq;
create sequence point_seq;
insert into point
values( point_seq.nextval, 'hong', sysdate, +3000, sysdate+365, '회원가입');

commit;
