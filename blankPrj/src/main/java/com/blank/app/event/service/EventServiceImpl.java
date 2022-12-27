package com.blank.app.event.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.event.dao.EventDao;
import com.blank.app.member.vo.MemberVo;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao dao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 출석하기
	@Override
	public int attendance(MemberVo loginMember) {
		return dao.insertAttendance(sst, loginMember);
	}

}
