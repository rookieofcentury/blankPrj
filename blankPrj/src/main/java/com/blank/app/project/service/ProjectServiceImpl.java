package com.blank.app.project.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blank.app.member.dao.MemberDao;
import com.blank.app.project.dao.ProjectDao;
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
	public List<ProjectVo> selectMyPrj(ProjectVo vo) {
		return (List<ProjectVo>) dao.selectMyPrj(sst, vo);
	}

	@Override
	public ProjectVo selectStatusAll(ProjectVo vo) {
		return (ProjectVo) dao.selectStatusAll(sst, vo);
	}

	@Override
	public int deletePrj(ProjectVo vo) {
		int result = dao.deletePrj(sst, vo);
		if(result == 1) {
			return result;
		}else {
			return (Integer) null;
		}
	}

	@Override
	public int tempPrj(ProjectVo vo) {
		System.out.println("vovo");
		return dao.tempPrj(sst,vo);
	}

}
