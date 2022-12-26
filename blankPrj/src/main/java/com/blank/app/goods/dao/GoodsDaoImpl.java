package com.blank.app.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.blank.app.admin.common.PageVo;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@Repository
public class GoodsDaoImpl implements GoodsDao {
	
	// 굿즈 등록 페이지 Category List 찾기
	@Override
	public List<Map<String, String>> selectCategoryList(SqlSessionTemplate sst) {
		return sst.selectList("goodsMapper.selectCategoryList");
	}
	
	// 굿즈 등록 페이지 Exhibition List 찾기
	@Override
	public List<Map<String, String>> selectExhibitionList(SqlSessionTemplate sst) {
		return sst.selectList("goodsMapper.selectExhibitionList");
	}

	// 굿즈 등록하기 - insertGoods
	@Override
	public int insertGoods(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("goodsMapper.insertGoods", map);
	}

	// 리뷰 작성하기 - insertReview
	@Override
	public int insertReview(SqlSessionTemplate sst, ReviewVo vo) {
		return sst.insert("goodsMapper.insertReview", vo);
	}

	// admin 페이지 goods list Count - countGoods
	@Override
	public int countGoods(SqlSessionTemplate sst) {
		return sst.selectOne("goodsMapper.goodsCnt");
	}
	
	// admin 페이지 goods list 조회 - selectAdminGoodsList
	@Override
	public List<GoodsVo> selectAdminGoodsList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv) {
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("goodsMapper.selectAdminGoodsList", map, rb);
	}
	
	// 해당 굿즈 번호로 해당되는 사진들 찾기
	@Override
	public List<String> findThumbnail(SqlSessionTemplate sst, int no) {
		return sst.selectList("goodsMapper.findThumbnail", no);
	}
	
	// 굿즈 번호로 굿즈 한 개에 대한 정보 조회
	@Override
	public GoodsVo detail(SqlSessionTemplate sst, int no) {
		return sst.selectOne("goodsMapper.detail", no);
	}

	// 굿즈 삭제하기 - deleteGoods
	@Override
	public int deleteGoods(SqlSessionTemplate sst, int no) {
		return sst.update("goodsMapper.deleteGoods", no);
	}

	// 굿즈 수정하기
	@Override
	public int editGoods(SqlSessionTemplate sst, GoodsVo vo) {
		return sst.update("goodsMapper.editGoods", vo);
	}

	// 굿즈 수정하기 - Thumbnail 새로 받은 거 넣어 주기
	@Override
	public int insertAllThumbnail(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("goodsMapper.insertThumbnail", map);
	}

	// 굿즈 수정하기 - 사진 삭제
	public int deleteThumbnail(SqlSessionTemplate sst, @Param("delete") String[] delete) {
		return sst.delete("goodsMapper.deleteThumbnail", delete);
	}
	
	// 메인에서 굿즈 8 개 랜덤 출력하기
	public List<GoodsVo> selectMainGoodsList(SqlSessionTemplate sst) {
		return sst.selectList("goodsMapper.mainGoodsList");
	}

	// 장바구니 list 출력
	public List<CartVo> selectCartList(SqlSessionTemplate sst, List<String> array) {
		return sst.selectList("goodsMapper.getCartList", array);
	}



}
