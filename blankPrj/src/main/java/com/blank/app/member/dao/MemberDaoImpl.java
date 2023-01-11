package com.blank.app.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.vo.HelpVo;
import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.report.vo.ReportVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("memberMapper.insertMember", vo);
	}

	@Override
	public MemberVo selectMemberOneById(SqlSessionTemplate sst, MemberVo vo) {
		
		MemberVo dbMember = sst.selectOne("memberMapper.selectOneMember", vo);
		return dbMember;
				
	}

	//이메일 중복체크 
	@Override
	public int doubleCheckByEmail(SqlSessionTemplate sst, String email) {
		int result = sst.selectOne("doubleCheckMapper.selectCntByEmail" , email);
	
		return result; 
	}
	
	//닉네임 중복체크 
	@Override
	public int doubleCheckByNick(SqlSessionTemplate sst, String nick) {
		int result = sst.selectOne("doubleCheckMapper.selectCntByNick" , nick);
		return result; 
	}

	//휴대전화 중복체크 
	@Override
	public int doubleCheckByPhone(SqlSessionTemplate sst, String phone) {
	
		int result = sst.selectOne("doubleCheckMapper.selectCntByPhone" , phone);
	
		return result; 
	}
	
	@Override
	public int updatePwd(SqlSessionTemplate sst, MemberVo vo) {
		int result = sst.update("memberMapper.updatePwd", vo);
		
		return result;
	}
	
	public int updatePwdByNo(SqlSessionTemplate sst, MemberVo vo) {
		int result = sst.update("memberMapper.updatePwdByNo", vo);
		
		return result;
	}

	@Override
	public int updateEmailByNo(SqlSessionTemplate sst, MemberVo vo) {
		
		return sst.update("memberMapper.updateEmail", vo);
	}

	@Override
	public int updateNickByNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updateNick", vo);
	}

	@Override
	public int updatePhoneByNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updatePhone", vo);
	}
	
	
	@Override
	public int insertQuitAnswer(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.insertQuitAnswer", vo);
	}

	@Override
	public int updateStatus(SqlSessionTemplate sst, String mNo) {
		return sst.update("memberMapper.updateStatus", mNo);
	}

	@Override
	public List<PayVo> selectPayByNo(SqlSessionTemplate sst, String mNo) {
		return sst.selectList("payMapper.selectPayByNo", mNo);
	}

	@Override
	public int countAddrByNo(SqlSessionTemplate sst, String mNo) {
		return sst.selectOne("memberMapper.countAddrByNo", mNo);
	}

	@Override
	public int insertAddr(SqlSessionTemplate sst, AddressVo vo) {
		
		return sst.insert("memberMapper.insertAddr", vo);
	}

	@Override
	public List<HelpVo> selectHelpListByNo(SqlSessionTemplate sst, String mNo) {
		return sst.selectList("memberMapper.selectHelpListByNo", mNo);
	}

	@Override
	public List<ProjectVo> selectLikePrjByNo(SqlSessionTemplate sst, String mNo) {
		
		return sst.selectList("memberMapper.selectLikePrjByNo", mNo);
	

	}

	@Override
	public int insertLikeMemberByNo(SqlSessionTemplate sst, LikeMemberVo insertVo) {
		
		return sst.insert("memberMapper.insertLikeMemberByNo", insertVo);
	}

	@Override
	public int deleteLikeMemberByNo(SqlSessionTemplate sst, LikeMemberVo deleteVo) {
		
		return sst.delete("memberMapper.deleteLikeMemberByNo", deleteVo);
	}

	@Override
	public List<MemberVo> selectFollowing(SqlSessionTemplate sst, String mNo) {
		
		return sst.selectList("memberMapper.selectFollowingByNo", mNo);
	}

	@Override
	public List<MemberVo> selectFollower(SqlSessionTemplate sst, String mNo) {
		return sst.selectList("memberMapper.selectFollowerByNo", mNo);	
	}



	@Override
	public int updateProfile(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updateProfile", vo);
	}

	@Override
	public List<ReportVo> selectReportListByNo(SqlSessionTemplate sst, String mNo) {
		return sst.selectList("memberMapper.selectReportListByNo", mNo);
	}

	@Override
	public List<AddressVo> selectAddrByNo(SqlSessionTemplate sst, String mNo) {
		return sst.selectList("memberMapper.selectAddrByNo", mNo);
	}

	@Override
	public int delectAddr(SqlSessionTemplate sst, AddressVo vo) {
		return sst.delete("memberMapper.deleteAddr", vo);
		
	}

	@Override
	public MemberVo selectMemberOneByNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.selectOneMemberByNo", vo);
		
	}

	@Override
	public String selectEmailByPhone(SqlSessionTemplate sst, String phone) {
		return sst.selectOne("memberMapper.selectEmailByPhone", phone);
	}

	@Override
	public AddressVo selectAddrOne(SqlSessionTemplate sst, String addrNo) {
		return sst.selectOne("memberMapper.selectAddrOne", addrNo);
	}

	@Override
	public List<PayListVo> selectPayListByNo(SqlSessionTemplate sst, String mNo) {
		return sst.selectList("payMapper.selectPayListByNo", mNo);
	}

	@Override
	public int updateDefault(SqlSessionTemplate sst, String no) {
		return sst.update("memberMapper.updateDefault", no);
	}
	
	
	
	
	

	
}
