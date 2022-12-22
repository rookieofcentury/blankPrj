package com.blank.app.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.NoticeVo;

@Repository
public class AdminDao {

	//로그인
	public AdminVo login(SqlSessionTemplate sst, AdminVo vo) {
		return sst.selectOne("adminMapper.login", vo);
	}
	
	//공지사항 조회
	public List<NoticeVo> selectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv) {
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("adminMapper.selectList", map, rb);
	}

	//공지사항 전체 글 카운트
	public int listCount(SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.listCount");
	}

	public int noticeWrite(SqlSessionTemplate sst, NoticeVo noticeVo) {
		return sst.insert("adminMapper.noticeWrite");
	}
	
}
