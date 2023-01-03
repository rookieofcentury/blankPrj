package com.blank.app.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.pay.vo.PayVo;

public interface PayDao {

	public int insertCard(SqlSessionTemplate sst, PayVo vo);

	public int deleteCard(SqlSessionTemplate sst, PayVo vo);

	public int cardCount(SqlSessionTemplate sst, String mNo);

}
