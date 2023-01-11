package com.blank.app.member.service;

import java.util.List;

import com.blank.app.admin.vo.HelpVo;
import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.report.vo.ReportVo;


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

	public List<HelpVo> selectHelpListByNo(String mNo);

	public List<ProjectVo> selectLikePrjByNo(String mNo);

	public int insertLikeMemberByNo(LikeMemberVo insertVo);

	public int deleteLikeMemberByNo(LikeMemberVo deleteVo);

	public List<MemberVo> selectFollowing(String mNo);

	public List<MemberVo> selectFollower(String mNo);

	public int updateProfile(MemberVo vo);

	public List<ReportVo> selectReportListByNo(String mNo);

	public List<AddressVo> selectAddrByNo(String mNo);

	public int deleteAddr(AddressVo vo);

	public int checkPwd(MemberVo vo);

	public int updatePwdByNo(MemberVo vo);

	public String sendRandomMessage(String phone);

	public String findEmail(String phone);

	public AddressVo selectAddrOne(String addrNo);

	public List<PayListVo> selectPayListByNo(String mNo);

	public int updateDefault(String no);







}
