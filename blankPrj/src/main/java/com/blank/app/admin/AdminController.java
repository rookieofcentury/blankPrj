package com.blank.app.admin;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("admin")
@Controller
public class AdminController {

	//관리자 로그인(화면)
	@GetMapping("login")
	public String login() {
		return "admin/admin/login";
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
	
	//공지사항 목록(화면)
	@GetMapping("notice")
	public String notice() {
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
	
}
