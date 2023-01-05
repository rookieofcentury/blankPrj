package com.blank.app.event.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.member.vo.MemberVo;

@Repository
public class EventDaoImpl implements EventDao {

	// 출석하기
	public int insertAttendance(SqlSessionTemplate sst, String no) {
		return sst.insert("eventMapper.insertAttendance", no);
	}

	// 포인트 적립
	public int updatePoint(SqlSessionTemplate sst, String no) {
		return sst.update("eventMapper.updatePoint", no);
	}

	// 오늘 날짜 출석 돼 있는지
	public int selectTodayAtt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("eventMapper.selectTodayAtt", no);
	}
	
	// 출석한 날짜 받아 오기
	public List<String> selectAttList(SqlSessionTemplate sst, String no) {
		return sst.selectList("eventMapper.selectAttList", no);
	}
	
}
