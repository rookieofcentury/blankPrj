package com.blank.app.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayVo;

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
		// TODO Auto-generated method stub
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
		return sst.update("memberMapper.updatePwd", vo);
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

	
	
	

	
}
