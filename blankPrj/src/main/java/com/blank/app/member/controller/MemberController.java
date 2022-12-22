package com.blank.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blank.app.member.service.MemberService;
import com.blank.app.member.vo.MemberVo;

@RequestMapping("member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//진짜 회원가입!
	@PostMapping("join")
	public String join(MemberVo vo) {
		//확인을위한 주석!
		System.out.println(vo);
		int result = service.join(vo);
		//확인을위한 주석!
		System.out.println(result);
		if(result == 1) {
			return "member/login";
		}else {
			return "member/join";
		}
		
	}
	
	//진짜 로그인!
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		
		MemberVo loginMember = service.login(vo);
		
		if(loginMember == null) {
			return "member/login";
		}
		
		//확인을위한 주석!
		System.out.println(loginMember);
		session.setAttribute("loginMember", loginMember);
		
		return "home";
	}
	//로그아웃 
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
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
	
	//마이페이지 화면 / 개인정보 변경 
	@GetMapping("mypage/editprofile")
	public String mypageEditProfile() {
		return "member/mypage/editProfile";
	}
	
	//마이페이지 결제수단 / 배송지 화면
	@GetMapping("mypage/payAddr")
	public String mypagePayAddr() {
		return "member/mypage/payAddr";
	}
	
	//마이페이지 후원한 프로젝트 
	@GetMapping("mypage/payProject")
	public String mypagePayProject() {
		return "member/mypage/payProject";
	}
	
	//마이페이지 관심있는 프로젝트 
	@GetMapping("mypage/likeProject")
	public String mypageLikeProject() {
		return "member/mypage/likeProject";
	}
	
	//마이페이지 신고 / 문의 내역  
	@GetMapping("mypage/reportQ")
	public String mypageReportQ() {
		return "member/mypage/reportQ";
	}
	
}
