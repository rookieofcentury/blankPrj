package com.blank.app.help.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;
import com.blank.app.help.dao.HelpDao;

@Service
public class HelpServiceImpl implements HelpService{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private HelpDao helpDao;
	
	//고객센터 문의 목록 미리보기(메인 화면)
	@Override
	public List<HelpVo> selectHelp(Map<String, String> map, PageVo pageVo) {
		return helpDao.selectHelpList(sst, map, pageVo);
	}

	//고객센터 문의 글 전체 조회
	@Override
	public int helpCount() {
		return helpDao.helpCount(sst);
	}

	//고객센터 문의 조회
	@Override
	public List<HelpVo> selectInquiry(Map<String, String> map, PageVo pageVo) {
		return helpDao.selectInquiryList(sst, map, pageVo);
	}

	//고객센터 문의 상세조회
	@Override
	public HelpVo selectInquiry(HelpVo helpVo) {
		return helpDao.selectInquiry(sst, helpVo);
	}

	//고객센터 문의 등록
	@Override
	public int inquiryWrite(HelpVo helpVo) {
		return helpDao.inquiryWrite(sst, helpVo);
	}

	//FAQ 전체 카운트
	@Override
	public int faqCount(String category) {
		return helpDao.faqCount(sst, category);
	}

	//FAQ 목록 조회
	@Override
	public List<FaqVo> selectFaqList(Map<String, String> map, PageVo pageVo) {
		return helpDao.selectFaqList(sst, map, pageVo);
	}

	//FAQ 상세조회
	@Override
	public FaqVo selectFaq(FaqVo faqVo) {
		return helpDao.selectFaq(sst, faqVo);
	}


}
