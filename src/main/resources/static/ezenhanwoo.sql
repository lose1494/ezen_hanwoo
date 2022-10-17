--È¸¿ø
drop table ezen_users;
create table ezen_users(
    users_idx       number(4) UNIQUE,
    users_id      varchar2(20) primary key,
    users_pw     varchar2(20),
    users_name   varchar2(20),
    users_email   varchar2(100),
    users_email_receive   number(1),	--0: ºñ¼ö½Å 1: ¼ö½Å
    users_phone         varchar2(20),
    users_phone_receive   number(1),	--0: ºñ¼ö½Å 1: ¼ö½Å
    users_birth_date      date,
    users_address1 varchar(20),
    users_address2 varchar(100),
    users_address3 varchar(100),
    users_address varchar2(100),
    users_joindate date default sysdate,
    users_point    varchar2(20)
);
--create table ezen_users(
--    users_idx       number(4) not null,
--    users_id      varchar2(20) not null,
--    users_pw     varchar2(20) not null,
--    users_name   varchar2(20) not null,
--    users_email   varchar2(100) null,
--    users_email_receive   number(1) null,	--0: ë¹„ìˆ˜ì‹  1: ìˆ˜ì‹ 
--    users_phone         varchar2(20) null,
--    users_phone_receive   number(1) null,	--0: ë¹„ìˆ˜ì‹  1: ìˆ˜ì‹ 
--    users_birth_date      date null,
--    users_address varchar(20) null,
--    users_address varchar2(100) null,
--    users_joindate date default sysdate null,
--    users_point    varchar2(20) null,
--    
--    CONSTRAINT ezen_users_pk PRIMARY KEY (users_id)
--);

drop sequence ezen_users_seq;
create sequence ezen_users_seq;
INSERT INTO ezen_users(users_idx, users_id, users_pw, users_name, users_email, users_email_receive, users_phone, users_phone_receive, users_birth_date)
VALUES (ezen_users_seq.nextval, 'hong', '1234', 'È«±æµ¿', 'test1@gmail.com', 0, '01011111111', 0, '2000-01-01');
insert into ezen_users(users_idx,users_id,users_pw,users_name,users_email,users_phone,users_birth_date,users_point,users_address,users_joindate )
values(ezen_users_seq.nextval, 'remi6513',1234,'ÃÖÀÌ¾È','remi6513@naver.com','010-5045-5054', '1993-11-02', '2000', '°æ±âµµ ÀÇÁ¤ºÎ½Ã ¹Î¶ôµ¿', TO_CHAR(SYSDATE,'YYYY-MM-DD') );

INSERT INTO ezen_users(users_idx, users_id, users_pw, users_name)
VALUES (ezen_users_seq.nextval, 'kim', '1515', 'Å×½ºÆ®');

select * from ezen_users;

commit;
--»óÇ°
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
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]µî½É', '/img/product/µî½É3.png', '36,000', '±¸ÀÌ¿ë', '300g', 'https://via.placeholder.com/700x1200');

insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]Ä¡¸¶»ì', '/img/product/Ä¡¸¶3.png', '54,000', '±¸ÀÌ¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]»ìÄ¡»ì', '/img/product/»ìÄ¡2.png', '60,000', '±¸ÀÌ¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]Á¦ºñÃß¸®', '/img/product/Á¦ºñÃß¸®2.png', '45,000', '±¸ÀÌ¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]¾È½É', '/img/product/¾È½É2.png', '54,000', '±¸ÀÌ¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]Ã¤³¡', '/img/product/Ã¤³¡2.png', '42,000', '±¸ÀÌ¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]¾ÈÃ¢»ì', '/img/product/¾ÈÃ¢»ì2.png', '60,000', '±¸ÀÌ¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]¾çÁö', '/img/product/¾çÁö2.png', '18,000', '±¹°Å¸®', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]»çÅÂ', '/img/product/»çÅÂ2.png', '13,500', '±¹°Å¸®', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]ÀåÁ¶¸²', '/img/product/È«µÎ±ú2.png', '15,000', 'Á¶¸®¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]ºÒ°í±â', '/img/product/ºÒ°í±â2.png', '15,000', 'Á¶¸®¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì [1++No.9]À°Àü', '/img/product/À°Àü2.png', '15,000', 'Á¶¸®¿ë', '300g', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì Á¶¸®¿ë ¼¼Æ®', '/img/product/13¸¸¿ø¼¼Æ®.png', '130,000', '¼±¹°¼¼Æ®', '»ó¼¼ÆäÀÌÁö ÂüÁ¶', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì ±¸ÀÌ¿ë ¼¼Æ®', '/img/product/15¸¸¿ø¼¼Æ®.png', '150,000', '¼±¹°¼¼Æ®', '»ó¼¼ÆäÀÌÁö ÂüÁ¶', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì ±¸ÀÌ¿ë ¼¼Æ®', '/img/product/28¸¸¿ø¼¼Æ®.png', '280,000', '¼±¹°¼¼Æ®', '»ó¼¼ÆäÀÌÁö ÂüÁ¶', 'https://via.placeholder.com/700x1200');
insert into product
values ( product_seq.nextval, 'ÇÑ¿ì Æ¯¼öºÎÀ§ ¼¼Æ®', '/img/product/40¸¸¿ø¼¼Æ®.png', '400,000', '¼±¹°¼¼Æ®', '»ó¼¼ÆäÀÌÁö ÂüÁ¶', 'https://via.placeholder.com/700x1200');
commit;
<<<<<<< HEAD

--»óÇ° ¹®ÀÇ
=======
insert into product
values ( product_seq.nextval, 'í…ŒìŠ¤íŠ¸', 'í…ŒìŠ¤íŠ¸', 'í…ŒìŠ¤íŠ¸', 'í…ŒìŠ¤íŠ¸', 'ìƒì„¸í˜ì´ì§€ ì°¸ì¡°', 'í…ŒìŠ¤íŠ¸');
commit;
--ìƒí’ˆ ë¬¸ì˜
>>>>>>> 470d008378cd75cc924be180b2c66cc5d034d235
drop table product_qna;
create table product_qna(
    qna_idx number(4) primary key,
    qna_id varchar2(20),
    qna_title varchar2(60),
    qna_content varchar2(300),
    qna_date date,
    qna_secret   number(1), --0: ºñ¹Ğ±Û ¼³Á¤¾ÈÇÔ 1: ºñ¹Ğ±Û ¼³Á¤
    qna_pw varchar2(20),
    qna_status varchar2(20),
    product_idx number(4)
);

drop sequence product_qna_seq;
create sequence product_qna_seq;

insert into product_qna
values( product_qna_seq.nextval, 'hong', '¾ğÁ¦Âë ¹è¼ÛµÇ³ª¿ä', '¹è¼Û ¾ğÁ¦Âë µÇ³ª¿ä??', sysdate, 1, '1234', '´äº¯´ë±âÁß', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', 'Å×½ºÆ®¿ë', '¹®ÀÇ Å×½ºÆ®', sysdate, 0, '´äº¯´ë±âÁß', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', 'Å×½ºÆ®¿ë1', '¹®ÀÇ Å×½ºÆ®1', sysdate, 0, '´äº¯´ë±âÁß', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', 'Å×½ºÆ®¿ë2', '¹®ÀÇ Å×½ºÆ®2', sysdate, 0, '´äº¯´ë±âÁß', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', 'Å×½ºÆ®¿ë3', '¹®ÀÇ Å×½ºÆ®3', sysdate, 0, '´äº¯´ë±âÁß', 1);
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', 'Å×½ºÆ®¿ë4', '¹®ÀÇ Å×½ºÆ®4', sysdate, 0, '´äº¯´ë±âÁß', 1);

<<<<<<< HEAD
--»óÇ° ¹®ÀÇ ´äº¯
=======
insert into product_qna(qna_idx, qna_id, qna_title, qna_content, qna_date, qna_secret, qna_status, product_idx)
values( product_qna_seq.nextval, 'hong', 'í…ŒìŠ¤íŠ¸ìš©4', 'ë¬¸ì˜ í…ŒìŠ¤íŠ¸4',TO_CHAR(SYSDATE,'YYYY-MM-DD') , 0, 'ë‹µë³€ëŒ€ê¸°ì¤‘', 1);
 
 commit;
select * from product_qna;
--ìƒí’ˆ ë¬¸ì˜ ë‹µë³€
>>>>>>> 470d008378cd75cc924be180b2c66cc5d034d235
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

--»óÇ° ¸®ºä
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
<<<<<<< HEAD
values(product_review_seq.nextval, 'hong', '¸ÀÀÖ°Ô Àß ¸Ô¾ú½À´Ï´Ù!!', '¸®ºä ³»¿ë Å×½ºÆ® È­¸é¿¡ ¾î¶»°Ô º¸ÀÌ³ª', sysdate, 5, 1);
=======
values(product_review_seq.nextval, 'hong', 'ë§›ìˆê²Œ ì˜ ë¨¹ì—ˆìŠµë‹ˆë‹¤!!', 'ë¦¬ë·° ë‚´ìš© í…ŒìŠ¤íŠ¸ í™”ë©´ì— ì–´ë–»ê²Œ ë³´ì´ë‚˜', sysdate, 5, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', 'í…ŒìŠ¤íŠ¸1', 'ë¦¬ë·° ë‚´ìš© í…ŒìŠ¤íŠ¸1', sysdate, 4, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', 'í…ŒìŠ¤íŠ¸2', 'ë¦¬ë·° ë‚´ìš© í…ŒìŠ¤íŠ¸2', sysdate, 3, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', 'í…ŒìŠ¤íŠ¸3', 'ë¦¬ë·° ë‚´ìš© í…ŒìŠ¤íŠ¸3', sysdate, 2, 1);
insert into product_review(review_idx, review_id, review_title, review_content, review_date, review_star_rating, product_idx)
values(product_review_seq.nextval, 'hong', 'í…ŒìŠ¤íŠ¸4', 'ë¦¬ë·° ë‚´ìš© í…ŒìŠ¤íŠ¸4', sysdate, 1, 1);

drop table review_star;
create table review_star(
    star_score number(1) primary key
);

insert into review_star values(1);
insert into review_star values(2);
insert into review_star values(3);
insert into review_star values(4);
insert into review_star values(5);
>>>>>>> 470d008378cd75cc924be180b2c66cc5d034d235

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
--°øÁö»çÇ×
drop table Notice;
create table Notice(
    notice_idx number(4) primary key,
    notice_name varchar2(20),
    notice_title varchar2(20),
    notice_content varchar2(300),
    notice_date date,
    notice_img clob,
    notice_hit number(4) DEFAULT 0
);

insert into Notice (notice_idx,notice_name,notice_title,notice_content,notice_date)
values ( notice_seq.nextval, 'ê´€ë¦¬ì', 'ì œëª©ì…ë‹ˆë‹¤.', 'ë‚´ìš©ì…ë‹ˆë‹¤.' , TO_CHAR(SYSDATE,'YYYY-MM-DD'));

commit;
drop sequence Notice_seq;
create sequence Notice_seq;
--1:1¹®ÀÇ
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
--1:1¹®ÀÇ ´äº¯
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
--ÁÖ¹®
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
--ÁÖ¹® »ó¼¼
drop table orderDetail;
create table orderDetail(
detail_idx number(4) primary key,
order_idx number(4),
prouct_idx number(4)
);
drop sequence orderDetail_seq;
create sequence orderDetail_seq;

--Àå¹Ù±¸´Ï
drop table cart;
create table cart(
cart_idx number(4) ,
users_id varchar(20),
cart_product_name varchar(40),
product_idx number(4),
cart_count number(4),
    CONSTRAINT cart_pk PRIMARY KEY(users_id, product_idx)
);
select * from cart;
drop sequence cart_seq;
create sequence cart_seq;
--°ü½ÉÇ°¸ñ
drop table wishlist;
create table wishlist(
list_idx number(4) primary key,
list_users_id varchar(20),
list_product_name varchar(20),
list_count number(4)
);
drop sequence wishlist_seq;
create sequence wishlist_seq;
--Àû¸³±İ
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
values( point_seq.nextval, 'hong', sysdate, +5000, sysdate+365, 'È¸¿ø°¡ÀÔ');
insert into point
values( point_seq.nextval, 'hong', sysdate, +500, sysdate+365, 'Å×½ºÆ®');
insert into point
values( point_seq.nextval, 'hong', sysdate, +100, sysdate+365, 'Å×½ºÆ®1');
insert into point
values( point_seq.nextval, 'hong', sysdate, +200, sysdate+365, 'Å×½ºÆ®2');
insert into point
values( point_seq.nextval, 'hong', sysdate, +300, sysdate+365, 'Å×½ºÆ®3');
insert into point
values( point_seq.nextval, 'hong', sysdate, +400, sysdate+365, 'Å×½ºÆ®4');

commit;
