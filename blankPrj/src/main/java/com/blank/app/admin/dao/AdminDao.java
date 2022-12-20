package com.blank.app.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.NoticeVo;

@Repository
public class AdminDao {

	//로그인
	public AdminVo login(SqlSessionTemplate sst, AdminVo vo) {
		return sst.selectOne("adminMapper.login", vo);
	}
	
	//공지사항 조회
	public List<NoticeVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("adminMapper.selectList");
	}
	
}
