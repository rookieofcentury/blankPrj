package com.blank.app.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("memberMapper.insertMember", vo);
	}

	@Override
	public MemberVo selectMemberOneById(SqlSessionTemplate sst, MemberVo vo) {
		
		return sst.selectOne("memberMapper.selectOneMember", vo);
				
	}

	
}
