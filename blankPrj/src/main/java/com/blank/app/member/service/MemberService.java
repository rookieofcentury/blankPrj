package com.blank.app.member.service;

import com.blank.app.member.vo.MemberVo;

public interface MemberService {

	public int join(MemberVo vo);
	
	public MemberVo login(MemberVo vo);

	public int doubleCheckByEmail(String email);

	public int doubleCheckByNick(String nick);
}
