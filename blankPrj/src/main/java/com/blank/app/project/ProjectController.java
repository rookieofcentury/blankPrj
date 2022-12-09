package com.blank.app.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("project")
@Controller
public class ProjectController {

	@GetMapping
	public String project() {
		return "project/detail/info";
	}
	
	@GetMapping("news")
	public String prjNews() {
		return "project/detail/news";
	}
	
	@GetMapping("review")
	public String prjReview() {
		return "project/detail/review";
	}
}
