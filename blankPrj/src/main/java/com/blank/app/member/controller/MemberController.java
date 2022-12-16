package com.blank.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("member")
@Controller
public class MemberController {
	
	//회원가입화면 
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	//로그인 화면 
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	
	//마이페이지 화면
	@GetMapping("mypage/editProfile")
	public String mypageEditProfile() {
		return "member/mypage/editProfile";
	}
	
	//마이페이지 결제수단 / 배송지 화면
	@GetMapping("mypage/payAddr")
	public String mypagePayAddr() {
		return "member/mypage/payAddr";
	}
	
	//마이페이지 결제수단 / 배송지 화면
	@GetMapping("mypage/payProject")
	public String mypagePayProject() {
		return "member/mypage/payProject";
	}
	
	//마이페이지 결제수단 / 배송지 화면
		@GetMapping("mypage/likeProject")
		public String mypageLikeProject() {
			return "member/mypage/likeProject";
		}
	
}
