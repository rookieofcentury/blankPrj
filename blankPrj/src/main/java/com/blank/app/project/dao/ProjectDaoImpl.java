package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.project.vo.ProjectVo;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	@Override
	public List<HashMap<String, String>> selectCategory(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.selectList("projectMapper.selectCategory");
	}

	@Override
	public ProjectVo selectProject(SqlSessionTemplate sst, ProjectVo vo, int p) {
		System.out.println("DAO");
		return sst.selectOne("projectMapper.selectPrj", p);
	}

}
