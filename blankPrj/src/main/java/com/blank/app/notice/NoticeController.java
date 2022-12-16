package com.blank.app.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {

	//[회원] 공지사항(화면)
	@GetMapping("list")
	public String list() {
		return "notice/list";
	}
	
}
