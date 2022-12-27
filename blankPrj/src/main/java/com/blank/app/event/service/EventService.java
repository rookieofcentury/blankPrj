package com.blank.app.event.service;

import org.springframework.stereotype.Service;

import com.blank.app.member.vo.MemberVo;

@Service
public interface EventService {

	int attendance(MemberVo loginMember);

}
