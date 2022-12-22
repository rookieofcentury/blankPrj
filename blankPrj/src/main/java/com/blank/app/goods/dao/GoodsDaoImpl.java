package com.blank.app.goods.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	// 굿즈 등록하기 - insertGoods
	@Override
	public int insertGoods(SqlSessionTemplate sst, GoodsVo vo) {
		return sst.insert("goodsMapper.insertGoods", vo);
	}

	// 리뷰 작성하기 - insertReview
	@Override
	public int insertReview(SqlSessionTemplate sst, ReviewVo vo) {
		return sst.insert("goodsMapper.insertReview", vo);
	}

	// admin 페이지 goods list 조회 - selectAdminGoodsList
	@Override
	public List<GoodsVo> selectAdminGoodsList(SqlSessionTemplate sst) {
		return sst.selectList("goodsMapper.selectAdminGoodsList");
	}
	
	// 상세 페이지 - detail
	@Override
	public GoodsVo detail(SqlSessionTemplate sst, int no) {
		return sst.selectOne("goodsMapper.detail", no);
	}

	// 굿즈 삭제하기 - deleteGoods
	@Override
	public int deleteGoods(SqlSessionTemplate sst, int no) {
		return sst.update("goodsMapper.deleteGoods", no);
	}

}
