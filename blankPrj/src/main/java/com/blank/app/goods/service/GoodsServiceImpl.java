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
	@Override
	public List<CartVo> getCartList(List<String> array) {
		return dao.selectCartList(sst, array);
	}



}
