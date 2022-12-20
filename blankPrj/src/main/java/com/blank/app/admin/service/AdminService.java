package com.blank.app.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.blank.app.admin.dao.AdminDao;
import com.blank.app.admin.vo.AdminVo;
import com.blank.app.admin.vo.NoticeVo;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private AdminDao admindao;
	
	//로그인
	public AdminVo login(AdminVo vo) {
		return admindao.login(sst, vo);
	}
	
	//공지사항 조회
	public List<NoticeVo> selectList() {
		return admindao.selectList(sst);
	}
	
}
