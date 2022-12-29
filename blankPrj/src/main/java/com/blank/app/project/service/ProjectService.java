package com.blank.app.project.service;

import java.util.HashMap;
import java.util.List;

import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

public interface ProjectService {

	List<HashMap<String, String>> selectCategory(HashMap<String, String> map);

	ProjectVo selectProject(int p);

	List<TimeVo> selectStartime(TimeVo timevo);

	List<ProjectVo> selectMyPrj(ProjectVo vo);

	ProjectVo selectStatusAll(ProjectVo vo);

	int deletePrj(ProjectVo vo);

	int tempPrj(ProjectVo vo);

	int prjCnt(ProjectVo vo);

	int updatePrj(ProjectVo vo);

}
