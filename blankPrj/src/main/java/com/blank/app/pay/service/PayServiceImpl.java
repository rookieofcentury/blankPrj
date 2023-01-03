package com.blank.app.pay.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.pay.dao.PayDao;
import com.blank.app.pay.vo.PayVo;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private PayDao dao;

	@Override
	public int insertCard(PayVo vo) {
		return dao.insertCard(sst, vo);
		
	}

	@Override
	public int deleteCard(PayVo vo) {
		
		return dao.deleteCard(sst, vo);
	}

	@Override
	public int cardCount(String mNo) {
		
		return dao.cardCount(sst, mNo);
	}
}
