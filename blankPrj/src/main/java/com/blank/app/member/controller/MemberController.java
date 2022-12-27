package com.blank.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.member.service.MailSendService;
import com.blank.app.member.service.MemberService;
import com.blank.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("member")
@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MailSendService mailService;
	
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
		
		log.warn("화면에서 받은로그인 정보 "+vo);
		
		MemberVo loginMember = service.login(vo);
		
		log.warn("로그인멤버~ "+loginMember);
		
		if(loginMember == null) {
			
			log.warn("로그인 실패입니다.");
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
	
	
	//아이디 찾기 화면
	@GetMapping("findId")
	public String findId() {
		return "member/findId";
	}
	
	//비밀번호 찾기  화면 
	@GetMapping("findPwd")
	public String findPwd() {
		return "member/findPwd";
	}
	
	//임시비밀번호 전송 
	@ResponseBody
	@PostMapping("tempPwd")
	public String tempPwd(String email) {
		
		System.out.println(email);
		
		int result = service.doubleCheckByEmail(email);
		//이메일이 있으면 1 없으면 0 
		
		System.out.println("받은 데이터~ "+result);
		
		if(result != 1) {
			return result + ""; //없는 이메일 이라고 결과가 나옴 
		}
		
		String num = mailService.joinEmail(email); // 임시비밀번호 메일로 보냄 
		
		MemberVo vo = new MemberVo(email, num);
		
		int updateResult = service.updatePwd(vo);
		
		return updateResult+""; // ddltkdgka 
		
	}
	
	//마이페이지 화면 / 개인정보 변경 
	@GetMapping("mypage/editprofile")
	public String mypageEditProfile(HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		log.debug("넘어오나요?"+loginMember);
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
