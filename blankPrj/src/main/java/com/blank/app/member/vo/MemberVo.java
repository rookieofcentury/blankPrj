package com.blank.app.member.vo;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVo {

	private String no;
	private String email;
	private String pwd;
	private String phone;
	private String gender;
	private String nick;
	private String addrA;
	private String addrB;
	private String addrC;
	private String status;
	private String enrollDate;
	private String alarm;
	private String point;
	private String account;
	private String bank;
	private String depositor;
	
	private MultipartFile profile; 
	
	public void encode(BCryptPasswordEncoder enc) {
		this.pwd = enc.encode(pwd);
	}
	
}
