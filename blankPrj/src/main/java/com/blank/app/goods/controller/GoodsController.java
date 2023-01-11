package com.blank.app.goods.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.common.file.FileUploader;
import com.blank.app.goods.service.GoodsService;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.PaymentVo;
import com.blank.app.goods.vo.ReviewVo;
import com.blank.app.member.vo.AddressVo;
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
	public String goodsDetail(@RequestParam int no, HttpSession session) {

		// detail 정보 받아 오기
		GoodsVo vo = gs.detail(no);

		// no로 첨부파일 테이블 한 번 더 다녀오고 set 해 주기
		List<String> thumbnail = gs.findThumbnail(no);
		vo.setThumbnail(thumbnail);
		
		// jsp로 데이터 보내 주기
		session.setAttribute("goods", vo);

		return "goods/detail";

	}
	
	// 리뷰 화면 도출
	@GetMapping("/review")
	public String review(String no, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String mno = "0";
		
		if(loginMember != null) {
			mno = loginMember.getNo();			
		}
		
		ReviewVo vo = gs.findReviewByNo(no, mno);
		
		model.addAttribute("review", vo);
		
		return "goods/review";
		
	}
	
	// 리뷰 수정 화면
	@GetMapping("/review/edit")
	public String reviewEdit(String no, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String mno = loginMember.getNo();
		
		ReviewVo vo = gs.findReviewByNo(no, mno);
		
		model.addAttribute("review", vo);
		
		return "goods/reviewEdit";
		
	}
	
	// 리뷰 수정 (찐)
	@PostMapping("/review/edit")
	public String reviewEdit(ReviewVo vo, HttpServletRequest req) throws IllegalStateException, IOException {
		
		if(vo.getReviewFile() != null) {
			boolean isEmpty = vo.getReviewFile().isEmpty();			
		}
		
		// 파일 저장
		String file = null;
		if (!vo.isEmpty()) {
			file = FileUploader.upload(req, vo);
			vo.setFileName(file);
		}
		
		int result = gs.reviewEdit(vo);
		
		if(result == 0) {
			return "";
		}
		
		return "redirect:/goods/review?no=" + vo.getNo();
		
	}
	
	// 리뷰 수정 - 파일 삭제
	@RequestMapping("/review/attachment/delete")
	@ResponseBody
	public String deleteReviewAtt(String no) {
		
		int result = gs.deleteAtt(no);
		
		if(result == 0) {
			return "실패";
		}
		
		return "성공";
		
	}
	
	// 리뷰 삭제
	@RequestMapping("/review/delete")
	@ResponseBody
	public String reviewDelete(String no) {
		
		int result = gs.reviewDelete(no);
		
		if(result == 1) {
			return "성공";
		} else {
			return "실패";
		}
		
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
	public String reviewWrite(ReviewVo vo, HttpServletRequest req) throws IllegalStateException, IOException {
		
		System.out.println(vo);
		
		if(vo.getReviewFile() != null) {
			boolean isEmpty = vo.getReviewFile().isEmpty();			
		}
		
		// 파일 저장
		String file = null;
		if (!vo.isEmpty()) {
			file = FileUploader.upload(req, vo);
			vo.setFileName(file);
		}

		int result = gs.reviewWrite(vo);

		if (result == 0) {
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
	public AddressVo getAddress(String no, HttpSession session) {
		
		AddressVo vo = gs.getAddressByNo(no);
	
		return vo;

	}
	
	// 주소 변경하기
	@PostMapping("/payment/address/change")
	@ResponseBody
	public int changeAddress(String no, String name, String phone, String address1, String address2, String address3, String message, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("name", name);
		map.put("phone", phone);
		map.put("address1", address1);
		map.put("address2", address2);
		map.put("address3", address3);
		map.put("message", message);
		
		int result = gs.addressChange(map);
		
		return result;
		
	}

	// 굿즈 결제 완료
	@PostMapping("/order")
	public String paymentComplete(PaymentVo pay, HttpSession session, Model model) {
		
		// payDate 문자열로 바꿔 주기
		String dateStr = getTimestampToDate(pay.getPayDate());
		pay.setPayDate(dateStr);
		
		List<CartVo> orderList = (List<CartVo>) session.getAttribute("orderList");
		int result = gs.insertOrder(orderList, pay);
				
		if(result == 0) {
			return "error";
		}
		
		PaymentVo vo = gs.selectPaymentVoByNo(pay);
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String usepoint = pay.getUsepoint();
		if(usepoint != "0") {
			loginMember.setPoint(Integer.toString(Integer.parseInt(loginMember.getPoint()) - Integer.parseInt(usepoint)));			
		}
		
		session.removeAttribute("cart");

		return "redirect:/goods/order?no=" + vo.getNo();

	}
	
	@GetMapping("/order")
	public String order(PaymentVo pay, Model model) {
		
		PaymentVo vo = gs.selectPaymentVoByNo(pay);
		
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
		
		List<GoodsVo> fourList = new ArrayList<GoodsVo>();
		
		for (int k = 0; k < 4; k++) {
			GoodsVo goods = voList.get(k);
			fourList.add(goods);
		}

		// jsp로 데이터 보내 주기
		model.addAttribute("pay", vo);
		model.addAttribute("fourList", fourList);
		
		return "goods/order";
	}
	

	// 굿즈 재고 알림 약관 동의 화면 도출
	@GetMapping("/stockalert")
	public String stockalert(HttpSession session) {

		return "goods/stockalert";

	}
	
	// 재고 알림 등록 시 문자 보내기
	@PostMapping("/stockalert")
	@ResponseBody
	public String sendStockalert(HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		GoodsVo vo = (GoodsVo) session.getAttribute("goods");
		
		// 문자 보내기 위해 전화번호 - 제거해 주기
		String phone = loginMember.getPhone().replace("-", "");
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSODJ86EEF5BO6Z", "RRSKDJP9NP5WPHBH8JJUBO2SX5I6I7KC", "https://api.solapi.com");
		Message message = new Message();
		message.setFrom("01043524860");
		message.setTo(phone);
		message.setText("[BLANK] " + vo.getName() + "의 재고 알림이 등록되었습니다!");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", vo.getNo());
		map.put("phone", loginMember.getPhone());
		
		// DB 다녀오기
		int result = gs.insertStockAlert(map);

		// DB insert 성공하면 문자 전송
		if(result == 1) {
			
			try {
				messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {
				// 발송에 실패한 메시지 목록 확인
				System.out.println(exception.getFailedMessageList());
				System.out.println(exception.getMessage());
			} catch (Exception exception) {
				System.out.println(exception.getMessage());
			}

		}
		
		if(result == 0) {return "fail";}
		
		return "success";
		
	}
	
	@PostMapping("/stockAlert/check")
	@ResponseBody
	public String checkStockAlert(String no, String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("phone", phone);
		
		int result = gs.selectStockAlert(map);
		
		if(result == 0) {
			return "false";			
		} else {
			return "true";
		}
		
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
