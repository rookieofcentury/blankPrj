package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.common.PageVo;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;
import com.blank.app.project.vo.ItemVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ProjectDaoImpl implements ProjectDao{

	@Override
	public List<HashMap<String, String>> selectCategory(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.selectList("projectMapper.selectCategory");
	}

	@Override
	public ProjectVo selectProject(SqlSessionTemplate sst, int p) {
		return sst.selectOne("projectMapper.selectPrj", p);
	}

	@Override
	public List<TimeVo> selectStartime(SqlSessionTemplate sst, TimeVo timevo) {
		return sst.selectList("projectMapper.selectTimeList");
	}

	@Override
	public List<ProjectVo> selectMyPrj(SqlSessionTemplate sst, HashMap<String, Object> map) {
		List<ProjectVo> list = sst.selectList("projectMapper.selectMyPrj", map);
		return list;
	}

	@Override
	public ProjectVo selectStatusAll(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.selectStatusAll");
	}

	@Override
	public int deletePrj(SqlSessionTemplate sst, String no) {
		int result = sst.update("projectMapper.deletePrj", no);
		log.warn("dao 플젝 삭제 갯수" + result );
		return result;
	}

	@Override
	public int tempPrj(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.insert("projectMapper.insertTempPrj", vo);
	}

	@Override
	public int prjCnt(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.prjCnt", vo);
	}

	@Override
	public int updatePrj(SqlSessionTemplate sst, ProjectVo vo) {
		log.warn("dao updatePrj : " + vo);
		int result = sst.update("projectMapper.updatePrj", vo);
		return result;
	}

	@Override
	public int writingCnt(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.writingCnt", vo);
	}

	@Override
	public int insertPrj(SqlSessionTemplate sst, HashMap<String, Object> map) {
		int result = sst.insert("projectMapper.insertPrj", map);
		return result;
	}

	/* 로그인 찜한 프로젝트 조회 */
	@Override
	public int selectMyLikePrj(SqlSessionTemplate sst, LikeProjectVo vo) {
		int result = sst.selectOne("projectMapper.selectMyLikePrj", vo);
		log.warn("dao 내가 찜한 프로젝트 조회" + result);
		return result;
	}

	/* 찜++ */
	@Override
	public int insertLikePrj(SqlSessionTemplate sst, LikeProjectVo vo) {
		int result = sst.insert("projectMapper.insertLikePrj", vo);
		log.warn("dao ++찜 조회" + result);
		return result;
	}
	
	/* 찜-- */
	@Override
	public int deleteLikePrj(SqlSessionTemplate sst, LikeProjectVo vo) {
		int result = sst.delete("projectMapper.deleteLikePrj", vo);
		log.warn("dao --찜 조회" + result);
		return result;
	}

	@Override
	public List<ProjectVo> selectMyPrj(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectwritingPrj", vo);
	}

	@Override
	public int examinationCnt(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.examinationCnt", vo);
	}

	@Override
	public List<ProjectVo> selectexamination(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectexamination", vo);
	}

	@Override
	public int confirmCnt(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.confirmCnt", vo);
	}

	@Override
	public List<ProjectVo> selectconfirm(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectconfirm", vo);
	}

	@Override
	public int proceedCnt(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.proceedCnt", vo);
	}

	@Override
	public List<ProjectVo> selectproceed(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectproceed", vo);
	}

	@Override
	public int returnedCnt(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.returnedCnt", vo);
	}

	@Override
	public List<ProjectVo> selectreturned(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectreturned", vo);
	}

	@Override
	public int endCnt(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.endCnt", vo);
	}

	@Override
	public List<ProjectVo> selectend(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectend", vo);
	}
	
	@Override
	public int updateSet(SqlSessionTemplate sst, HashMap<String, Object> map) {
		int result = sst.update("projectMapper.updateSet", map);
		log.warn("dao updateSet" + result);
		return result;
	}

	@Override
	public int followCheck(SqlSessionTemplate sst, LikeMemberVo vo) {
		int result = sst.selectOne("projectMapper.followCheck", vo);
		log.warn("dao followCheck : " + result);
		return result;
	}

	@Override
	public int updateCreator(SqlSessionTemplate sst, MemberVo memberVo) {
		log.warn("dao updateCreator" + memberVo);
		int result = sst.update("projectMapper.updateCreator", memberVo);
		return result;
	}

	@Override
	public int updateSet(SqlSessionTemplate sst, ItemVo itemVo) {
		int result = sst.update("projectMapper.updateSet", itemVo);
		log.warn("dao updateSet" + result);
		return result;
	}

	@Override
	public ProjectVo selectPrjInfo(SqlSessionTemplate sst, HashMap<String, Object> prjMap) {
		return sst.selectOne("projectMapper.selectPrjInfo", prjMap);
	}

	@Override
	public List<ItemVo> selectSet(SqlSessionTemplate sst, int p) {
		List<ItemVo> list = sst.selectList("projectMapper.selectSet", p);
		return list;
	}

	@Override
	public int updateExamination(SqlSessionTemplate sst, ProjectVo prjVo) {
		int result = sst.update("projectMapper.updateExamination", prjVo);
		log.warn("dao updateExamination : " + result);
		return result;
	}

	@Override
	public MemberVo selectMemberInfo(SqlSessionTemplate sst, MemberVo memberVo) {
		return sst.selectOne("projectMapper.selectMemberInfo", memberVo);
	}

	@Override
	public int selectSum(SqlSessionTemplate sst, int p) {
		return sst.selectOne("projectMapper.selectSum", p);
	}

	@Override
	public int minusCnt(SqlSessionTemplate sst, String setNo) {
		return sst.update("projectMapper.minusCnt", setNo);
	}

	@Override
	public int selectCalDate(SqlSessionTemplate sst, int p) {
		return sst.selectOne("projectMapper.selectCalDate", p);
	}

	@Override
	public int selectFundingQuantity(SqlSessionTemplate sst, int p) {
		return sst.selectOne("projectMapper.selectFundingQuantity", p);
	}

	// 검색 결과 도합 몇 개인지
		public int searchListCount(SqlSessionTemplate sst, Map<String, String> map) {
			return sst.selectOne("projectMapper.searchListCount", map);
		}

	// 검색 결과 VoList 도출
	public List<ProjectVo> searchPrjList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv) {
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("projectMapper.searchPrjList", map, rb);
		
	}
		
	// 랜덤 리스트
		public List<ProjectVo> mainRandomList(SqlSessionTemplate sst) {
			return sst.selectList("projectMapper.mainRandomList");
	}

	// 인기 리스트
	public List<ProjectVo> mainPopularPrjList(SqlSessionTemplate sst) {
		return sst.selectList("projectMapper.mainPopularPrjList");
	}

	// 신규 리스트
	public List<ProjectVo> mainNewPrjList(SqlSessionTemplate sst) {
		return sst.selectList("projectMapper.mainNewPrjList");
	}

	
		
}
