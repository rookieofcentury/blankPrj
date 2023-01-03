package com.blank.app.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.NoticeVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class NoticeDaoImpl implements NoticeDao{

	//공지사항 전체수 조회
	@Override
	public int listCount(SqlSessionTemplate sst) {
		return sst.selectOne("noticeMapper.listCount");
	}

	//공지사항 목록 조회
	@Override
	public List<NoticeVo> selectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo) {
		
		int offset = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("noticeMapper.selectList", map, rb);
	}

	//공지사항 상세조회
	@Override
	public NoticeVo selectNotice(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.selectOne("noticeMapper.selectNotice", noticeVo);
	}

	
}
