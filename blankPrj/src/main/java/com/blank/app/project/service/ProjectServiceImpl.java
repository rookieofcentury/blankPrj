package com.blank.app.project.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blank.app.member.dao.MemberDao;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.dao.ProjectDao;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;
import com.blank.app.project.vo.ItemVo;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ProjectDao dao;
	
	//카테고리
	@Override
	public List<HashMap<String, String>> selectCategory(HashMap<String, String> map) {
		List<HashMap<String, String>> category = dao.selectCategory(sst,map);
		return category;
	}

	//플젝 상세페이지 (플젝 조회)
	@Override
	public ProjectVo selectProject(int p) {
		return dao.selectProject(sst,p);
	}

	@Override
	public List<TimeVo> selectStartime(TimeVo timevo) {
		return (List<TimeVo>) dao.selectStartime(sst,timevo);
	}

	@Override
	public List<ProjectVo> selectMyPrj(HashMap<String, Object> map) {
		return (List<ProjectVo>) dao.selectMyPrj(sst, map);
	}

	@Override
	public ProjectVo selectStatusAll(ProjectVo vo) {
		return (ProjectVo) dao.selectStatusAll(sst, vo);
	}

	@Override
		public int deletePrj(String no) {
			int result = dao.deletePrj(sst, no);
			if(result == 1) {
				return result;
			}else {
				return 0;
			}
		}

	@Override
	public int tempPrj(ProjectVo vo) {
		return dao.tempPrj(sst,vo);
	}

	@Override
	public int prjCnt(ProjectVo vo) {
		return dao.prjCnt(sst,vo);
	}

	@Override
	public int updatePrj(ProjectVo vo) {
		return dao.updatePrj(sst,vo);
	}

	@Override
	public int writingCnt(ProjectVo vo) {
		return dao.writingCnt(sst,vo);
	}

	@Override
	public int insertPrj(HashMap<String, Object> map) {
		return dao.insertPrj(sst,map);
	}

	/* 로그인 찜한 프로젝트 조회 */
	@Override
	public int selectMyLikePrj(LikeProjectVo vo) {
		return dao.selectMyLikePrj(sst,vo);
	}

	/*찜 ++*/
	@Override
	public int insertLikePrj(LikeProjectVo vo) {
		int result = dao.insertLikePrj(sst,vo);
		return result;
	}

	/*찜 --*/
	@Override
	public int deleteLikePrj(LikeProjectVo vo) {
		return dao.deleteLikePrj(sst,vo);
	}
	
	/*작성중 조회*/
	@Override
	public List<ProjectVo> selectMyPrj(ProjectVo vo) {
		return dao.selectMyPrj(sst, vo);
	}

	/*심사중 카운트*/
	@Override
	public int examinationCnt(ProjectVo vo) {
		return dao.examinationCnt(sst, vo);
	}

	/*심사중 조회*/
	@Override
	public List<ProjectVo> selectexamination(ProjectVo vo) {
		return dao.selectexamination(sst, vo);
	}

	@Override
	public int confirmCnt(ProjectVo vo) {
		return dao.confirmCnt(sst, vo);
	}

	@Override
	public List<ProjectVo> selectconfirm(ProjectVo vo) {
		return dao.selectconfirm(sst, vo);
	}

	@Override
	public int proceedCnt(ProjectVo vo) {
		return dao.proceedCnt(sst, vo);
	}

	@Override
	public List<ProjectVo> selectproceed(ProjectVo vo) {
		return dao.selectproceed(sst, vo);
	}

	@Override
	public int updateSet(HashMap<String, Object> map) {
		return dao.updateSet(sst, map);
	}

	@Override
	public int followCheck(LikeMemberVo vo) {
		return dao.followCheck(sst, vo);
	}

	@Override
	public int updateCreator(MemberVo memberVo) {
		return dao.updateCreator(sst,memberVo);
	}

	@Override
	public int updateSet(ItemVo itemVo) {
		return dao.updateSet(sst,itemVo);
	}

	@Override
	public ProjectVo selectPrjInfo(HashMap<String, Object> prjMap) {
		return dao.selectPrjInfo(sst, prjMap);
	}
	
	//플젝 상세페이지 (아이템 조회)
	@Override
	public List<ItemVo> selectSet(int p) {
		return dao.selectSet(sst,p);
	}

	@Override
	public int updateExamination(ProjectVo prjVo) {
		return dao.updateExamination(sst,prjVo);
	}

	@Override
	public MemberVo selectMemberInfo(MemberVo memberVo) {
		return dao.selectMemberInfo(sst, memberVo);
	}


}
