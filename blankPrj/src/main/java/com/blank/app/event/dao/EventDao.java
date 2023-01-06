package com.blank.app.event.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.member.vo.MemberVo;

@Repository
public interface EventDao {

	int insertAttendance(SqlSessionTemplate sst, String no);

	int updatePoint(SqlSessionTemplate sst, Map<String, Object> map);

	int selectTodayAtt(SqlSessionTemplate sst, String no);

	List<String> selectAttList(SqlSessionTemplate sst, String no);

	int selectContinuousAtt(SqlSessionTemplate sst, Map<String, Object> map);

	int selectTotalAtt(SqlSessionTemplate sst, String no);

}
