package com.blank.app.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.notice.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	//[회원] 공지사항 목록 조회
	@GetMapping("list")
	public String list(Model model, HttpServletRequest req, HttpSession session, String p) {

		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");

		if (p == null) {
			p = "1";
		}

		int listCount = noticeService.listCount();
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		List<NoticeVo> voList = noticeService.selectList(map, pageVo);

		System.out.println(voList);
		
		model.addAttribute("voList", voList);
		session.setAttribute("voList", voList);
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);
		
		return "notice/list";
	}
	
	//[회원] 공지사항 상세페이지
	@GetMapping("detail")
	public String detail(NoticeVo noticeVo, HttpSession session, String no) {
		
		NoticeVo selectNotice = noticeService.selectOne(noticeVo);

//		List<String, String> pageList = noticeService.selectPageList();
		
		//이전페이지 다음페이지 조회
//		List<Map<String, String>> pageList = noticeService.selectPageList();
		
		if (selectNotice == null) {
			return "error";
		}
		
		session.setAttribute("selectNotice", selectNotice);
		session.setAttribute("noticeVo", noticeVo);

		
		return "notice/detail";
	}
	

}
