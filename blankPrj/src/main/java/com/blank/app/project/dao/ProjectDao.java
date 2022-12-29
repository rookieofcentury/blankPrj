package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

public interface ProjectDao {

	List<HashMap<String, String>> selectCategory(SqlSessionTemplate sst, HashMap<String, String> map);

	ProjectVo selectProject(SqlSessionTemplate sst, int p);

	List<TimeVo> selectStartime(SqlSessionTemplate sst, TimeVo timevo);

	List<ProjectVo> selectMyPrj(SqlSessionTemplate sst, ProjectVo vo);

	ProjectVo selectStatusAll(SqlSessionTemplate sst, ProjectVo vo);

	int deletePrj(SqlSessionTemplate sst, ProjectVo vo);

	int tempPrj(SqlSessionTemplate sst, ProjectVo vo);

	int prjCnt(SqlSessionTemplate sst, ProjectVo vo);

	int updatePrj(SqlSessionTemplate sst, ProjectVo vo);

	int writingCnt(SqlSessionTemplate sst, HashMap<Object, Object> map);

}
