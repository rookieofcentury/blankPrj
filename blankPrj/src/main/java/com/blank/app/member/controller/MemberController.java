package com.blank.app.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blank.app.admin.service.AdminService;
import com.blank.app.admin.vo.HelpVo;
import com.blank.app.goods.vo.PaymentVo;
import com.blank.app.member.naver.NaverLoginBO;
import com.blank.app.member.service.MailSendService;
import com.blank.app.member.service.MemberService;
import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.quit.vo.QuitVo;
import com.blank.app.report.vo.ReportVo;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private AdminService adminService;
	
	
	private String apiResult = null;
	
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
	
		MemberVo loginMember = service.login(vo);

		
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 실패하였습니다.");
			log.warn("로그인 실패입니다.");
			return "member/login";
		}
		String mNo = loginMember.getNo();
		
		String payPrjCnt = service.selectPrjCnt(mNo);
		
		loginMember.setCntPrj(payPrjCnt);
		
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
	public String quit(Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		if(loginMember == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "home";
		}
		
		//화면 보여줄 때 탈퇴 선택지 보여줘야한다.
		List<QuitVo> voList = adminService.selectQuit();
		
		System.out.println(voList);
		
		model.addAttribute("quitVoList", voList);
		
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
		
		model.addAttribute("msg", "우리 다음에 또 만나용~!");
		
		return "home";
	}
	
	//회원가입화면 
	@GetMapping("member/join")
	public String join() {
		return "member/join";
	}
	
	//로그인 화면 
	@GetMapping("member/login")
	public String login(Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			model.addAttribute("msg", "이미 로그인을 하신 상태입니다.");
			return "home";
		}
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);
		
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
		
		if(result == 1) {
			
			String num = mailService.sendMail(email); // 임시비밀번호 메일로 보냄 
			
			MemberVo vo = new MemberVo(email, num);
			
			int updateResult = service.updatePwd(vo);
			
			System.out.println("업데이트 결과 "+ updateResult);
			
			return updateResult+""; // ddltkdgka 
			
		}else {
			
			
			return result + ""; //없는 이메일 이라고 결과가 나옴 
			
			
		}
		
		
		
		
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
		List<AddressVo> loginAddrVoList = service.selectAddrByNo(mNo);
		
		if(loginPayVoList.size() == 0) {
			
			return "member/mypage/payAddr";
		}
		
		model.addAttribute("addrVoList",loginAddrVoList);
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
		
		//프로젝트 결제내역에서 가져오자
		String mNo = loginMember.getNo();
		
		
		List<PayListVo> voList = service.selectPayListByNo(mNo);
		
		System.out.println(voList);
		
		model.addAttribute("payList",voList);
		
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
		List<ReportVo> reportVoList = service.selectReportListByNo(mNo);
		
		log.warn("리포트 에 머가들었니 "+reportVoList);
		
		model.addAttribute("helpVoList", helpVoList);
		model.addAttribute("reportVoList", reportVoList);
		return "member/mypage/reportQ";
	}
	
		//마이페이지 팔로잉 / 팔로워  내역  
		@GetMapping("member/mypage/likePeople")
		public String mypageFollow(HttpSession session, Model model) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			if(loginMember == null) {
				model.addAttribute("msg", "로그인 후 이용가능합니다.");
				return "home";
			}
			
			String mNo = loginMember.getNo();
			
			//내가발로잉한 사람 
			List<MemberVo> followingList = service.selectFollowing(mNo);
			log.warn("내가 팔로잉한 목록 ::: "+followingList);
			model.addAttribute("followingList", followingList);
			
			//나를 팔로잉 한사람 = 팔로워 
			List<MemberVo> followerList = service.selectFollower(mNo);
			log.warn("내가 팔로잉한 목록 ::: "+followerList);
			model.addAttribute("followerList", followerList);
			
			return "member/mypage/follow";
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
				loginMember.setPhone(phone);
				session.setAttribute("loginmember", loginMember);
				log.warn("############세션 업데이트 된 데이터 "+loginMember);
				return updateResult+"";
			}
			//업데이트 실패하면
			return 2 + "";
		}
		
		//변경시 비밀번호가맞는 지 확인 
		@ResponseBody
		@PostMapping("member/checkPwd")
		public String checkPwd(String pwd, HttpSession session) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			String userNo = loginMember.getNo();

			MemberVo vo = new MemberVo();
			vo.setNo(userNo);
			vo.setPwd1(pwd);
			
			int result = service.checkPwd(vo);
			
			if(result == 1 ) {
				return 1+ "";
			}else {
				return 0 +"";
			}
		}
		//비밀번호 업데이트 
		@ResponseBody
		@PostMapping("member/updatePwd")
		public String updatePwd(String pwd1, HttpSession session) {
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			String userNo = loginMember.getNo();
			//업데이트 해줄 정보 
			MemberVo vo = new MemberVo();
			vo.setNo(userNo);
			vo.setPwd1(pwd1);
			
			System.out.println(vo);
			
			int result = service.updatePwdByNo(vo);
			
			if(result == 1) {
				return 1+"";
			}else {
				return 0+"";
			}
		}
		
		
		//네이버 로그인
		@GetMapping("naverLogin")
		public String loginNaver() {
			return "member/naverLogin";
		}
		
		//네이버 로그인
		@GetMapping("callback")
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
			
			System.out.println("주소 결과 갯수 "+ result);
			
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
		
		@PostMapping("member/deleteaddr")
		public String deleteAddr(@RequestParam(name="no") String no, HttpSession session, Model model) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			AddressVo vo = new AddressVo();
			
			log.warn("주소 고유번호"+ no);
			
			//저장된 번호가져옴 
			vo.setMNo(loginMember.getNo());
			vo.setNo(no);
			
			System.out.println(vo);
			
			int result = service.deleteAddr(vo);
			
			if(result == 0) {
				System.out.println("삭제못했다 ");
				model.addAttribute("msg", "주소가 정상적으로 삭제되지 않았습니다. ");
				return "redirect:/member/mypage/payAddr";
			}else {
				
			}
			model.addAttribute("msg", "주소가 정상적으로 삭제되었습니다.");
			return "redirect:/member/mypage/payAddr";
		}
		
		
		//팔로잉되어있는지확인하는 구문 
		@PostMapping("member/checkLikeMember")
		public String checkLikeMember(){
			return "";
		}
		
		
		
		//팔로잉 기능 --에이잭스 쓰시나 물어봐야함 
		//다시 한번 확인해야함 ㅂ팔로우 한 사람인지 아닌ㄷ지 
		//자기자신 팔로잉 도 확인 
		@ResponseBody
		@PostMapping("member/insertLikeMember")
		public String insertLikeMemberByNo(HttpSession session, String likeMemberNo) {
			

			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			//로그인한 사람 
			String mNo = loginMember.getNo();
			
			LikeMemberVo insertVo = new LikeMemberVo();
			insertVo.setMNo(mNo);
			insertVo.setLikeMemberNo(likeMemberNo);
			
			
			int result = service.insertLikeMemberByNo(insertVo);
			
			
			if(result == 1) {
				//성공시 
				return 1+"";
			}
			return 0+"";
			
		}
		
		
		//팔로잉 기능
		@ResponseBody
		@PostMapping("member/deleteMember")
		public String deleteLikeMemberByNo(HttpSession session, String likeMemberNo) {
			

			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			//로그인한 사람 
			String mNo = loginMember.getNo();
			//삭제할 사람 
			LikeMemberVo deleteVo = new LikeMemberVo();
			
			deleteVo.setMNo(mNo);
			deleteVo.setLikeMemberNo(likeMemberNo);
			
			
			int result = service.deleteLikeMemberByNo(deleteVo);
			
			
			if(result == 1) {
				//성공시 
				return 1+"";
				
			}
			return 0+"";
			
		}
		
		
		//프로필 사진 올리기
		@PostMapping("member/mypage/plus-profile")
		public String uploadPorfileh(HttpServletRequest req, HttpSession session, MultipartFile profile) {
			
			
			String path = req.getSession().getServletContext().getRealPath("/resources/upload/member/");
			String changeName = "profile_"+ System.nanoTime();
			String originName = profile.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		
			File target = new File(path + changeName + ext) ;
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			//로그인한 사람 
			String no = loginMember.getNo();
			String profileName = changeName + ext;
			//업데이트 정보 넘겨주는 것 
			
			
			MemberVo vo = new MemberVo();
			vo.setNo(no);
			vo.setProfile(profileName);
			
			boolean isEmpty = profile.isEmpty();
			
			int result = 0;
			
			if(isEmpty) {
				return "redirect:/member/mypage/editprofile";
			}
		
			
			try {
				profile.transferTo(target);
				 result = service.updateProfile(vo);
				 
			} catch (Exception e) {
				
				e.printStackTrace();
			}
				
			
			
			if(result ==1) {
				loginMember.setProfile(profileName);
				System.out.println("로그인멤버 어떻게 되나용?"+loginMember);
				session.setAttribute("loginMember", loginMember);
				
			}
			return "redirect:/member/mypage/editprofile";
		}
		
		//네이버 콜백 페이지//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
			
			System.out.println("여기는 callback");
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	 
	        //1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
			
			/** apiResult json 구조
			{"resultcode":"00",
			 "message":"success",
			 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			**/
			
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			//3. 데이터 파싱 
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			
			//response중 Member에 관한거 가져오기  nickname값 파싱
			String nickname = (String)response_obj.get("nickname");
			String email = (String)response_obj.get("email");
			String phone = (String)response_obj.get("mobile");
			
			String profile = (String)response_obj.get("profile_image");
		
			
			MemberVo vo = new MemberVo();
			vo.setNick(nickname);
			vo.setEmail(email);
			vo.setPhone(phone);
			vo.setProfile(profile);
			System.out.println(response_obj.toJSONString());
			
		
			
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("naver", true);
			session.setAttribute("loginMember",vo); //세션 생성
			
			//프로필을 저장해서 넘긴다.
			model.addAttribute("result", apiResult);
		     
			return "redirect:/";
		}

		
		@PostMapping("member/sendMessage")
		@ResponseBody
		public String phoneAuth(String phone, HttpSession session){
		
			int result = service.doubleCheckByPhone(phone);
			
			
			String code = "";
			phone = phone.replace("-", "");
			
			
			//핸드폰번호가 있다.보내자 
			
		   if(result == 1) {
			   code = service.sendRandomMessage(phone);
			   session.setAttribute("code", code);
			   return 1+"";
			   
		   }else {
			   
			   return 0+"";
		   }
		   

		}

		//휴대전화 인증번호가 맞다 이메일을 알려주자 
		@PostMapping("member/findEmail")
		@ResponseBody
		public String findEmail(String phone, String num, HttpSession session) {
			
			log.debug("화면에서 받은 숫자 "+ num);
			
			String code = (String)session.getAttribute("code");
			
			if(num.equals(code)) {
				String email = service.findEmail(phone);
				return email;
			}else {
				return 0+"";
			}
			
		}
		
		//프로필사진삭제 ^^...
		@ResponseBody
		@PostMapping("member/deleteProfile")
		public String updateDefault(HttpSession session, Model model){
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			if(loginMember == null) {
				model.addAttribute("msg", "로그인 후 이용가능합니다.");
				return "home";
			}
			String no = loginMember.getNo();
			
			int result = service.updateDefault(no);
			loginMember.setProfile("default.png");
			
			//프로필 다시 디폴트로 바꼬준다.
			if(result == 1) {
				session.setAttribute("loginMember", loginMember);
				return result+"";
			}
			
			return result+"";
		}
		
		//굿즈구매내역 보여주기
		@GetMapping("member/mypage/myGoods")
		public String showMyGoods(HttpSession session, Model model) {
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			if(loginMember == null) {
				model.addAttribute("msg", "로그인 후 이용가능합니다.");
				return "home";
			}
			
			String consumer = loginMember.getNo();
			
			//List<PaymentVo> paymentVo = service.selectGoodsPament(consumer);
			
			return "";
		}
		
		
		
		
}
