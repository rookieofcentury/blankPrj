package com.blank.app.event.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.member.vo.MemberVo;

@Repository
public class EventDaoImpl implements EventDao {

	// 출석하기
	public int insertAttendance(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.insert("eventMapper.insertAttendance", loginMember);
	}
	
}
