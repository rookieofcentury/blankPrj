package com.blank.app.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.pay.vo.PayListVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ItemVo;
import com.blank.app.project.vo.ProjectVo;

public interface PayDao {

	public int insertCard(SqlSessionTemplate sst, PayVo vo);

	public int deleteCard(SqlSessionTemplate sst, PayVo vo);

	public int cardCount(SqlSessionTemplate sst, String mNo);

	public ProjectVo selectPrjByNo(SqlSessionTemplate sst, String pNo);

	public ItemVo selectSetByNo(SqlSessionTemplate sst, String setNo);

	public int insertPayList(SqlSessionTemplate sst, PayListVo vo);



}
