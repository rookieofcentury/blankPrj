package com.blank.app.pay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.member.service.MemberService;
import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.service.PayService;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.service.ProjectService;
import com.blank.app.project.vo.ItemVo;
import com.blank.app.project.vo.ProjectVo;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("pay")
@Controller
public class PayController {

		@Autowired
		private PayService payService;
		
		@Autowired
		private MemberService memberService;
		
		@Autowired
		private ProjectService prjService;
		
		//화면을 보여줄 때 
		@GetMapping("")
		public String payProject(HttpSession session, @RequestParam String pNo,@RequestParam String setNo, Model model) {
			
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			System.out.println(pNo);
			System.out.println(setNo);
			
			if(loginMember == null) {
				model.addAttribute("msg", "로그인 후 이용가능합니다.");
				return "home";
			}
		
			//화면에 보여줄 때 프로젝트랑 세트 번호 가져와야한다 ~ 
			ProjectVo prjVo = payService.selectPrjByNo(pNo);

			ItemVo setVo = payService.selectSetByNo(setNo);
			
			// 퍼센트 - 애림님 
			int p = Integer.parseInt(pNo);
			int fundingSum =prjService.selectSum(p);
			int goal = Integer.parseInt(prjVo.getPrice());
			
			String fundingPrice = String.valueOf(fundingSum);
			prjVo.setFundingSum(fundingPrice);
			
			//달성률
			int division = Math.floorMod(fundingSum,goal);
//			int division = Math.floorMod(300,1000);
//			System.out.println(division);
			
//			int percent = division * 100;
			int percent = division / 10;
//			System.out.println(percent);
			
			prjVo.setPercent(percent);
			
			//후원자 정보도 가져와야함!
			String mNo = loginMember.getNo();
			
			//후원자 카드정보도 주소정보도!
			List<PayVo> loginPayVoList = memberService.selectPayByNo(mNo);
			List<AddressVo> loginAddrVoList = memberService.selectAddrByNo(mNo);
			
			
			System.out.println(setVo);
	
			
			model.addAttribute("prjVo", prjVo);
			model.addAttribute("setVo", setVo);
			model.addAttribute("addrVoList", loginAddrVoList);
			model.addAttribute("payVoList", loginPayVoList);
			
			return "pay/supportProject";
			
		}
		
		//프로젝트 후원 진짜! 
		@PostMapping("")
		public String payProjectReal(String price , HttpSession session, PayListVo vo, Model model) {
			System.out.println(price);
			log.warn("화면에서 받은 결제 관련 " + vo);
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

			
			if(loginMember == null) {
				model.addAttribute("msg", "로그인 후 이용가능합니다.");
				return "home";
			}
			
			vo.setMNo(loginMember.getNo());
			
			
			
		
			int result = payService.insertPayList(vo);
			
			if(result == 1) {
				
				//성공했을 때 세트 수량 -1 
				int result2 = prjService.minusCnt(vo.getSetNo());
				
				return "redirect:/member/mypage/payProject";
			}else {
				return "#";
			}
			
		}
		
		
	
		@PostMapping("pluscard")
		public String plusCard(PayVo vo, HttpSession session, Model model) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			log.warn("로그인되었니 "+ loginMember);
			vo.setMNo(loginMember.getNo());
			
			System.out.println("카드번호있냐고오오 ㅗ"+ vo);
			int result = payService.insertCard(vo);
			
			if(result == 0 ) {
				model.addAttribute("msg", "카드가 정상적으로 추가되지 않았습니다.");
			}
			model.addAttribute("msg", "카드가 추가되었습니다.");
			return "redirect:/member/mypage/payAddr";
		}
		
		@PostMapping("deletecard")
		public String deleteCard(@RequestParam(name="no") String no, HttpSession session, Model model) {
			
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			PayVo vo = new PayVo();
			
			log.warn("카드고유번호"+ no);
			
			//결제저장된 번호가져옴 
			vo.setMNo(loginMember.getNo());
			vo.setNo(no);
			
			System.out.println(vo);
			
			int result = payService.deleteCard(vo);
			
			if(result == 0) {
				model.addAttribute("msg", "카드가 정상적으로 삭제되지 않았습니다. ");
			}else {
				
			}
			model.addAttribute("msg", "카드가 정상적으로 삭제되었습니다.");
			return "redirect:/member/mypage/payAddr";
		}
		
		//카드 갯수 카운트 하기 3개까지만 ~
		@ResponseBody
		@PostMapping("cardCnt")
		public String cardCount(HttpSession session) {
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			String mNo = loginMember.getNo();
			
			int result = payService.cardCount(mNo);
			
			log.warn("카드갯수는~"+ result);
			//카드갯수가 3 보다 작
			if(result < 3) {
				return 1+"";
			}else {
				return 0+"";
			}
			
		}
	}



