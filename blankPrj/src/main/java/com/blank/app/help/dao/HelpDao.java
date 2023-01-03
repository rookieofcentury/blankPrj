package com.blank.app.help.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;

public interface HelpDao {

	List<HelpVo> selectHelpList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);

	int helpCount(SqlSessionTemplate sst);

	List<HelpVo> selectInquiryList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);

	HelpVo selectInquiry(SqlSessionTemplate sst, HelpVo helpVo);

	int inquiryWrite(SqlSessionTemplate sst, HelpVo helpVo);

	int faqCount(SqlSessionTemplate sst);

	List<FaqVo> selectFaqList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);

	FaqVo selectFaq(SqlSessionTemplate sst, FaqVo faqVo);

}
