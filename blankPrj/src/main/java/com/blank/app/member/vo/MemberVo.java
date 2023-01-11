package com.blank.app.member.vo;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVo {

	private String no;
	private String email;
	private String pwd1;
	private String phone;
	private String gender;
	private String nick;
	private String status;
	private String enrollDate;
	private String alarm;
	private String point;
	private String account;
	private String bank;
	private String depositor;
	private String quitNo;
	private String quitVar;
	private String info;
	private String cntPrj; //사이드바에 필요할 수도 있어서 
	
	private String profile; 
	
	public void encode(BCryptPasswordEncoder enc) {
		this.pwd1 = enc.encode(pwd1);
	}

	public MemberVo(String email, String pwd1) {
		super();
		this.email = email;
		this.pwd1 = pwd1;
	}
	
	public MemberVo() {
		
	}
	
	
}
