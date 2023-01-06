package com.blank.app.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.blank.app.member.vo.MemberVo;

@Service
public interface EventService {

	int attendance(String no, int i);

	boolean selectTodayAtt(String no);

	List<String> selectAttList(String no);

	int attiDateCheck(Map<String, Object> map);

	int selectTotalAtt(String no);

}
