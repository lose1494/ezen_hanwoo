package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsersDto {
	private int users_idx;
	private String users_id;
	private String users_pw;
	private String users_name;
	private String users_email;
	private int users_email_receive;
	private String users_phone;
	private int users_phone_receive;
	private Date users_birth_date;
	private String users_address1;
	private String users_address2;
	private String users_address3;
	private String users_address;
	private Date users_joindate;
	private int users_point;
	
}
/*
 * users_idx number(4) primary key, 
 * users_id varchar2(20) UNIQUE, 
 * users_pw varchar2(20), 
 * users_name varchar2(20), 
 * users_email varchar2(100),
 * users_email_receive number(1), --0: 비수신 1: 수신 
 * users_phone varchar2(20),
 * users_phone_receive number(1), --0: 비수신 1: 수신 
 * users_birth_date date,
 * users_address1 varchar(20), 
 * users_address2 varchar(100), 
 * users_address3 varchar(100), 
 * users_address varchar2(100), 
 * users_joindate date default sysdate, 
 * users_point varchar2(20)
 */