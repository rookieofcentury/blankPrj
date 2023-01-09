package com.blank.app.admin;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.core.tools.picocli.CommandLine.Help;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.admin.service.AdminService;
import com.blank.app.admin.service.AdminServiceImpl;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.chatbot.vo.ChatbotVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.quit.vo.QuitVo;
import com.blank.app.report.vo.ReportVo;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 관리자 로그인(화면)
	@GetMapping("login")
	public String login() {
		return "admin/admin/login";
	}

	// 관리자 로그인
	@PostMapping("login")
	public String login(AdminVo vo, HttpSession session) {

		AdminVo loginAdmin = adminService.login(vo);

		if (loginAdmin == null) {
			return "error";
		}

		session.setAttribute("loginAdmin", loginAdmin);

		return "redirect:member";

	}

	// 회원 관리 목록(화면)
	@GetMapping("member")
	public String memberList(HttpServletRequest req, HttpSession session, String p) {

		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}

		int listCount = adminService.memberCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<MemberVo> voList = adminService.selectMemberList(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);

		return "admin/member/list";
	}

	// 회원 상세 정보(화면)
	@GetMapping("memberEdit")
	public String edit(MemberVo memberVo, HttpSession session) {

		MemberVo selectMember = adminService.selectMember(memberVo);

		if (selectMember == null) {
			return "error";
		}

		session.setAttribute("selectMember", selectMember);

		return "admin/member/edit";
	}

	// 회원 정보 수정
	@PostMapping("memberEdit")
	public String edit(MemberVo memberVo) {

		int updateMember = adminService.updateMember(memberVo);

		if (updateMember != 1) {
			return "error";
		}

		return "redirect:member";
	}

	// 프로젝트 관리 목록(화면)
	@GetMapping("project")
	public String projectList(HttpServletRequest req, HttpSession session, String p) {

		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}

		int listCount = adminService.projectCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<ProjectVo> voList = adminService.selectProjectList(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);

		return "admin/project/list";
	}

	// 프로젝트 상세정보(화면)
	@GetMapping("prjDetail")
	public String prjDetail(ProjectVo projectVo, HttpSession session) {

		ProjectVo selectProject = adminService.selectPrj(projectVo);

		if (selectProject == null) {
			return "error";
		}

		session.setAttribute("selectProject", selectProject);

		return "admin/project/detail";
	}

	// 프로젝트 승인
	@PostMapping("projectApproval")
	public String projectApproval(ProjectVo projectVo) {

		int result = adminService.approvalProject(projectVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:project";
	}

	// 프로젝트 반려
	@PostMapping("projectCancel")
	public String projectCancel(ProjectVo projectVo) {

		int result = adminService.cancelProject(projectVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:project";
	}

	// 신고 프로젝트 목록(화면)
	@GetMapping("deProject")
	public String deProjectList(HttpServletRequest req, HttpSession session, String p) {

		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}

		int listCount = adminService.deProjectCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<ReportVo> voList = adminService.selectDeProjectList(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);

		return "admin/deProject/list";
	}

	// 신고프로젝트 상세조회(화면)
	@GetMapping("reportCheck")
	public String reportCheck(ReportVo reportVo, HttpSession session) {

		ReportVo selectReport = adminService.selectReport(reportVo);

		if (selectReport == null) {
			return "error";
		}

		session.setAttribute("selectReport", selectReport);

		return "admin/deProject/check";
	}

	// 신고프로젝트 접수
	@PostMapping("reportCheck")
	public String reportCheck(ReportVo reportVo) {

		int result = adminService.updateReport(reportVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:deProject";
	}

	// 공지사항 목록 조회
	@GetMapping("notice")
	public String notice(HttpServletRequest req, HttpSession session, String p) {

		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}

		int listCount = adminService.listCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<NoticeVo> voList = adminService.selectList(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);

		return "admin/notice/list";
	}

	// 공지사항 작성(화면)
	@GetMapping("noticeWrite")
	public String noticeWrite() {
		return "admin/notice/write";
	}

	// 공지사항 작성
	@PostMapping("noticeWrite")
	public String noticeWrite(Model model, NoticeVo noticeVo, HttpSession session) {

		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");

		noticeVo.setAdminNo(loginAdmin.getNo());

		int listCount = adminService.listCount();
		int result = adminService.noticeWrite(noticeVo);

		if (result != 1) {
			return "error";
		}

		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("listCount", listCount);

		return "redirect:notice";

	}

	// 공지사항 상세조회
	@GetMapping("noticeDetail")
	public String noticeDetail(NoticeVo noticeVo, HttpSession session) {

		NoticeVo selectNotice = adminService.selectOne(noticeVo);

		if (selectNotice == null) {
			return "error";
		}

		session.setAttribute("selectNotice", selectNotice);

		return "admin/notice/detail";
	}

	// 공지사항 수정
	@PostMapping("noticeDetail")
	public String noticeDetail(NoticeVo noticeVo) {

		int updateNotice = adminService.updateOne(noticeVo);

		if (updateNotice != 1) {
			return "error";
		}

		return "redirect:notice";
	}

	// 공지사항 삭제
	@PostMapping("noticeDelete")
	public String noticeDelete(NoticeVo noticeVo) {

		int result = adminService.deleteNotice(noticeVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:notice";
	}

	// 자주 묻는 질문(FAQ) 목록(화면)
	@GetMapping("faq")
	public String faq(HttpServletRequest req, HttpSession session, String p) {

		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}

		int listCount = adminService.faqCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<FaqVo> voList = adminService.selectFaq(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);

		return "admin/faq/list";
	}

	// 자주 묻는 질문(FAQ) 상세조회
	@GetMapping("faqDetail")
	public String faqDetail(FaqVo faqVo, HttpSession session) {

		FaqVo selectFaq = adminService.selectFaq(faqVo);

		if (selectFaq == null) {
			return "error";
		}

		session.setAttribute("selectFaq", selectFaq);

		return "admin/faq/edit";
	}

	// 자주 묻는 질문(FAQ) 작성(화면)
	@GetMapping("faqWrite")
	public String faqWrite() {
		return "admin/faq/write";
	}

	// 자주 묻는 질문(FAQ) 작성
	@PostMapping("faqWrite")
	public String faqWrite(Model model, FaqVo faqVo, HttpSession session) {

		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");

		faqVo.setAdminNo(loginAdmin.getNo());

		int listCount = adminService.listCount();
		int result = adminService.faqWrite(faqVo);

		if (result != 1) {
			return "error";
		}

		model.addAttribute("faqVo", faqVo);
		model.addAttribute("listCount", listCount);

		return "redirect:faq";

	}

	// 자주 묻는 질문(FAQ) 수정
	@PostMapping("faqEdit")
	public String faqEdit(FaqVo faqVo) {

		int result = adminService.updateFaq(faqVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:faq";
	}

	// 자주 묻는 질문(FAQ) 삭제
	@PostMapping("faqDelete")
	public String faqDelete(FaqVo faqVo) {

		int result = adminService.deleteFaq(faqVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:faq";
	}

	// 고객센터 문의 목록(화면)
	@GetMapping("help")
	public String help(String category, String keyword, HttpSession session, String p) {
		
		if (p == null) {
			p = "1";
		}

		int listCount = adminService.helpCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<HelpVo> voList = adminService.selectHelp(map, pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);

		return "admin/help/list";
	}

	// 고객센터 문의 상세조회
	@GetMapping("helpDetail")
	public String helpDetail(HelpVo helpVo, HttpSession session) {

		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");

		helpVo.setAdminNo(loginAdmin.getNo());

		HelpVo selectHelp = adminService.selectHelp(helpVo);

		session.setAttribute("selectHelp", selectHelp);

		return "admin/help/write";
	}

	// 고객센터 문의 답변
	@PostMapping("helpCheck")
	public String helpCheck(HelpVo helpVo, HttpSession session) {

		int result = adminService.updateHelp(helpVo);

		System.out.println("답변에서 helpVo : " + helpVo);
		
		if (result != 1) {
			return "error";
		}

		return "redirect:help";
	}
	
	// 챗봇 목록
	@GetMapping("chatbot")
	public String chatbot(Model model, HttpSession session) {
		
		List<ChatbotVo> voList = adminService.selectChatbot();
		
		session.setAttribute("voList", voList);
		model.addAttribute("voList", voList);
		
		return "admin/chatbot/list";
	}
	
	// 챗봇 질의응답 작성(화면)
	@GetMapping("chatbotWrite")
	public String chatbotWrite() {
		return "admin/chatbot/write";
	}
	
	// 챗봇 질의응답 작성
	@PostMapping("chatbotWrite")
	public String chatbotWrite(String[] adminNo, String[] fixQ, String[] fixA, Model model, HttpSession session) {

		ChatbotVo chatbotVo = null;
		
		List<ChatbotVo> chatbotList = new ArrayList<ChatbotVo>();
		
		for(int i = 0; i < adminNo.length; i++) {
			
			chatbotVo = new ChatbotVo();
			
			chatbotVo.setAdminNo(adminNo[i]);
			chatbotVo.setFixQ(fixQ[i]);
			chatbotVo.setFixA(fixA[i]);
			
			chatbotList.add(chatbotVo);
			
		}
		
		int result = adminService.chatbotWrite(chatbotList);
		
		if (result != 1) {
			return "error";
		}
		
		session.setAttribute("chatbotVo", chatbotVo);
		model.addAttribute("chatbotVo", chatbotVo);
		
		return "redirect:chatbot";

	}
	
	// 챗봇 질의응답 삭제
	@PostMapping("chatbotDelete")
	public String chatbotDelete(ChatbotVo chatbotVo) {

		int result = adminService.deleteChatbot(chatbotVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:chatbot";
	}
	
	// 탈퇴 설문 목록
	@GetMapping("quit")
	public String quit(Model model, HttpSession session) {
		
		List<QuitVo> voList = adminService.selectQuit();
		
		session.setAttribute("voList", voList);
		model.addAttribute("voList", voList);
		
		return "admin/quit/list";
	}
	
	// 탈퇴 설문 작성(화면)
	@GetMapping("quitWrite")
	public String quitWrite() {
		return "admin/quit/write";
	}
	
	// 탈퇴 설문 작성
	@PostMapping("quitWrite")
	public String quitWrite(String[] adminNo, String[] content, Model model, HttpSession session) {

		QuitVo quitVo = null;
		
		List<QuitVo> quitList = new ArrayList<QuitVo>();
		
		for(int i = 0; i < adminNo.length; i++) {
			
			quitVo = new QuitVo();
			
			quitVo.setAdminNo(adminNo[i]);
			quitVo.setContent(content[i]);
			
			quitList.add(quitVo);
			
		}
		
		int result = adminService.quitWrite(quitList);
		
		if (result != 1) {
			return "error";
		}
		
		session.setAttribute("quitVo", quitVo);
		model.addAttribute("quitVo", quitVo);
		
		return "redirect:quit";

	}
	
	// 탈퇴 설문 삭제
	@PostMapping("quitDelete")
	public String quitDelete(QuitVo quitVo) {

		int result = adminService.deleteQuit(quitVo);

		if (result != 1) {
			return "error";
		}

		return "redirect:quit";
	}
	
	// 통계 (화면)
	@GetMapping("stats")
	public String stats(HttpServletRequest req, HttpSession session, String p) {
		
		if (p == null) {
			p = "1";
		}

		int quitCount = adminService.quitCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 5;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(quitCount, currentPage, pageLimit, boardLimit);

		List<MemberVo> voList = adminService.selectQuitList(pageVo);

		session.setAttribute("voList", voList);
		session.setAttribute("quitCount", quitCount);
		session.setAttribute("pageVo", pageVo);
		
		return "admin/quit/stats";
	}
	
	// 통계 데이터 조회
	@GetMapping("result")
	@ResponseBody
	public List<Map<String, String>> result() {
			
		List<Map<String, String>> map = adminService.selectStats();
		
		return map;
	}
	
}
