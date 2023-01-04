package com.blank.app.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.admin.vo.HelpVo;
import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.member.vo.QuitAnswerVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;


public interface MemberDao {
	
	public int insertMember(SqlSessionTemplate sst, MemberVo vo);
	
	public MemberVo selectMemberOneById(SqlSessionTemplate sst, MemberVo vo);

	public int doubleCheckByEmail(SqlSessionTemplate sst, String email);

	public int doubleCheckByNick(SqlSessionTemplate sst, String nick);

	public int updatePwd(SqlSessionTemplate sst, MemberVo vo);

	int doubleCheckByPhone(SqlSessionTemplate sst, String phone);

	public int updateEmailByNo(SqlSessionTemplate sst, MemberVo vo);

	public int updateNickByNo(SqlSessionTemplate sst, MemberVo vo);

	public int updatePhoneByNo(SqlSessionTemplate sst, MemberVo vo);

	public int insertQuitAnswer(SqlSessionTemplate sst, MemberVo vo);

	public int updateStatus(SqlSessionTemplate sst, String mNo);

	public List<PayVo> selectPayByNo(SqlSessionTemplate sst, String mNo);

	public int countAddrByNo(SqlSessionTemplate sst, String mNo);

	public int insertAddr(SqlSessionTemplate sst, AddressVo vo);

	public List<HelpVo> selectHelpListByNo(SqlSessionTemplate sst, String mNo);

	public List<ProjectVo> selectLikePrjByNo(SqlSessionTemplate sst, String mNo);


}
