package com.blank.app.event.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blank.app.member.vo.MemberVo;

@Service
public interface EventService {

	int attendance(String no);

	boolean selectTodayAtt(String no);

	List<String> selectAttList(String no);

}
