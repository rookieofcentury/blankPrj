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
	
	// 굿즈 장바구니 화면 도출
	@RequestMapping("/basket")
	public String goodsBasket() {
		return "goods/basket";
	}
	
	// 굿즈 리뷰 작성 화면 도출
	@GetMapping("/review/write")
	public String reviewWrite() {
		return "goods/review";
	}
	
	// 굿즈 결제 화면 도출
	@GetMapping("/payment")
	public String payment() {
		return "goods/payment";
	}

	// 굿즈 주문 완료 화면 도출
	@GetMapping("/order")
	public String order() {
		return "goods/order";
	}
	
	// 굿즈 재고 알림 약관 동의 화면 도출
	@GetMapping("/stockalert")
	public String stockalert() {
		return "goods/stockalert";
	}

}
