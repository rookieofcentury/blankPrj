package com.blank.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blank.app.member.service.MemberService;
import com.blank.app.member.vo.MemberVo;

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
	
	//이메일 중복 확인 후 없으면 이메일 업데이트 있으면 중복된 이메일이라고 알림 
	@PostMapping("/updateEmail")
	public String updateEmailByNo(String email, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		String userNo = loginMember.getNo();
		
		//로그인된 유저넘버와 새로운 이메일 Vo 만들어줌 
		MemberVo vo = new MemberVo();
		vo.setNo(userNo);
		vo.setEmail(email);
		
		
		int doubleCheckResult = service.doubleCheckByEmail(email);
		
		//이메일 중복있다.
		if(doubleCheckResult == 1) {
			//중복이 있으면 리턴 
			return 0+"";
		}
		//없으면 이메일 업데이트 
		int updateResult = service.updateEmailByNo(vo);
		
		//이메일 업데이트 했으니 세션을 갈아주자 
		if(updateResult == 1) {
			loginMember.setEmail(email);
			session.setAttribute("loginmember", loginMember);
			log.warn("############세션 업데이트 된 데이터 "+loginMember);
			return updateResult+"";
		}
		//업데이트 실패하면
		return 2 + "";
	}
}
