package com.blank.app.admin.goods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.common.file.FileUploader;
import com.blank.app.goods.service.GoodsService;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.member.vo.MemberVo;

import lombok.extern.java.Log;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
@RequestMapping("admin/goods")
public class AdminGoodsController {

	@Autowired
	private GoodsService gs;

	// 굿즈 등록 (화면)
	@GetMapping("/add")
	public String add(Model model) {
		
		List<Map<String, String>> categoryList = gs.categoryOption();
		List<Map<String, String>> exhibitionList = gs.exhibitionOption();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("exhibitionList", exhibitionList);

		return "admin/goods/add";

	}

	// 굿즈 등록 (찐)
	@PostMapping("/add")
	public String add(GoodsVo vo, HttpServletRequest req) {

		boolean isEmpty = vo.getThumbnailFile().get(0).isEmpty();

		// 파일 저장
		List<String> list = null;
		if (!vo.isEmpty()) {
			list = FileUploader.upload(req, vo);
		}
		
		vo.setThumbnail(list);

		int result = gs.add(vo);
		
		if(result == 0) {
			return "redirect:error";
		}

		return "redirect:list";
		
	}

	// 굿즈 리스트 (화면)
	@GetMapping("/list")
	public String list(Model model, HttpServletRequest req, String p) {
		
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");
		
		if(p == null) {
			p = "1";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);

		int listCount = gs.listCount(map);
		int currentPage = Integer.parseInt(p);
		int boardLimit = 10;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		
		List<GoodsVo> list = gs.adminList(map, pageVo);
	
		model.addAttribute("listCount", listCount);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		
		return "admin/goods/list";

	}

	// 굿즈 수정 (화면)
	@GetMapping("/edit")
	public String edit(@RequestParam int no, Model model) {
		
		List<Map<String, String>> categoryList = gs.categoryOption();
		List<Map<String, String>> exhibitionList = gs.exhibitionOption();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("exhibitionList", exhibitionList);

		GoodsVo vo = gs.detail(no);
		List<String> thumbnail = gs.findThumbnail(no);
		vo.setThumbnail(thumbnail);
		
		model.addAttribute("vo", vo);
		
		return "admin/goods/edit";

	}

	// 굿즈 수정 (찐)
	@PostMapping("/edit")
	public String edit(GoodsVo vo, @Param("delete") String[] delete, HttpServletRequest req) {

		boolean isEmpty = vo.getThumbnailFile().get(0).isEmpty();

		// 파일 저장
		List<String> list = null;
		if (!vo.isEmpty()) {
			list = FileUploader.upload(req, vo);
			vo.setThumbnail(list);
		}
		
		int result = gs.edit(vo, delete);
		System.out.println(result);
		
		if(result == 0) {
			return "redirect:error";
		}
		
		return "redirect:list";

	}

	// 굿즈 수정 (찐)
	@PostMapping("/delete")
	public String delete(HttpSession session, @RequestParam("goodsNo") int goodsNo) {

		int result = gs.deleteGoods(goodsNo);
		
		if (result == 0) {
			session.setAttribute("msg", "삭제에 실패했습니다. 다시 시도해 주세요!");
			return "delete fail";
		}
		
		session.setAttribute("msg", "성공적으로 삭제되었습니다!");
		
		return "redirect:list";

	}
	
	@PostMapping("/stockAlert")
	@ResponseBody
	public String stockAlert(String no, String name) {
		
		// DB 가서 전화번호 List 가져오기
		List<String> list = gs.selectPhoneList(no);
		
		List<Message> messageList = new ArrayList<Message>();
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSODJ86EEF5BO6Z", "RRSKDJP9NP5WPHBH8JJUBO2SX5I6I7KC", "https://api.solapi.com");

		for(String x : list) {
			Message message = new Message();
			message.setFrom("01043524860");
			message.setTo(x);
			message.setText("[BLANK] " + name + "의 재고가 들어왔습니다! 블랭크로 쇼핑하러 오세요! ﻿╰(*´︶`*)╯♡");
			messageList.add(message);
		}
		
		// 등록된 거 있을 때만
		if(list.size() > 0) {
			
			try {
				messageService.send(messageList);
			} catch (NurigoMessageNotReceivedException exception) {
				// 발송에 실패한 메시지 목록 확인
				System.out.println(exception.getFailedMessageList());
				System.out.println(exception.getMessage());
			} catch (Exception exception) {
				System.out.println(exception.getMessage());
			}
			
			int result = gs.deletePhoneList(no);

		}

		return "발신 성공";
		
	}

}
