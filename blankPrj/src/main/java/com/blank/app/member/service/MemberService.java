package com.blank.app.member.service;

import java.util.List;

import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayVo;


public interface MemberService {

	public int join(MemberVo vo);
	
	public MemberVo login(MemberVo vo);

	public int doubleCheckByEmail(String email);

	public int doubleCheckByNick(String nick);
	
	public int doubleCheckByPhone(String phone);
	
	public int updatePwd(MemberVo vo);

	public int updateEmailByNo(MemberVo vo);

	public int updateNickByNo(MemberVo vo);

	public int updatePhoneByNo(MemberVo vo);

	public int writeQuitAnswer(MemberVo vo);

	public int userQuit(String mNo);

	public List<PayVo> selectPayByNo(String mNo);

	public int addrCount(String mNo);

	public int insertAddr(AddressVo vo);



}
