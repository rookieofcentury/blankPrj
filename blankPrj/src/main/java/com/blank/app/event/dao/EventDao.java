package com.blank.app.event.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.member.vo.MemberVo;

@Repository
public interface EventDao {

	int insertAttendance(SqlSessionTemplate sst, MemberVo loginMember);

}
