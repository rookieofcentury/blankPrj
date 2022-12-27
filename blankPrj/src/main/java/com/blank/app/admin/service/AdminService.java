package com.blank.app.admin.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.dao.AdminDao;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.report.vo.ReportVo;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private AdminDao admindao;
	
	//로그인
	public AdminVo login(AdminVo vo) {
		return admindao.login(sst, vo);
	}
	
	//공지사항 목록 조회
	public List<NoticeVo> selectList(Map<String, String> map, PageVo pageVo) {
		return admindao.selectList(sst, map, pageVo);
	}

	//공지사항 전체 글 카운트
	public int listCount() {
		return admindao.listCount(sst);
	}

	//공지사항 작성
	public int noticeWrite(NoticeVo noticeVo) {
		return admindao.noticeWrite(sst, noticeVo);
	}

	//공지사항 상세조회
	public NoticeVo selectOne(NoticeVo noticeVo) {
		return admindao.selectOne(sst, noticeVo);
	}

	//공지사항 수정
	public int updateOne(NoticeVo noticeVo) {
		return admindao.updateNotice(sst, noticeVo);
	}

	//전체 회원 수 카운트
	public int memberCount() {
		return admindao.memberCount(sst);
	}

	//회원 목록 조회
	public List<MemberVo> selectMemberList(Map<String, String> map, PageVo pageVo) {
		return admindao.selectMemberList(sst, map, pageVo);
	}
	
	//프로젝트 전체 수 카운트
	public int projectCount() {
		return admindao.projectCount(sst);
	}

	//프로젝트 목록 조회
	public List<ProjectVo> selectProjectList(Map<String, String> map, PageVo pageVo) {
		return admindao.selectProjectList(sst, map, pageVo);
	}

	//프로젝트 상세조회
	public NoticeVo selectPrjOne(ProjectVo projectVo) {
		return admindao.selectPrjOne(sst, projectVo);
	}

	//신고된 프로젝트 전체 수 카운트
	public int deProjectCount() {
		return admindao.deProjectCount(sst);
	}

	//신고된 프로젝트 목록 조회
	public List<ReportVo> selectDeProjectList(Map<String, String> map, PageVo pageVo) {
		return admindao.selectDeProjectList(sst, map, pageVo);
	}
	
}
