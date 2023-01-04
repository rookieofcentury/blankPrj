package com.blank.app.member.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.admin.vo.HelpVo;
import com.blank.app.member.service.MailSendService;
import com.blank.app.member.service.MemberService;
import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ProjectVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MailSendService mailService;
	
	//진짜 회원가입!
	@PostMapping("member/join")
	public String join(MemberVo vo) {

		int result = service.join(vo);

		if(result == 1) {
			return "member/login";
		}else {
			return "member/join";
		}
		
	}
	
	//진짜 로그인!
	@PostMapping("member/login")
	public String login(MemberVo vo, HttpSession session, String save, HttpServletResponse resp, Model model) {
		log.warn("화면 브이"+vo);
	
		MemberVo loginMember = service.login(vo);
		
		log.warn("로그인멤버~ "+loginMember);
		
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 실패하였습니다.");
			log.warn("로그인 실패입니다.");
			return "member/login";
		}
		
	
		session.setAttribute("loginMember", loginMember);
		
		Cookie c = new Cookie("saveId", loginMember.getEmail());
		c.setPath("/blank");
		

		
		if(save == null) { 
			c.setMaxAge(0);
		}
		

		resp.addCookie(c);

		
		return "redirect:/";
	}
	
	//로그아웃 
	@GetMapping("member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원탈퇴 화면 
	@GetMapping("member/quit")
	public String quit() {
		return "member/quit";
	}
	
	//진짜 탈퇴 
	//회원탈퇴 > 탈퇴설문답변 insert 회원테이블 status > N
	@PostMapping("member/quit")
	public String quit(MemberVo vo, HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String mNo = loginMember.getNo();
		vo.setNo(mNo);
		
		int answerResult = service.writeQuitAnswer(vo);
		
		//탈퇴 진행 안되으
		if(answerResult == 0) {
			
			model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
			return "redirect:/blank";
			
		}
		
		session.invalidate();
		
		model.addAttribute("msg", "회원 탈퇴 되었습니다. 다음에 다시 뵙기를...");
		
		return "home";
	}
	
	//회원가입화면 
	@GetMapping("member/join")
	public String join() {
		return "member/join";
	}
	
	//로그인 화면 
	@GetMapping("member/login")
	public String login() {
		return "member/login";
	}
	
	
	//아이디 찾기 화면
	@GetMapping("member/findId")
	public String findId() {
		return "member/findId";
	}
	
	//비밀번호 찾기  화면 
	@GetMapping("member/findPwd")
	public String findPwd() {
		return "member/findPwd";
	}
	
	//임시비밀번호 전송 
	@ResponseBody
	@PostMapping("member/tempPwd")
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
	@GetMapping("member/mypage/editprofile")
	public String mypageEditProfile(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "home";
		}
		return "member/mypage/editProfile";
	}
	

	
	//마이페이지 결제수단 / 배송지 화면
	//결제수단이랑 배송지 있는거 가져와야함 
	@GetMapping("member/mypage/payAddr")
	public String mypagePayAddr( HttpSession session, Model model) {
		
		
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "home";
		}
		
		String mNo = loginMember.getNo();
		
		List<PayVo> loginPayVoList = service.selectPayByNo(mNo);
		
		
		if(loginPayVoList.size() == 0) {
			
			return "member/mypage/payAddr";
		}
		
		model.addAttribute("payVoList", loginPayVoList);

		
		return "member/mypage/payAddr";
	}
	
	//마이페이지 후원한 프로젝트 
	@GetMapping("member/mypage/payProject")
	public String mypagePayProject(HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "home";
		}
		return "member/mypage/payProject";
	}
	
	//마이페이지 관심있는 프로젝트
	//관심 프로젝트에 가져오자 
	@GetMapping("member/mypage/likeProject")
	public String mypageLikeProject(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "home";
		}
		
		String mNo = loginMember.getNo();
		
		List<ProjectVo> voList = service.selectLikePrjByNo(mNo);
		
		model.addAttribute("likePrjVoList", voList);
	
		
		
		return "member/mypage/likeProject";
	}
	
	//마이페이지 신고 / 문의 내역  
	@GetMapping("member/mypage/reportQ")
	public String mypageReportQ(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "home";
		}
		
		String mNo = loginMember.getNo();
		
		
		List<HelpVo> helpVoList = service.selectHelpListByNo(mNo);
		
		model.addAttribute("helpVoList", helpVoList);
		
		log.warn("헬프에 머가들었니 "+helpVoList);
		return "member/mypage/reportQ";
	}
	
	//이메일 중복 확인 후 없으면 이메일 업데이트 있으면 중복된 이메일이라고 알림
	@ResponseBody
	@PostMapping("/member/updateEmail")
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
	
		//닉네임 중복 확인 후 없으면 닉네임 업데이트 있으면 중복된 닉네임이라고 알림 
		@ResponseBody
		@PostMapping("/member/updateNick")
		public String updateNickByNo(String nick, HttpSession session) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			String userNo = loginMember.getNo();
			
			//로그인된 유저넘버와 새로운 닉네임 Vo 만들어줌 
			MemberVo vo = new MemberVo();
			vo.setNo(userNo);
			vo.setNick(nick);
			
			
			int doubleCheckResult = service.doubleCheckByNick(nick);
			
			//닉네임 중복있다.
			if(doubleCheckResult == 1) {
				//중복이 있으면 리턴 
				return 0+"";
			}
			//없으면 닉네임 업데이트 
			int updateResult = service.updateNickByNo(vo);
			
			//닉네임 업데이트 했으니 세션을 갈아주자 
			if(updateResult == 1) {
				loginMember.setNick(nick);
				session.setAttribute("loginmember", loginMember);
				log.warn("############세션 업데이트 된 데이터 "+loginMember);
				return updateResult+"";
			}
			//업데이트 실패하면
			return 2 + "";
		}

		//핸드폰 중복 확인 후 없으면 핸드폰 업데이트 있으면 중복된 핸드폰이라고 알림 
		@ResponseBody
		@PostMapping("/member/updatePhone")
		public String updatePhoneByNo(String phone, HttpSession session) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			String userNo = loginMember.getNo();
			
			//로그인된 유저넘버와 새로운 휴대전화  Vo 만들어줌 
			MemberVo vo = new MemberVo();
			vo.setNo(userNo);
			vo.setPhone(phone);
			
			
			int doubleCheckResult = service.doubleCheckByPhone(phone);
			
			//핸드폰 중복있다.
			if(doubleCheckResult == 1) {
				//중복이 있으면 리턴 
				return 0+"";
			}
			//없으면 휴대전화  업데이트 
			int updateResult = service.updatePhoneByNo(vo);
			
			//핸드폰 업데이트 했으니 세션을 갈아주자 
			if(updateResult == 1) {
				loginMember.setNick(phone);
				session.setAttribute("loginmember", loginMember);
				log.warn("############세션 업데이트 된 데이터 "+loginMember);
				return updateResult+"";
			}
			//업데이트 실패하면
			return 2 + "";
		}
		
		
		//네이버 로그인
		@GetMapping("/naverLogin")
		public String loginNaver() {
			return "member/naverLogin";
		}
		
		//네이버 로그인
		@GetMapping("/callback")
		public String callback() {
			return "member/naverCallback";
		}
		
		//주소  갯수 카운트 하기 3개까지만 ~
		@ResponseBody
		@PostMapping("member/addrCnt")
		public String cardCount(HttpSession session) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			String mNo = loginMember.getNo();
			
			int result = service.addrCount(mNo);
			
			log.warn("주소 갯수는~"+ result);
			//카드갯수가 3 보다 작다 
			if(result < 3) {
				return 1+"";
			}else {
				return 0+"";
			}
			
		}
		
		@PostMapping("member/addrPlus")
		public String insertAddr(AddressVo vo , HttpSession session, Model model) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			String mNo = loginMember.getNo();
			
			vo.setMNo(mNo);
			
			log.warn("주소 받아왔다이이이이이잉"+vo);
			
			int result = service.insertAddr(vo);
			
			log.warn("주소추가 결과 "+result);
			
			if(result ==1 ) {
				model.addAttribute("msg", "주소가 정상적으로 추가되었습니다.");
			}
			
			return "redirect:/member/mypage/payAddr";
			
		}
		
		
		
		
		
		
}
