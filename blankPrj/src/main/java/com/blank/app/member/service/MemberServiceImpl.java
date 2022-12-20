package com.blank.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blank.app.member.dao.MemberDao;
import com.blank.app.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public int join(MemberVo vo) {
		vo.encode(enc);
		
		return dao.insertMember(sst, vo);
	}

	@Override
	public MemberVo login(MemberVo vo) {
		MemberVo dbMember = dao.selectMemberOneById(sst, vo);
		
		String inputPwd = vo.getPwd();
		String checkPwd = dbMember.getPwd();
		
		boolean isMatch = enc.matches(inputPwd, checkPwd);
		
		if(!isMatch) {
			return null;
		}
		
		return dbMember;
	}

}
