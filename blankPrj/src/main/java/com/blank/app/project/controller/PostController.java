package com.blank.app.project.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.blank.app.project.vo.ProjectVo;

@Controller
public class PostController {

	@GetMapping("post/save")
	public String postSave(HttpSession session, ProjectVo vo) {
		System.out.println("Dd");
		return "redirect:/project/created";	//작성중 링크로 보내주기
	}
	
	@GetMapping("post/request")
	public String postRequest(HttpSession session, ProjectVo vo) {
		return "redirect:/project/created";	//심사중 링크로 보내주기
	}
}
