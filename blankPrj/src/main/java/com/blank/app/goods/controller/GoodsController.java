package com.blank.app.goods.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.goods.service.GoodsService;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@RequestMapping("goods")
@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService gs;
	
	// 굿즈 메인 화면 도출
	@RequestMapping
	public String goodsMain(Model model, HttpSession session) {
		
		// 세션에 장바구니 없으면 장바구니 생성
		Map<String, Integer> cart = (Map<String, Integer>)session.getAttribute("cart");
		if(cart == null) {
			cart = new HashMap<String, Integer>();
			session.setAttribute("cart", cart);
		}
		
		// 8 개 무작위로 받아와서 리스트 생성
		List<GoodsVo> voList = gs.selectMainGoodsList();
		
		// 위 list에서 no(번호)만 담긴 리스트 생성
		List<String> noList = new ArrayList<String>();
		
		// for문 돌려서 각각 이미지 List 생성해 주기
		for(int i = 0; i < voList.size(); i++) {
			String no = voList.get(i).getNo();
			noList.add(no);

			for(String n : noList) {
				List<String> thumbnail = gs.findThumbnail(Integer.parseInt(n));
				voList.get(i).setThumbnail(thumbnail);
			}
		}
		
		// jsp로 데이터 보내 주기
		model.addAttribute("eightList", voList);
		
		return "goods/main";
		
	}
	
	// 굿즈 상세 화면 도출
	@RequestMapping("/detail")
	public String goodsDetail(@RequestParam int no, Model model) {
		
		// detail 정보 받아 오기
		GoodsVo vo = gs.detail(no);
		
		// no로 첨부파일 테이블 한 번 더 다녀오고 set 해 주기
		List<String> thumbnail = gs.findThumbnail(no);
		vo.setThumbnail(thumbnail);
		
		// jsp로 데이터 보내 주기
		model.addAttribute("goods", vo);
		
		return "goods/detail";
		
	}
	
	// 굿즈 장바구니 화면 도출
	@RequestMapping("/basket")
	public String goodsBasket(HttpSession session) {
		
		// session으로부터 cart 받기
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		System.out.println(cart);
		
		// key List 담아 줄 array 만들기
		List<String> array = new ArrayList<String>();
		
		if(cart != null && cart.size() > 0) {
			// map에서 key 값만 뽑아서 list 추출
			Iterator<String> keys = cart.keySet().iterator();
			while (keys.hasNext()){
				String key = keys.next();
				array.add(key);
			}
			
			List<CartVo> cartList = gs.getCartList(array);
			session.setAttribute("cartList", cartList);
		}
		
		return "goods/basket";
		
	}
	
	// 굿즈 장바구니 화면 도출
	@RequestMapping("/basket/add")
	@ResponseBody
	public String basketAdd(@Param("no") String no, @Param("cnt") int cnt, HttpSession session) {
		
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		if(cart.containsKey(no)) {
			cart.put(no, cart.get(no) + cnt);
		} else {
			cart.put(no, cnt);
		}
		session.setAttribute("cart", cart);
		System.out.println(cart);
		
		return "success";
		
	}
	
	// 굿즈 리뷰 작성 후 띄울 alert message
	@ResponseBody
	@PostMapping("/review/write")
	public String reviewWrite(ReviewVo vo) {
		
		int result = gs.reviewWrite(vo);
		
		if(result == 1) {
			return "success";
		} else {
			return "fail";
		}
		
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
