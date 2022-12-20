package com.blank.app.goods.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Override
	public int insertGoods(SqlSessionTemplate sst, GoodsVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReview(SqlSessionTemplate sst, ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
