package com.blank.app.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.core.tools.picocli.CommandLine.Help;
import org.springframework.stereotype.Service;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.quit.vo.QuitVo;
import com.blank.app.report.vo.ReportVo;


public interface AdminService {
	
	public AdminVo login(AdminVo vo);
	
	public List<NoticeVo> selectList(Map<String, String> map, PageVo pageVo);
	
	public int listCount();
	
	public int noticeWrite(NoticeVo noticeVo);
	
	public NoticeVo selectOne(NoticeVo noticeVo);
	
	public int updateOne(NoticeVo noticeVo);
	
	public int memberCount();
	
	public List<MemberVo> selectMemberList(Map<String, String> map, PageVo pageVo);
	
	public int projectCount();
	
	public List<ProjectVo> selectProjectList(Map<String, String> map, PageVo pageVo);
	
	public ProjectVo selectPrj(ProjectVo projectVo);
	
	public int deProjectCount();
	
	public List<ReportVo> selectDeProjectList(Map<String, String> map, PageVo pageVo);
	
	public MemberVo selectMember(MemberVo memberVo);
	
	public int updateMember(MemberVo memberVo);
	
	public int faqCount();
	
	public List<FaqVo> selectFaq(Map<String, String> map, PageVo pageVo);
	
	public int helpCount();
	
	public List<HelpVo> selectHelp(Map<String, String> map, PageVo pageVo);

	public int deleteNotice(NoticeVo noticeVo);

	public int cancelProject(ProjectVo projectVo);

	public int updateReport(ReportVo reportVo);

	public ReportVo selectReport(ReportVo reportVo);

	public int approvalProject(ProjectVo projectVo);

	public FaqVo selectFaq(FaqVo faqVo);

	public int updateFaq(FaqVo faqVo);

	public int deleteFaq(FaqVo faqVo);

	public int faqWrite(FaqVo faqVo);

	public HelpVo selectHelp(HelpVo helpVo);

	public int updateHelp(HelpVo helpVo);

	public int quitWrite(List<QuitVo> quitList);

	public List<QuitVo> selectQuit();

	public int deleteQuit(QuitVo quitVo);


}
