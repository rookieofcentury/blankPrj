package com.blank.app.help.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.help.service.HelpService;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.ProjectVo;

@Controller
@RequestMapping("help")
public class HelpController {

	@Autowired
	private HelpService helpService;
	
	//고객센터 메인(화면)
	@GetMapping("main")
	public String main(HttpServletRequest req, HttpSession session, String p) {
		
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}
		
		int listCount = helpService.helpCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 5;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<HelpVo> voList = helpService.selectHelp(map, pageVo);

		session.setAttribute("voList", voList);
		
		return "help/main";
	}
	
	//블랭크에게 문의하기 목록 조회
	@GetMapping("inquiryList")
	public String help(HttpServletRequest req, HttpSession session, String p) {
		
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}

		int listCount = helpService.helpCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<HelpVo> voList = helpService.selectInquiry(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);
		
		return "help/inquiry/list";
	}
	
	//[회원] 고객센터 문의 작성(화면)
	@GetMapping("inquiryWrite")
	public String inquiryWrite() {
		return "help/inquiry/write";
	}
	
	// [회원] 고객센터 문의 작성
	@PostMapping("inquiryWrite")
	public String inquiryWrite(Model model, HelpVo helpVo, HttpSession session) {

		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");

		helpVo.setMemberNo(loginMember.getNo());
		
		int result = helpService.inquiryWrite(helpVo);
		
		if (result != 1) {
			return "error";
		}

		model.addAttribute("helpVo", helpVo);

		return "redirect:inquiryList";

	}
	
	//[회원] 고객센터 문의 상세조회
	@GetMapping("inquiryDetail")
	public String inquiryDetail(HelpVo helpVo, HttpSession session) {

		HelpVo selectInquiry = helpService.selectInquiry(helpVo);

		if (selectInquiry == null) {
			return "error";
		}

		session.setAttribute("selectInquiry", selectInquiry);
		session.setAttribute("helpVo", helpVo);
		
		return "help/inquiry/detail";
	}
	
	//[회원] FAQ 목록 조회
	@GetMapping("faqList")
	public String faqList(HttpServletRequest req, HttpSession session, String p) {
		
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}
		
		int listCount = helpService.faqCount(category);
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<FaqVo> voList = helpService.selectFaqList(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);
		session.setAttribute("category", category);
		
		return "help/faq/list";
	}
	
	//[회원] FAQ 상세조회
	@GetMapping("faqDetail")
	public String faqDetail(FaqVo faqVo, HttpSession session) {

		FaqVo selectFaq = helpService.selectFaq(faqVo);

		if (selectFaq == null) {
			return "error";
		}

		session.setAttribute("selectFaq", selectFaq);
		session.setAttribute("faqVo", faqVo);
		
		return "help/faq/detail";
	}
	
	//검색 결과(화면)
	@GetMapping("search")
	public String search() {
		return "help/search/detail";
	}
	
}
