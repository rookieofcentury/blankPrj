package com.blank.app.pay.service;

import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ProjectVo;

public interface PayService {

	public int insertCard(PayVo vo);

	public int deleteCard(PayVo vo);

	public int cardCount(String mNo);

	public ProjectVo selectPrjByNo(String pNo);





}
