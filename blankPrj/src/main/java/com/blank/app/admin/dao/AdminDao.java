package com.blank.app.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.logging.log4j.core.tools.picocli.CommandLine.Help;
import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.quit.vo.QuitVo;
import com.blank.app.report.vo.ReportVo;

public interface AdminDao {

	public AdminVo login(SqlSessionTemplate sst, AdminVo vo);
	
	public List<NoticeVo> selectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);
	
	public int listCount(SqlSessionTemplate sst);
	
	public int noticeWrite(SqlSessionTemplate sst, NoticeVo noticeVo);
	
	public NoticeVo selectNotice(SqlSessionTemplate sst, NoticeVo noticeVo);
	
	public int updateNotice(SqlSessionTemplate sst, NoticeVo noticeVo);
	
	public int memberCount(SqlSessionTemplate sst);
	
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);
	
	public int projectCount(SqlSessionTemplate sst);
	
	public List<ProjectVo> selectProjectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);
	
	public ProjectVo selectPrj(SqlSessionTemplate sst, ProjectVo projectVo);
	
	public int deProjectCount(SqlSessionTemplate sst);
	
	public List<ReportVo> selectDeProjectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);
	
	public MemberVo selectMember(SqlSessionTemplate sst, MemberVo memberVo);
	
	public int updateMember(SqlSessionTemplate sst, MemberVo memberVo);
	
	public int faqCount(SqlSessionTemplate sst);
	
	public List<FaqVo> selectFaqList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);
	
	public int helpCount(SqlSessionTemplate sst);
	
	public List<HelpVo> selectHelpList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);

	public int deleteNotice(SqlSessionTemplate sst, NoticeVo noticeVo);

	public int cancelProject(SqlSessionTemplate sst, ProjectVo projectVo);

	public int updateReport(SqlSessionTemplate sst, ReportVo reportVo);

	public ReportVo selectReport(SqlSessionTemplate sst, ReportVo reportVo);

	public int approvalProject(SqlSessionTemplate sst, ProjectVo projectVo);

	public FaqVo selectFaq(SqlSessionTemplate sst, FaqVo faqVo);

	public int updateFaq(SqlSessionTemplate sst, FaqVo faqVo);

	public int deleteFaq(SqlSessionTemplate sst, FaqVo faqVo);

	public int faqWrite(SqlSessionTemplate sst, FaqVo faqVo);

	public HelpVo selectHelp(SqlSessionTemplate sst, HelpVo helpVo);

	public int updateHelp(SqlSessionTemplate sst, HelpVo helpVo);

	public int quitWrite(SqlSessionTemplate sst, QuitVo quitVo);

	public List<QuitVo> selectQuitList(SqlSessionTemplate sst);

	public int deleteQuit(SqlSessionTemplate sst, QuitVo quitVo);

	
}
