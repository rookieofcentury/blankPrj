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
	
}
