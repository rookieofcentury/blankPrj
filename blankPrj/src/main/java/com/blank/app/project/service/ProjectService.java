package com.blank.app.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blank.app.admin.common.PageVo;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;
import com.blank.app.project.vo.ItemVo;

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

	int writingCnt(ProjectVo vo);

	int insertPrj(HashMap<String, Object> map);

	int selectMyLikePrj(LikeProjectVo vo);

	int insertLikePrj(LikeProjectVo vo);

	int deleteLikePrj(LikeProjectVo vo);

	List<ProjectVo> selectMyPrj(ProjectVo vo);

	int examinationCnt(ProjectVo vo);

	List<ProjectVo> selectexamination(ProjectVo vo);

	int confirmCnt(ProjectVo vo);

	List<ProjectVo> selectconfirm(ProjectVo vo);

	int proceedCnt(ProjectVo vo);

	List<ProjectVo> selectproceed(ProjectVo vo);

	int updateSet(HashMap<String, Object> map);

	int followCheck(LikeMemberVo vo);

	int updateCreator(MemberVo memberVo);

	int updateSet(ItemVo itemVo);

	ProjectVo selectPrjInfo(HashMap<String, Object> prjMap);

	List<ItemVo> selectSet(int p);

	int updateExamination(ProjectVo prjVo);

	MemberVo selectMemberInfo(MemberVo memberVo);

	int selectSum(int p);

  int minusCnt(String setNo);

	int selectCalDate(int p);

	int selectFundingQuantity(int p);

	int searchListCount(Map<String, String> map);

	List<ProjectVo> searchPrjList(Map<String, String> map, PageVo pageVo);
  
}
