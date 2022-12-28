package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

public interface ProjectDao {

	List<HashMap<String, String>> selectCategory(SqlSessionTemplate sst, HashMap<String, String> map);

	ProjectVo selectProject(SqlSessionTemplate sst, ProjectVo vo, int p);

	List<TimeVo> selectStartime(SqlSessionTemplate sst, TimeVo timevo);

	List<ProjectVo> selectMyPrj(SqlSessionTemplate sst, ProjectVo vo);

	List<ProjectVo> selectStatusAll(SqlSessionTemplate sst, ProjectVo vo);

	int deletePrj(SqlSessionTemplate sst, ProjectVo vo);

	int tempPrj(SqlSessionTemplate sst, ProjectVo vo);


}
