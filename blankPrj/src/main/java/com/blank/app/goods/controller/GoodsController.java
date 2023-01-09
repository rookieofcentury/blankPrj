package com.blank.app.goods.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.goods.service.GoodsService;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.PaymentVo;
import com.blank.app.goods.vo.ReviewVo;
import com.blank.app.member.vo.MemberVo;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RequestMapping("goods")
@Controller
public class GoodsController {

	@Autowired
	private GoodsService gs;

	// 굿즈 메인 화면 도출
	@RequestMapping
	public String goodsMain(Model model, HttpSession session) {

		// 세션에 장바구니 없으면 장바구니 생성
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<String, Integer>();
			session.setAttribute("cart", cart);
		}

		// 8 개 무작위로 받아와서 리스트 생성
		List<GoodsVo> voList = gs.selectMainGoodsList();

		// 위 list에서 no(번호)만 담긴 리스트 생성
		List<String> noList = new ArrayList<String>();

		// for문 돌려서 각각 이미지 List 생성해 주기
		for (int i = 0; i < voList.size(); i++) {
			String no = voList.get(i).getNo();
			noList.add(no);

			for (String n : noList) {
				List<String> thumbnail = gs.findThumbnail(Integer.parseInt(n));
				voList.get(i).setThumbnail(thumbnail);
			}
		}

		// jsp로 데이터 보내 주기
		model.addAttribute("eightList", voList);

		return "goods/main";

	}
	
	// 굿즈 검색
	@RequestMapping("/search")
	public String goodsSearch(String category, String goodsKeyword, String p, String standard, Model model) {
	
		if(p == null) {
			p = "1";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", goodsKeyword);
		map.put("standard", standard);
		
		int listCount = gs.searchListCount(map);
		int currentPage = Integer.parseInt(p);
		int boardLimit = 12;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<GoodsVo> list = gs.searchGoodsList(map, pageVo);
		
		// 위 list에서 no(번호)만 담긴 리스트 생성
		List<String> noList = new ArrayList<String>();

		// for문 돌려서 각각 이미지 List 생성해 주기
		for (int i = 0; i < list.size(); i++) {
			String no = list.get(i).getNo();
			noList.add(no);

			for (String n : noList) {
				List<String> thumbnail = gs.findThumbnail(Integer.parseInt(n));
				list.get(i).setThumbnail(thumbnail);
			}
		}
	
		model.addAttribute("listCount", listCount);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("goodsList", list);
		model.addAttribute("category", category);
		model.addAttribute("keyword", goodsKeyword);
		model.addAttribute("standard", standard);
		
		return "goods/search";
		
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
	
	// 이 굿즈에 리뷰 총 몇 개임?
	@PostMapping("/review/cnt")
	@ResponseBody
	public List<Map<String, Object>> reviewCnt(int no) {
		
		List<Map<String, Object>> list = gs.findReviewTotal(no);
		
		return list;
		
	}
	
	// 리뷰 좋아요 추가
	@PostMapping("/review/like/add")
	@ResponseBody
	public String reviewLike(String no, String mno) {
		
		int result = gs.reviewLike(no, mno);
		
		if(result == 0) {
			return "실패";
		}
		
		return "좋아요 성공";
		
	}
	
	// 리뷰 좋아요 삭제
	@PostMapping("/review/like/cancel")
	@ResponseBody
	public String reviewLikeCancel(String no, String mno) {
		
		int result = gs.reviewLikeCancel(no, mno);
		
		if(result == 0) {
			return "실패";
		}
		
		return "좋아요 취소 성공";
		
	}
	
	// ajax로 list 받아서 넘기기
	@PostMapping("/review/list")
	@ResponseBody
	public List<ReviewVo> reviewList(int no, String p, String standard, String mno, HttpSession session) {
		
		if(p == null) {
			p = "1";
		}
		
		int listCount = gs.findReviewCnt(no);
		int currentPage = Integer.parseInt(p);
		int boardLimit = 3;
		int pageLimit = 5;
		PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		// 리뷰 리스트 정보 받기
		List<ReviewVo> voList = gs.reviewListbyGNo(no, pageVo, mno, standard);
		
		session.setAttribute("listCount", listCount);
		session.setAttribute("pageVo", pageVo);
		
		return voList;
		
	}

	// 굿즈 장바구니 화면 도출
	@RequestMapping("/basket")
	public String goodsBasket(HttpSession session) {

		// session으로부터 cart 받기
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

		// key List 담아 줄 array 만들기
		List<String> array = new ArrayList<String>();
		List<CartVo> cartList = null;

		if (cart != null && cart.size() > 0) {
			// map에서 key 값만 뽑아서 list 추출
			Iterator<String> keys = cart.keySet().iterator();
			while (keys.hasNext()) {
				String key = keys.next();
				array.add(key);
			}

			cartList = gs.getCartList(array);

			for (CartVo item : cartList) {
				List<String> thumbnail = gs.findThumbnail(Integer.parseInt(item.getNo()));
				item.setThumbnail(thumbnail);
			}

			session.setAttribute("cartList", cartList);

		} else {

			cartList = new ArrayList<CartVo>();
			session.setAttribute("cartList", cartList);

		}

		return "goods/basket";

	}

	// 굿즈 장바구니 물품 추가
	@RequestMapping("/basket/add")
	@ResponseBody
	public String basketAdd(@Param("no") String no, @Param("cnt") int cnt, HttpSession session) {

		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

		// cart에 no라는 key가 있으면 value에 수만큼 추가해 주기
		if (cart.containsKey(no)) {
			cart.put(no, cart.get(no) + cnt);
		} else {
			cart.put(no, cnt);
		}
		session.setAttribute("cart", cart);

		return "성공적으로 장바구니에 담겼습니다!";

	}

	// 굿즈 장바구니 물품 삭제
	@RequestMapping("/basket/delete")
	@ResponseBody
	public String basketDelete(@RequestParam("chbox[]") String[] chbox, HttpSession session) {

		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

		// 체크된 만큼 map에서 key 지워 주기
		for (String x : chbox) {
			cart.remove(x);
		}
		session.setAttribute("cart", cart);

		return "정상적으로 삭제되었습니다!";

	}

	// 굿즈 장바구니 물품 변경
	@RequestMapping("/basket/change")
	@ResponseBody
	public String basketChange(String no, String quantity, HttpSession session) {

		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

		cart.put(no, Integer.parseInt(quantity));
		session.setAttribute("cart", cart);

		return "change!";

	}

	// 굿즈 리뷰 작성 후 띄울 alert message
	@ResponseBody
	@PostMapping("/review/write")
	public String reviewWrite(ReviewVo vo) {

		int result = gs.reviewWrite(vo);

		if (result != 1) {
			return "fail";
		}
		
		return "success";

	}

	// 굿즈 결제 화면 도출
	@RequestMapping("/payment")
	public String payment(String[] no, String quantity, HttpSession session) {

		// cart 데이터 조회할 때 로직이 파라미터 list로 넘겨 주기 때문에 변환해 줌
		List<String> noList = new ArrayList<String>();

		for (int i = 0; i < no.length; i++) {
			noList.add(no[i]);
		}

		// 선택 상품과 전체 상품 주문 각각 다르게 처리하기 위해 cnt는 Map(cart)에서 따로 받아 오기
		List<Integer> cntList = null;
		List<CartVo> orderList = null;

		// 바로 구매일 때는 다르게 처리해 주기 위해 장바구니에서 넘어왔을 때는 (cnt == null) 일 때를 처리해 주자
		if (quantity == null) {

			Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

			orderList = gs.getCartList(noList);

			// 받은 수량 배열로 바꿔 주기
			cntList = new ArrayList<Integer>();

			for (String x : noList) {
				int cnt = cart.get(x);
				cntList.add(cnt);
			}

			// DB 다녀와서 썸네일과 수량 set
			for (CartVo item : orderList) {
				List<String> thumbnail = gs.findThumbnail(Integer.parseInt(item.getNo()));
				item.setThumbnail(thumbnail);
			}
			
			for (int i = 0; i < cntList.size(); i++) {
				orderList.get(i).setCnt(Integer.toString(cntList.get(i)));
			}

		} else {

			// 바로 구매
			orderList = gs.getCartList(noList);
			
			for (CartVo item : orderList) {
				item.setCnt(quantity);
				List<String> thumbnail = gs.findThumbnail(Integer.parseInt(item.getNo()));
				item.setThumbnail(thumbnail);
			}

		}

		session.setAttribute("orderList", orderList);

		return "goods/payment";

	}
	
	// 주소 받아 오기
	@PostMapping("/payment/address")
	@ResponseBody
	public Map<String, String> getAddress(String no, HttpSession session) {
		
		Map<String, String> map = gs.getAddressByNo(no);
		
		return map;
		
	}

	// 굿즈 결제 완료
	@PostMapping("/order")
	public String paymentComplete(PaymentVo pay, HttpSession session, Model model) {
		
		String dateStr = getTimestampToDate(pay.getPayDate());
		pay.setPayDate(dateStr);
		pay.setNo(null);
		
		List<CartVo> orderList = (List<CartVo>) session.getAttribute("orderList");
		int result = gs.insertOrder(orderList, pay);
		
		if(result == 0) {
			return "error";
		}
		
		PaymentVo vo = gs.selectPaymentVoByNo(pay);
		
		model.addAttribute("pay", vo);
		session.removeAttribute("cart");

		return "goods/order";

	}
	
	// 화면 (주문)
	@GetMapping("/order")
	public String order() {
		return "goods/order";
	}

	// 굿즈 재고 알림 약관 동의 화면 도출
	@GetMapping("/stockalert")
	public String stockalert() {

		return "goods/stockalert";

	}
	
	@PostMapping("/stockalert")
	@ResponseBody
	public String stockalert(HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String phone = loginMember.getPhone().replace("-", "");
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("API 키 입력", "API 시크릿 키 입력", "https://api.solapi.com");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01043524860");
		message.setTo(phone);
		message.setText("SMS는 한글 45자, 영자 90자까지 입력할 수 있습니다.");

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}		
		
		return "";
		
	}
	
	/* import 날짜 바꿔 주기 */
	private static String getTimestampToDate(String timestampStr) {
	    long timestamp = Long.parseLong(timestampStr);
	    Date date = new java.util.Date(timestamp*1000L); 
	    SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9")); 
	    String formattedDate = sdf.format(date);
	    return formattedDate;
	}

}
