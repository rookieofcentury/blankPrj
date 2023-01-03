package com.blank.app.notice.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.NoticeVo;
import com.blank.app.notice.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private NoticeDao noticeDao;
	
	//공지사항 전체 글 조회
	@Override
	public int listCount() {
		return noticeDao.listCount(sst);
	}

	//공지사항 목록 조회
	@Override
	public List<NoticeVo> selectList(Map<String, String> map, PageVo pageVo) {
		return noticeDao.selectList(sst, map, pageVo);
	}

	//공지사항 상세조회
	@Override
	public NoticeVo selectOne(NoticeVo noticeVo) {
		return noticeDao.selectNotice(sst, noticeVo);
	}


}
