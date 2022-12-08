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
	
}
