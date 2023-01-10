package com.blank.app.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ItemVo;
import com.blank.app.project.vo.ProjectVo;

@Repository
public class PayDaoImpl implements PayDao{

	@Override
	public int insertCard(SqlSessionTemplate sst, PayVo vo) {
		return sst.insert("payMapper.insertCard", vo);
	
	}

	@Override
	public int deleteCard(SqlSessionTemplate sst, PayVo vo) {
		return sst.delete("payMapper.deleteCard", vo);
	}

	@Override
	public int cardCount(SqlSessionTemplate sst, String mNo) {
		
		return sst.selectOne("payMapper.countCard", mNo);
	}


	@Override
	public ProjectVo selectPrjByNo(SqlSessionTemplate sst, String pNo) {
		return sst.selectOne("payMapper.selectPrjByNo", pNo);
	}

	@Override
	public ItemVo selectSetByNo(SqlSessionTemplate sst, String setNo) {
		return sst.selectOne("payMapper.selectSetByNo", setNo);
	}

	
	
}
