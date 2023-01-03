package com.blank.app.notice.service;

import java.util.List;
import java.util.Map;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.vo.NoticeVo;

public interface NoticeService {

	int listCount();

	List<NoticeVo> selectList(Map<String, String> map, PageVo pageVo);

	NoticeVo selectOne(NoticeVo noticeVo);

}
