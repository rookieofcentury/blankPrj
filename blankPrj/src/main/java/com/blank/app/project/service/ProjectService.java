package com.blank.app.project.service;

import java.util.HashMap;
import java.util.List;

import com.blank.app.project.vo.ProjectVo;

public interface ProjectService {

	List<HashMap<String, String>> selectCategory(HashMap<String, String> map);

	ProjectVo selectProject(ProjectVo vo, int p);

}
