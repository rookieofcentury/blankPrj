package com.blank.app.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("goods")
@Controller
public class GoodsController {
	
	// 굿즈 메인 화면 도출
	@RequestMapping
	public String goodsMain() {
		return "goods/main";
	}
	
	// 굿즈 상세 화면 도출
	@RequestMapping("/detail")
	public String goodsDetail() {
		return "goods/detail";
	}

}
