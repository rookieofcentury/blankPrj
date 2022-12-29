package com.blank.app.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

@Repository
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

	/*여기부터 3개 다 mapper에 vo 같이 보내줘야함*/
	@Override
	public List<ProjectVo> selectMyPrj(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectMyPrj");
	}

	@Override
	public ProjectVo selectStatusAll(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.selectStatusAll");
	}

	@Override
	public int deletePrj(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.deletePrj");
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
}
