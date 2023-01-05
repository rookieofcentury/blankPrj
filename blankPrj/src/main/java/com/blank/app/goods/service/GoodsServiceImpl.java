package com.blank.app.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.blank.app.admin.common.PageVo;
import com.blank.app.goods.dao.GoodsDao;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.PaymentVo;
import com.blank.app.goods.vo.ReviewVo;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private GoodsDao dao;

	// 굿즈 등록 페이지 category list 불러오기
	@Override
	public List<Map<String, String>> categoryOption() {
		return dao.selectCategoryList(sst);
	}
	
	// 굿즈 등록 페이지 category list 불러오기
	@Override
	public List<Map<String, String>> exhibitionOption() {
		return dao.selectExhibitionList(sst);
	}
	
	// 굿즈 등록 (찐)
	@Override
	public int add(GoodsVo vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goods", vo);
		map.put("thumbnail", vo.getThumbnail());
		
		return dao.insertGoods(sst, map);
		
	}

	// 리뷰 작성
	@Override
	public int reviewWrite(ReviewVo vo) {
		return dao.insertReview(sst, vo);
	}

	// admin 쪽 goodsList 불러올 때 전체 개수 조회
	@Override
	public int listCount() {
		return dao.countGoods(sst);
	}
	
	// admin 쪽 goodsList 불러오기
	@Override
	public List<GoodsVo> adminList(Map<String, String> map, PageVo pageVo) {
		return dao.selectAdminGoodsList(sst, map, pageVo);
	}
	
	// 해당 굿즈 번호로 해당되는 사진들 찾기
	@Override
	public List<String> findThumbnail(int no) {
		return dao.findThumbnail(sst, no);
	}

	// 굿즈 번호로 굿즈 한 개에 대한 정보 조회
	@Override
	public GoodsVo detail(int no) {
		return dao.detail(sst, no);
	}

	// 굿즈 삭제
	@Override
	public int deleteGoods(int no) {
		return dao.deleteGoods(sst, no);
	}

	// 굿즈 수정
	@Transactional
	public int edit(GoodsVo vo, @Param("delete") String[] delete) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", vo.getNo());
		map.put("thumbnail", vo.getThumbnail());
		
		int result1 = dao.editGoods(sst, vo);
		int result2 = 1;
		int result3 = 1;
		if(result1 != 0) {
			if(vo.getThumbnail() != null) {
				result2 = dao.insertAllThumbnail(sst, map);
			}
			if(delete != null) {
				result3 = dao.deleteThumbnail(sst, delete);
			}
		}
		
		return result1 * result2 * result3;
		
	}
	
	// 메인에서 굿즈 8 개 랜덤 출력하기
	public List<GoodsVo> selectMainGoodsList() {
		return dao.selectMainGoodsList(sst);
	}

	// 장바구니 화면에서 list 출력하기
	public List<CartVo> getCartList(List<String> array) {
		return dao.selectCartList(sst, array);
	}

	// 주문 완료
	@Transactional
	public int insertOrder(List<CartVo> orderList, PaymentVo pay) {
		
		if(pay.getStatus().equals("paid")) {
			pay.setStatus("P"); // 기본 값
		} else if(pay.getStatus().equals("ready")) {
			pay.setStatus("R");
		} else {
			pay.setStatus("F");
		}
		
		Map<String, Object> list = new HashMap<String, Object>();
		list.put("orderList", orderList);
		list.put("pay", pay);
		
		int result1 = dao.insertOrder(sst, list);
		int result2 = 2;
		
		if(Integer.parseInt(pay.getUsepoint()) > 0) {
			result2 = dao.updatePoint(sst, pay);
		}
		
		return result1 * result2;
	}

	// 주문 화면 도출에 필요한 no 받아 오기
	public PaymentVo selectPaymentVoByNo(PaymentVo pay) {
		
		PaymentVo vo = dao.selectPaymentVoByNo(sst, pay);
		
		if(vo.getStatus().equals("P")) {
			vo.setStatus("결제 완료");
		} else if(vo.getStatus().equals("R")) {
			vo.setStatus("결제 미확인");
		} else {
			vo.setStatus("결제 취소");
		}
		
		return vo;
	}

	// 해당 굿즈의 리뷰 수 확인하기
	public int findReviewCnt(int no) {
		return dao.selectReviewCnt(sst, no);
	}

	// 리뷰 리스트 받기
	public List<ReviewVo> reviewListbyGNo(int no, PageVo pageVo, String mno, String standard) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("mno", mno);
		map.put("standard", standard);
		
		return dao.selectReviewListbyGNo(sst, map, pageVo);
		
	}

	// 리뷰 개수, 리뷰 스코어
	public List<Map<String, Object>> findReviewTotal(int no) {
		return dao.selectTotalListbyGNo(sst, no);
	}


}
