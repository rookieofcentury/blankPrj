package com.blank.app.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("help")
public class HelpController {

	//고객센터 메인(화면)
	@GetMapping("main")
	public String main() {
		return "help/main";
	}
	
	//검색 결과(화면)
	@GetMapping("search")
	public String search() {
		return "help/search/detail";
	}
	
}
