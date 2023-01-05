package com.blank.app.project.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blank.app.member.dao.MemberDao;
import com.blank.app.project.dao.ProjectDao;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

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

	//플젝 상세페이지
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
	public int writingCnt(HashMap<String, Object> map) {
		return dao.writingCnt(sst,map);
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
		System.out.println("서비스 브이오" + vo);
		
		int result = dao.insertLikePrj(sst,vo);
		System.out.println("서비스 리절트 "+result);
		return result;
	}

	/*찜 --*/
	@Override
	public int deleteLikePrj(LikeProjectVo vo) {
		return dao.deleteLikePrj(sst,vo);
	}

	@Override
	public List<ProjectVo> selectMyPrj(ProjectVo vo) {
		return dao.selectMyPrj(sst, vo);
	}

}
