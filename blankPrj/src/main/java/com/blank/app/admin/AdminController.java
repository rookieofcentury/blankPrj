package com.blank.app.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blank.app.admin.service.AdminService;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.NoticeVo;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//관리자 로그인(화면)
	@GetMapping("login")
	public String login() {
		return "admin/admin/login";
	}
	
	@PostMapping("login")
	public String login(AdminVo vo, HttpSession session) {
		
		AdminVo loginAdmin = adminService.login(vo);
		
		if(loginAdmin == null) {
			return "error";
		}
		
		session.setAttribute("loginAdmin", loginAdmin);
		return "admin/member/list";
		
	}
	
	//회원 관리 목록(화면)
	@GetMapping("member")
	public String memberList() {
		return "admin/member/list";
	}
	
	//프로젝트 관리 목록(화면)
	@GetMapping("project")
	public String projectList() {
		return "admin/project/list";
	}

	//신고 프로젝트 관리 목록(화면)
	@GetMapping("deProject")
	public String deProjectList() {
		return "admin/deProject/list";
	}
	
	//공지사항 목록 조회
	@GetMapping("notice")
	public String notice(Model model) {
		
		List<NoticeVo> voList = adminService.selectList();
		
		model.addAttribute("voList", voList);
		
		return "admin/notice/list";
	}
	
	//FAQ 목록(화면)
	@GetMapping("faq")
	public String faq() {
		return "admin/faq/list";
	}
	
	//고객센터 목록(화면)
	@GetMapping("help")
	public String help() {
		return "admin/help/list";
	}
	
	//회원 정보 수정(화면)
	@GetMapping("edit")
	public String edit() {
		return "admin/member/edit";
	}
	
	//프로젝트 상세정보(화면)
	@GetMapping("prjDetail")
	public String prjDetail() {
		return "admin/project/detail";
	}
	
	//신고프로젝트 접수(화면)
	@GetMapping("projectCheck")
	public String projectCheck() {
		return "admin/deProject/check";
	}
	
	//공지사항 등록(화면)
	@GetMapping("noticeWrite")
	public String noticeWrite() {
		return "admin/notice/write";
	}
	
	//자주 묻는 질문(FAQ) 답변 등록(화면)
	@GetMapping("faqWrite")
	public String faqWrite() {
		return "admin/faq/write";
	}
	
	//고객센터 답변 등록(화면)
	@GetMapping("helpWrite")
	public String helpWrite() {
		return "admin/help/write";
	}
	

	
}
