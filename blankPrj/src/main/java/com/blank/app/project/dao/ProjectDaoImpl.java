package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

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
		//log.warn("디비에서 받은 작성중리스트 " + list );
		return list;
		//return sst.selectList("projectMapper.selectMyPrj", map);
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
		return sst.update("projectMapper.updatePrj", vo);
	}

	@Override
	public int writingCnt(SqlSessionTemplate sst, HashMap<String, Object> map) {
		return sst.selectOne("projectMapper.writingCnt", map);
	}

	@Override
	public int insertPrj(SqlSessionTemplate sst, ProjectVo vo) {
		int result = sst.insert("projectMapper.insertPrj", vo);
		log.warn("플젝 새로 추가 + 플젝번호" + vo.getNo() );
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
		System.out.println("디에이옹 브이오" + vo);
		
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
}
