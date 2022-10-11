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
    users_point    varchar2(20)
);
drop sequence ezen_users_seq;
create sequence ezen_users_seq;
INSERT INTO ezen_users(users_idx, users_id, users_pw, users_name, users_email, users_email_receive, users_phone, users_phone_receive, users_birth_date)
VALUES (ezen_users_seq.nextval, 'hong', '1234', '홍길동', 'test1@gmail.com', 0, '01011111111', 0, '2000-01-01');
insert into ezen_users(users_idx,users_id,users_pw,users_name,users_email,users_phone,users_birth_date,users_point,users_address,users_joindate )
values(ezen_users_seq.nextval, 'remi6513',1234,'최이안','remi6513@naver.com','010-5045-5054', '1993-11-02', '2000', '경기도 의정부시 민락동', TO_CHAR(SYSDATE,'YYYY-MM-DD') );

INSERT INTO ezen_users(users_idx, users_id, users_pw, users_name)
VALUES (ezen_users_seq.nextval, 'kim', '1515', '테스트');

select * from ezen_users;

commit;
--상품
drop table product;
create table product(
    product_idx number(4) primary key,
    product_name varchar2(40),
    product_image varchar2(40),
    product_price varchar2(20),
    product_category varchar2(20),
    product_gram varchar2(40),
    product_explanation varchar2(60)
);
drop sequence product_seq;
create sequence product_seq;
insert into product
values ( product_seq.nextval, '한우 [1++No.9]등심', '/img/product/등심3.png', '36,000', '구이용', '300g', 'https://via.placeholder.com/700x1200');

insert into product
values ( product_seq.nextval, '한우 [1++No.9]치마살', '/img/product/치마3.png', '54,000', '구이용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]살치살', '/img/product/살치2.png', '60,000', '구이용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]제비추리', '/img/product/제비추리2.png', '45,000', '구이용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]안심', '/img/product/안심2.png', '54,000', '구이용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]채끝', '/img/product/채끝2.png', '42,000', '구이용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]안창살', '/img/product/안창살2.png', '60,000', '구이용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]양지', '/img/product/양지2.png', '18,000', '국거리', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]사태', '/img/product/사태2.png', '13,500', '국거리', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]장조림', '/img/product/홍두깨2.png', '15,000', '조리용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]불고기', '/img/product/불고기2.png', '15,000', '조리용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 [1++No.9]육전', '/img/product/육전2.png', '15,000', '조리용', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 조리용 세트', '/img/product/13만원세트.png', '130,000', '선물세트', '상세페이지 참조', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 구이용 세트', '/img/product/15만원세트.png', '150,000', '선물세트', '상세페이지 참조', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 구이용 세트', '/img/product/28만원세트.png', '280,000', '선물세트', '상세페이지 참조', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, '한우 특수부위 세트', '/img/product/40만원세트.png', '400,000', '선물세트', '상세페이지 참조', 'https://via.placeholder.com/700x1200');
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

insert into product_qna
values( product_qna_seq.nextval, 'hong', '언제쯤 배송되나요', '배송 언제쯤 되나요??', sysdate, 1, '1234', '답변대기중', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', '테스트용', '문의 테스트', sysdate, 0, '답변대기중', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', '테스트용1', '문의 테스트1', sysdate, 0, '답변대기중', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', '테스트용2', '문의 테스트2', sysdate, 0, '답변대기중', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', '테스트용3', '문의 테스트3', sysdate, 0, '답변대기중', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', '테스트용4', '문의 테스트4', sysdate, 0, '답변대기중', 1);

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

insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', '맛있게 잘 먹었습니다!!', '리뷰 내용 테스트 화면에 어떻게 보이나', sysdate, 5, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', '테스트1', '리뷰 내용 테스트1', sysdate, 4, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', '테스트2', '리뷰 내용 테스트2', sysdate, 3, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', '테스트3', '리뷰 내용 테스트3', sysdate, 2, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', '테스트4', '리뷰 내용 테스트4', sysdate, 1, 1);

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
order_total_price number(4),
order_comment varchar2(100),
order_date date,
order_recipient varchar2(20),
order_address1 varchar(20),
order_address2 varchar(100),
order_address3 varchar(100),
order_phone number(20)
);
drop sequence orderlist_seq;
create sequence orderlist_seq;
--주문 상세
drop table orderDetail;
create table orderDetail(
detail_idx number(4) primary key,
order_idx number(4),
prouct_idx number(4)
);
drop sequence orderDetail_seq;
create sequence orderDetail_seq;
--장바구니
drop table cart;
create table cart(
cart_idx number(4) primary key,
cart_users_id varchar(20),
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
values( point_seq.nextval, 'hong', sysdate, +5000, sysdate+365, '회원가입');
insert into point
values( point_seq.nextval, 'hong', sysdate, +500, sysdate+365, '테스트');
insert into point
values( point_seq.nextval, 'hong', sysdate, +100, sysdate+365, '테스트1');
insert into point
values( point_seq.nextval, 'hong', sysdate, +200, sysdate+365, '테스트2');
insert into point
values( point_seq.nextval, 'hong', sysdate, +300, sysdate+365, '테스트3');
insert into point
values( point_seq.nextval, 'hong', sysdate, +400, sysdate+365, '테스트4');

commit;
