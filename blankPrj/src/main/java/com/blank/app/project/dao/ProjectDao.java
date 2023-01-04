package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

public interface ProjectDao {

	List<HashMap<String, String>> selectCategory(SqlSessionTemplate sst, HashMap<String, String> map);

	ProjectVo selectProject(SqlSessionTemplate sst, int p);

	List<TimeVo> selectStartime(SqlSessionTemplate sst, TimeVo timevo);

	List<ProjectVo> selectMyPrj(SqlSessionTemplate sst, HashMap<String, Object> map);

	ProjectVo selectStatusAll(SqlSessionTemplate sst, ProjectVo vo);

	int deletePrj(SqlSessionTemplate sst, String no);	

	int tempPrj(SqlSessionTemplate sst, ProjectVo vo);

	int prjCnt(SqlSessionTemplate sst, ProjectVo vo);

	int updatePrj(SqlSessionTemplate sst, ProjectVo vo);

	int writingCnt(SqlSessionTemplate sst, HashMap<String, Object> map);

	int insertPrj(SqlSessionTemplate sst, HashMap<String, Object> map);

	int selectMyLikePrj(SqlSessionTemplate sst, LikeProjectVo vo);

	int insertLikePrj(SqlSessionTemplate sst, LikeProjectVo vo);

	int deleteLikePrj(SqlSessionTemplate sst, LikeProjectVo vo);



}
