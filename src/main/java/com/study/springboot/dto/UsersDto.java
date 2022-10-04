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
	
	
}
