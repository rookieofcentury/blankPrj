package com.blank.app.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.logging.log4j.core.tools.picocli.CommandLine.Help;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.chatbot.vo.ChatbotVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.quit.vo.QuitVo;
import com.blank.app.report.vo.ReportVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao{

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
	public NoticeVo selectNotice(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.selectOne("adminMapper.selectNotice", noticeVo);
	}

	//공지사항 수정
	public int updateNotice(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.update("adminMapper.updateNotice", noticeVo);
	}

	//공지사항 삭제
	@Override
	public int deleteNotice(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.update("adminMapper.deletNotice", noticeVo);
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
	public ProjectVo selectPrj(SqlSessionTemplate sst, ProjectVo projectVo) {
		return sst.selectOne("adminMapper.selectPrj", projectVo);
	}

	//프로젝트 승인
	@Override
	public int approvalProject(SqlSessionTemplate sst, ProjectVo projectVo) {
		return sst.update("adminMapper.updateProject", projectVo);
	}
	
	//프로젝트 반려
	@Override
	public int cancelProject(SqlSessionTemplate sst, ProjectVo projectVo) {
		return sst.update("adminMapper.cancelProject", projectVo);
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

	//신고 프로젝트 상세조회
	@Override
	public ReportVo selectReport(SqlSessionTemplate sst, ReportVo reportVo) {
		return sst.selectOne("adminMapper.selectReport", reportVo);
	}

	//신고 프로젝트 접수
	@Override
	public int updateReport(SqlSessionTemplate sst, ReportVo reportVo) {
		return sst.update("adminMapper.updateReport", reportVo);
	}
	
	//회원정보 상세조회
	public MemberVo selectMember(SqlSessionTemplate sst, MemberVo memberVo) {
		return sst.selectOne("adminMapper.selectMember", memberVo);
	}
	
	//회원정보 수정
	public int updateMember(SqlSessionTemplate sst, MemberVo memberVo) {
		return sst.update("adminMapper.updateMember", memberVo);
	}

	//FAQ 전체 수 카운트
	public int faqCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.faqCount");
	}

	//FAQ 목록 조회
	public List<FaqVo> selectFaqList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectFaqList", map, rb);
	}

	//FAQ 상세조회
	@Override
	public FaqVo selectFaq(SqlSessionTemplate sst, FaqVo faqVo) {
		return sst.selectOne("adminMapper.selectFaq", faqVo);
	}

	//FAQ 작성
	@Override
	public int faqWrite(SqlSessionTemplate sst, FaqVo faqVo) {
		return sst.insert("adminMapper.faqWrite", faqVo);
	}
	
	//FAQ 수정
	@Override
	public int updateFaq(SqlSessionTemplate sst, FaqVo faqVo) {
		return sst.update("adminMapper.updateFaq", faqVo);
	}

	//FAQ 삭제
	@Override
	public int deleteFaq(SqlSessionTemplate sst, FaqVo faqVo) {
		return sst.update("adminMapper.deleteFaq", faqVo);
	}
	
	//고객센터 문의 전체 수 카운트
	public int helpCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.helpCount");
	}

	//고객센터 문의 목록 조회
	public List<HelpVo> selectHelpList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectHelpList", map, rb);
	}

	//고객센터 문의 상세조회
	@Override
	public HelpVo selectHelp(SqlSessionTemplate sst, HelpVo helpVo) {
		return sst.selectOne("adminMapper.selectHelp", helpVo);
	}
	
	//고객센터 문의 답변
	@Override
	public int updateHelp(SqlSessionTemplate sst, HelpVo helpVo) {
		return sst.update("adminMapper.updateHelp", helpVo);
	}

	//탈퇴 설문 등록
	@Override
	public int quitWrite(SqlSessionTemplate sst, QuitVo quitVo) {
		return sst.insert("adminMapper.quitWrite", quitVo);
	}

	//탈퇴 설문 목록 조회
	@Override
	public List<QuitVo> selectQuitList(SqlSessionTemplate sst) {
		return sst.selectList("adminMapper.selectQuitList");
	}

	//탈퇴 설문 삭제
	@Override
	public int deleteQuit(SqlSessionTemplate sst, QuitVo quitVo) {
		return sst.update("adminMapper.deleteQuit", quitVo);
	}

	//챗봇 목록 조회
	@Override
	public List<ChatbotVo> selectChatbotList(SqlSessionTemplate sst) {
		return sst.selectList("adminMapper.selectChatbotList");
	}

	//챗봇 질의응답 등록
	@Override
	public int chatbotWrite(SqlSessionTemplate sst, ChatbotVo chatbotVo) {
		return sst.insert("adminMapper.chatbotWrite", chatbotVo);
	}

	//챗봇 질의응답 삭제
	@Override
	public int deleteChatbot(SqlSessionTemplate sst, ChatbotVo chatbotVo) {
		return sst.update("adminMapper.deleteChatbot", chatbotVo);
	}

	//탈퇴 답변 전체 수 카운트
	@Override
	public int quitCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.quitCount");
	}

	//탈퇴 답변 목록 조회
	@Override
	public List<MemberVo> selectQuitList(SqlSessionTemplate sst, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectQuit", rb);
	}

	//통계 데이터 조회
	@Override
	public List<Map<String, String>> selectStats(SqlSessionTemplate sst) {
		return sst.selectList("adminMapper.selectStats");
	}

	//닉네임 중복 조회
	@Override
	public int checkNick(SqlSessionTemplate sst, String nick) {
		return sst.selectOne("adminMapper.checkNick", nick);
	}
	
	
	
}
