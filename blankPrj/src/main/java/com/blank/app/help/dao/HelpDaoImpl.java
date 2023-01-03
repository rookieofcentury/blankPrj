package com.blank.app.help.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.FaqVo;
import com.blank.app.admin.vo.HelpVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class HelpDaoImpl implements HelpDao{

	//고객센터 문의 목록 조회
	@Override
	public List<HelpVo> selectHelpList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("helpMapper.selectList", map, rb);
	}

	//고객센터 문의 전체 글 카운트
	@Override
	public int helpCount(SqlSessionTemplate sst) {
		return sst.selectOne("helpMapper.listCount");
	}

	//고객센터 문의 조회
	@Override
	public List<HelpVo> selectInquiryList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {

		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("helpMapper.selectInquiryList", map, rb);
	}

	//고객센터 문의 상세조회
	@Override
	public HelpVo selectInquiry(SqlSessionTemplate sst, HelpVo helpVo) {
		return sst.selectOne("helpMapper.selectInquiry", helpVo);
	}

	//고객센터 문의 등록
	@Override
	public int inquiryWrite(SqlSessionTemplate sst, HelpVo helpVo) {
		return sst.insert("helpMapper.inquiryWrite", helpVo);
	}

	//FAQ 전체 카운트
	@Override
	public int faqCount(SqlSessionTemplate sst) {
		return sst.selectOne("helpMapper.faqCount");
	}

	//FAQ 목록 조회
	@Override
	public List<FaqVo> selectFaqList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("helpMapper.selectFaqList", map, rb);
	}

	//FAQ 상세조회
	@Override
	public FaqVo selectFaq(SqlSessionTemplate sst, FaqVo faqVo) {
		return sst.selectOne("helpMapper.selectFaq", faqVo);
	}

}
