package com.blank.app.notice.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.NoticeVo;

public interface NoticeDao {

	int listCount(SqlSessionTemplate sst);

	List<NoticeVo> selectList(SqlSessionTemplate sst, Map<String, String> map, PageVo pageVo);

	NoticeVo selectNotice(SqlSessionTemplate sst, NoticeVo noticeVo);
}
