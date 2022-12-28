package com.blank.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blank.app.member.dao.MemberDao;
import com.blank.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
		
		String inputPwd = vo.getPwd1();
		String checkPwd = dbMember.getPwd1();
		
		System.out.println(inputPwd);
	 	System.out.println(checkPwd);
		boolean isMatch = enc.matches(inputPwd, checkPwd);
		
		log.warn("디비랑 화면이랑 비밀번호가 같나요?!?!"+isMatch);
		
		if(!isMatch) {
			return null;
		}
		log.warn("서비스에서 리턴하는 멤버 " + dbMember);
		return dbMember;
	}

	//아이디 중복체크 에이젝스 
	@Override
	public int doubleCheckByEmail(String email) {
		
		return dao.doubleCheckByEmail(sst, email);
	}

	@Override
	public int doubleCheckByNick(String nick) {
		return dao.doubleCheckByNick(sst, nick);
	}

	@Override
	public int updatePwd(MemberVo vo) {
		vo.encode(enc);
		return dao.updatePwd(sst, vo);
	}

	@Override
	public int doubleCheckByPhone(String phone) {
		
		return dao.doubleCheckByNick(sst, phone);
	}



	@Override
	public int updateEmailByNo(MemberVo vo) {
		
		return dao.updateEmailByNo(sst, vo);
	}


}
