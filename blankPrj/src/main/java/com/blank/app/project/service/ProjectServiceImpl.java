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
	public ProjectVo selectProject(ProjectVo vo, int p) {
		return dao.selectProject(sst,vo,p);
	}

}
