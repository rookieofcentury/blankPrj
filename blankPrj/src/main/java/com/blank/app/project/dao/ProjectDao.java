package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;
import com.blank.app.project.vo.ItemVo;

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

	int writingCnt(SqlSessionTemplate sst, ProjectVo vo);

	int insertPrj(SqlSessionTemplate sst, HashMap<String, Object> map);

	int selectMyLikePrj(SqlSessionTemplate sst, LikeProjectVo vo);

	int insertLikePrj(SqlSessionTemplate sst, LikeProjectVo vo);

	int deleteLikePrj(SqlSessionTemplate sst, LikeProjectVo vo);

	List<ProjectVo> selectMyPrj(SqlSessionTemplate sst, ProjectVo vo);

	int examinationCnt(SqlSessionTemplate sst, ProjectVo vo);

	List<ProjectVo> selectexamination(SqlSessionTemplate sst, ProjectVo vo);

	int confirmCnt(SqlSessionTemplate sst, ProjectVo vo);

	List<ProjectVo> selectconfirm(SqlSessionTemplate sst, ProjectVo vo);

	int proceedCnt(SqlSessionTemplate sst, ProjectVo vo);

	List<ProjectVo> selectproceed(SqlSessionTemplate sst, ProjectVo vo);

	int updateSet(SqlSessionTemplate sst, HashMap<String, Object> map);

	int followCheck(SqlSessionTemplate sst, LikeMemberVo vo);

	int updateCreator(SqlSessionTemplate sst, MemberVo memberVo);

	int updateSet(SqlSessionTemplate sst, ItemVo itemVo);

	ProjectVo selectPrjInfo(SqlSessionTemplate sst, HashMap<String, Object> prjMap);

	List<ItemVo> selectSet(SqlSessionTemplate sst, int p);

	int updateExamination(SqlSessionTemplate sst, ProjectVo prjVo);

	MemberVo selectMemberInfo(SqlSessionTemplate sst, MemberVo memberVo);

}
