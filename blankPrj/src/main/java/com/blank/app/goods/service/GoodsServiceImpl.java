package com.blank.app.goods.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.goods.dao.GoodsDao;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private GoodsDao dao;

	// 굿즈 등록
	@Override
	public int add(GoodsVo vo) {
		return dao.insertGoods(sst, vo);
	}

	// 리뷰 작성
	@Override
	public int reviewWrite(ReviewVo vo) {
		return dao.insertReview(sst, vo);
	}

}
