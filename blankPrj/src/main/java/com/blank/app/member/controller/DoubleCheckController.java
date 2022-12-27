package com.blank.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blank.app.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("member")
public class DoubleCheckController {

	
	@Autowired
	public MemberService service;
	
	
	@PostMapping("doubleCheckByEmail")
	public String doubleCheckbyEmail(String email) {
		
		System.out.println(email);
		int result = service.doubleCheckByEmail(email);
		
		return result+"";
	}
	
	@PostMapping("doubleCheckByNick")
	public String doubleCheckbyNick(String nick) {
		
		System.out.println(nick);
		int result = service.doubleCheckByNick(nick);
		
		return result+"";
	}
	
	@PostMapping("doubleCheckByPhone")
	public String doubleCheckbyPhone(String phone) {
		
		System.out.println(phone);
		int result = service.doubleCheckByNick(phone);
		
		return result+"";
	}
	
}
