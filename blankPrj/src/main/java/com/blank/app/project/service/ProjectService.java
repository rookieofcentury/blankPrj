package com.blank.app.project.service;

import java.util.HashMap;
import java.util.List;

import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

public interface ProjectService {

	List<HashMap<String, String>> selectCategory(HashMap<String, String> map);

	ProjectVo selectProject(int p);

	List<TimeVo> selectStartime(TimeVo timevo);

	List<ProjectVo> selectMyPrj(HashMap<String, Object> map);

	ProjectVo selectStatusAll(ProjectVo vo);

	int deletePrj(String no);

	int tempPrj(ProjectVo vo);

	int prjCnt(ProjectVo vo);

	int updatePrj(ProjectVo vo);

	int writingCnt(HashMap<String, Object> map);

	int insertPrj(HashMap<String, Object> map);

	int selectMyLikePrj(LikeProjectVo vo);

	int insertLikePrj(LikeProjectVo vo);

	int deleteLikePrj(LikeProjectVo vo);

	List<ProjectVo> selectMyPrj(ProjectVo vo);


}
