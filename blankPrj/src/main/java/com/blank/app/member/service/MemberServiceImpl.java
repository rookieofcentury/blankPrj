package com.blank.app.member.service;

import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blank.app.admin.vo.HelpVo;
import com.blank.app.member.dao.MemberDao;
import com.blank.app.member.naver.NaverMessageApi;
import com.blank.app.member.vo.AddressVo;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.report.vo.ReportVo;

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
	
	@Autowired
	private NaverMessageApi naverMessage;
	
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
		if(checkPwd == null) {
			return null;
		}

		boolean isMatch = enc.matches(inputPwd, checkPwd);
		
		log.warn("디비랑 화면이랑 비밀번호가 같나요?!?!"+isMatch);
		
		if(isMatch) {
			return dbMember;
		}
		return null;

	}

	//이메일  중복체크 에이젝스 
	@Override
	public int doubleCheckByEmail(String email) {
		
		int result = dao.doubleCheckByEmail(sst, email);
		
		return result;
	}

	@Override
	public int doubleCheckByNick(String nick) {
		return dao.doubleCheckByNick(sst, nick);
	}

	@Override
	public int updatePwd(MemberVo vo) {
		vo.encode(enc);
		int result = dao.updatePwd(sst, vo);
		
		return result;
	}
	
	@Override
	public int updatePwdByNo(MemberVo vo) {
		vo.encode(enc);
		
		int result = dao.updatePwdByNo(sst, vo);
		
	
		return result;
	}

	@Override
	public int doubleCheckByPhone(String phone) {
		System.out.println("서비스 폰 "+ phone);
		int result = dao.doubleCheckByPhone(sst, phone);
		return result;
	}


	@Override
	public int updateEmailByNo(MemberVo vo) {
		
		return dao.updateEmailByNo(sst, vo);
	}

	@Override
	public int updateNickByNo(MemberVo vo) {
		return dao.updateNickByNo(sst, vo);
	}

	@Override
	public int updatePhoneByNo(MemberVo vo) {
		return dao.updatePhoneByNo(sst, vo);
	}

	@Override
	public int writeQuitAnswer(MemberVo vo) {
		return dao.insertQuitAnswer(sst, vo);
	}

	@Override
	public int userQuit(String mNo) {
		return dao.updateStatus(sst, mNo);
	}

	
	@Override
	public List<PayVo> selectPayByNo(String mNo) {
		return dao.selectPayByNo(sst, mNo);
	}

	@Override
	public int addrCount(String mNo) {
		return dao.countAddrByNo(sst, mNo);
	}

	@Override
	public int insertAddr(AddressVo vo) {
		
		return dao.insertAddr(sst, vo);
	}


	@Override
	public List<HelpVo> selectHelpListByNo(String mNo) {
		return dao.selectHelpListByNo(sst, mNo);
	}

	@Override
	public List<ProjectVo> selectLikePrjByNo(String mNo) {
		
		List<ProjectVo> voList = dao.selectLikePrjByNo(sst, mNo);
		log.warn("서비스에서 받는 리스트 "+ voList);
		return voList;
	}


	@Override
	public int insertLikeMemberByNo(LikeMemberVo insertVo) {
		
		return dao.insertLikeMemberByNo(sst, insertVo);
	}

	@Override
	public int deleteLikeMemberByNo(LikeMemberVo deleteVo) {
		return dao.deleteLikeMemberByNo(sst, deleteVo);
	}

	@Override
	public List<MemberVo> selectFollowing(String mNo) {
		
		return dao.selectFollowing(sst, mNo);
	}

	@Override
	public List<MemberVo> selectFollower(String mNo) {
		return dao.selectFollower(sst, mNo);
	}


	@Override
	public int updateProfile(MemberVo vo) {
		return dao.updateProfile(sst, vo);
	}

	@Override
	public List<ReportVo> selectReportListByNo(String mNo) {
		return dao.selectReportListByNo(sst, mNo);
	}

	@Override
	public List<AddressVo> selectAddrByNo(String mNo) {
		return dao.selectAddrByNo(sst, mNo);
	}

	@Override
	public int deleteAddr(AddressVo vo) {
		return dao.delectAddr(sst, vo);
	}

	@Override
	public int checkPwd(MemberVo vo) {
		MemberVo dbMember = dao.selectMemberOneByNo(sst, vo);
		
		//작성한인풋 
		String inputPwd = vo.getPwd1();
		String checkPwd = dbMember.getPwd1();
		

		boolean isMatch = enc.matches(inputPwd, checkPwd);
		
		log.warn("비밀번호 변경할 건데 일치하나용 "+isMatch);
		
		if(isMatch) {
			return 1;
		}
		
		return 0;
	}

	public String sendRandomMessage(String tel) {
	    
	    
	    Random rand = new Random();
	    
	    String numStr = "";
	    
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    System.out.println("넘어가는 번호 " + tel);
	    naverMessage.sendSMS(tel, numStr);

	    return numStr;
	}

	@Override
	public String findEmail(String phone) {
		return dao.selectEmailByPhone(sst, phone);
	}

	@Override
	public AddressVo selectAddrOne(String addrNo) {
		return dao.selectAddrOne(sst, addrNo);
	}


}
