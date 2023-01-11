package com.blank.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.project.service.ProjectService;
import com.blank.app.project.vo.ProjectVo;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private ProjectService ps;
	
	@RequestMapping("")
	public String home(HttpSession session) {
		
		List<ProjectVo> popularList = ps.mainPopularPrjList();
		List<ProjectVo> newList = ps.mainNewPrjList();
		List<ProjectVo> randomList = ps.mainRandomList();
		
		session.setAttribute("randomList", randomList);
		session.setAttribute("popularList", popularList);
		session.setAttribute("newList", newList);
		
		return "home";
		
	}
	
}
