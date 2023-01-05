package com.blank.app.event.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blank.app.event.dao.EventDao;
import com.blank.app.member.vo.MemberVo;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao dao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 출석하기
	@Transactional
	public int attendance(String no) {
		
		int result = dao.insertAttendance(sst, no);
		int result2 = dao.updatePoint(sst, no);
		
		return result * result2;
	}

	// 오늘 출석했음?
	public boolean selectTodayAtt(String no) {
		
		int cnt = dao.selectTodayAtt(sst, no);
		if(cnt == 0) {
			return false;
		}
		
		return true;
	}

	// 출석 날짜 list
	public List<String> selectAttList(String no) {
		return dao.selectAttList(sst, no);
	}

}
