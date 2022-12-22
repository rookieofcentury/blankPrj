package com.blank.app.admin.goods;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.goods.service.GoodsService;
import com.blank.app.goods.vo.GoodsVo;

@Controller
@RequestMapping("admin/goods")
public class AdminGoodsController {
	
	@Autowired
	private GoodsService gs;
	
	// 굿즈 등록 (화면)
	@GetMapping("/add")
	public String add() {
		
		return "admin/goods/add";
		
	}
	
	// 굿즈 등록 (찐)
	@PostMapping("/add")
	public String add(GoodsVo vo, HttpServletRequest req) {
		
		int result = gs.add(vo);
		
		if(result == 1) {
			return "redirect:list";			
		} else {
			return "redirect:error.do";
		}
		
	}
	
	// 굿즈 등록 (화면)
	@GetMapping("/list")
	public String list(Model model) {
		
		List<GoodsVo> list = gs.adminList();
		model.addAttribute("list", list);
		return "admin/goods/list";
		
	}
	
	// 굿즈 수정 (화면)
	@GetMapping("/edit")
	public String edit(@RequestParam int no, Model model) {
		
		GoodsVo vo = gs.detail(no);
		model.addAttribute("vo", vo);
		return "admin/goods/edit";
		
	}
	
	// 굿즈 수정 (찐)
	@PostMapping("/edit")
	public String edit(Model model) {
		
		return "redirect:list";
		
	}
	
	// 굿즈 수정 (찐)
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam int no) {
		
		int result = gs.deleteGoods(no);
		if(result == 1) {
			return "delete success";
		} else {
			return "delete fail";
		}
				
		
	}

}
