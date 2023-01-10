package com.blank.app.pay.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.pay.dao.PayDao;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ItemVo;
import com.blank.app.project.vo.ProjectVo;

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

	@Override
	public ProjectVo selectPrjByNo(String pNo) {
		return dao.selectPrjByNo(sst, pNo);
	}

	@Override
	public ItemVo selectSetByNo(String setNo) {
		return dao.selectSetByNo(sst, setNo);
	}

	@Override
	public int insertPayList(PayListVo vo) {
		return dao.insertPayList(sst, vo);
	}
}
