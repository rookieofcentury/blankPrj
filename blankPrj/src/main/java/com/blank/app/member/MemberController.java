package com.blank.app.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("member")
@Controller
public class MemberController {

	//회원가입 화면
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	//로그인 화면
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	
	@GetMapping("mypage/editprofile")
	public String mypageEditProfile() {
		return "member/mypage/editProfile";
	}
	
	

	
	

}
