package com.blank.app.help.service;

import java.util.List;
import java.util.Map;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;

public interface HelpService {

	List<HelpVo> selectHelp(Map<String, String> map, PageVo pageVo);

	int helpCount();

	List<HelpVo> selectInquiry(Map<String, String> map, PageVo pageVo);

	HelpVo selectInquiry(HelpVo helpVo);

	int inquiryWrite(HelpVo helpVo);

	int faqCount(String category);

	List<FaqVo> selectFaqList(Map<String, String> map, PageVo pageVo);

	FaqVo selectFaq(FaqVo faqVo);

}
