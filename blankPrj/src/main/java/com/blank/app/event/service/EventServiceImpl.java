package com.blank.app.event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int attendance(String no, int i) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("att", i);
		
		int result = dao.insertAttendance(sst, no);
		int result2 = dao.updatePoint(sst, map);
		
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

	// 연속하여 출석한 날짜 체크
	public int attiDateCheck(Map<String, Object> map) {
		return dao.selectContinuousAtt(sst, map);
	}

	// 총 출석한 날짜
	public int selectTotalAtt(String no) {
		return dao.selectTotalAtt(sst, no);
	}

}
