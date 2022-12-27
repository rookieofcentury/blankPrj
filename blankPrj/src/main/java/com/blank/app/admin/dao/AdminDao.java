package com.blank.app.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.report.vo.ReportVo;

@Repository
public class AdminDao {

	//로그인
	public AdminVo login(SqlSessionTemplate sst, AdminVo vo) {
		return sst.selectOne("adminMapper.login", vo);
	}
	
	//공지사항 목록 조회
	public List<NoticeVo> selectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectList", map, rb);
	}

	//공지사항 전체 글 카운트
	public int listCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.listCount");
	}

	//공지사항 작성
	public int noticeWrite(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.insert("adminMapper.noticeWrite", noticeVo);
	}

	//공지사항 상세조회
	public NoticeVo selectOne(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.selectOne("adminMapper.selectOne", noticeVo);
	}

	//공지사항 수정
	public int updateNotice(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.update("adminMapper.updateNotice", noticeVo);
	}

	//전체 회원 수 카운트
	public int memberCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.memberCount");
	}

	//회원 목록 조회
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectMemberList", map, rb);
	}

	//프로젝트 전체 수 카운트
	public int projectCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.projectCount");
	}
	
	//프로젝트 목록 조회
	public List<ProjectVo> selectProjectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectProjectList", map, rb);
	}

	//프로젝트 상세조회
	public NoticeVo selectPrjOne(SqlSessionTemplate sst, ProjectVo projectVo) {
		return sst.selectOne("adminMapper.selectPrjOne", projectVo);
	}

	//신고된 프로젝트 전체 수 카운트
	public int deProjectCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.deProjectCount");
	}

	//신고된 프로젝트 목록 조회
	public List<ReportVo> selectDeProjectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectDeProjectList", map, rb);
	}

	
}
