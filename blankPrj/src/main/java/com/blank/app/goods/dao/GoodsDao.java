package com.blank.app.goods.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@Repository
public interface GoodsDao {

	int insertGoods(SqlSessionTemplate sst, GoodsVo vo);

	int insertReview(SqlSessionTemplate sst, ReviewVo vo);

}
