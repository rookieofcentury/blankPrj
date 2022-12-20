package com.blank.app.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.member.vo.MemberVo;


public interface MemberDao {
	
	public int insertMember(SqlSessionTemplate sst, MemberVo vo);
	
	public MemberVo selectMemberOneById(SqlSessionTemplate sst, MemberVo vo);

}