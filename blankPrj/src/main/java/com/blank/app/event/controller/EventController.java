package com.blank.app.event.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.event.service.EventService;
import com.blank.app.member.vo.MemberVo;

@RequestMapping("/attendance")
@Controller
public class EventController {
	
	@Autowired
	private EventService es;
	
	// 출석부 화면 도출
	@GetMapping
	public String attendance(HttpSession session) throws ParseException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

		MemberVo vo = (MemberVo) session.getAttribute("loginMember");
		
		// 오늘 날짜, 어제 날짜 조회		
//		Date today = new Date();
//		Date yesterday = new Date();
//		yesterday =	new Date(yesterday.getTime() + (1000*60*60*24*-1));
//		String todaydate = sdf.format(today);
//		String yesterdaydate = sdf.format(yesterday);
//		System.out.println(todaydate);
//		System.out.println(yesterdaydate);

		// 나 오늘 출석했냐?
		boolean isCheck = es.selectTodayAtt(vo.getNo());
		List<String> list = es.selectAttList(vo.getNo());
		int totalAtt = es.selectTotalAtt(vo.getNo());
		
		int perfectAtt = myPerfectAttendance(vo);
		
		// 특정 일자 날짜 조회
//		String dec31 = "2022/12/31";
//		Date dec31date = sdf.parse(dec31);
//		Date dec30 = new Date();
//		dec30 =	new Date(dec31date.getTime() + (1000*60*60*24*-1));
//		System.out.println(dec31date);
//		System.out.println(dec30);
		
		session.setAttribute("isCheck", isCheck);
		session.setAttribute("attList", list);
		session.setAttribute("perfectAtt", perfectAtt);
		session.setAttribute("totalAtt", totalAtt);
		
		return "event/attendance";
		
	}
	
	// 출석 (찐) + 포인트 적립하기
	@PostMapping
	@ResponseBody
	public String attendanceOn(String no, HttpSession session) {
		
		MemberVo vo = (MemberVo) session.getAttribute("loginMember");
		int i = myPerfectAttendance(vo);
		
		int point;
		
		if(i == 7) {
			point = 500;
		} else if(i == 30) {
			point = 3000;
		} else if(i == 365) {
			point = 45000;
		} else {
			point = 10;
		}
		
		int result = es.attendance(no, i);

		if(result == 0) {
			return "fail";
		}

		vo.setPoint(Integer.toString(Integer.parseInt(vo.getPoint()) + point));
		session.setAttribute("loginMember", vo);
		
		return "success";
		
	}
	
	// 연속 출석 날짜 구하기!
	public int myPerfectAttendance(MemberVo vo) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		int i = 1;
		
		// 날짜 계속 조회
		while(true) {
			
			Date oneday = new Date(); // 오늘 날짜 조회하고
			Date oneyesterday = new Date();
			oneyesterday = new Date(oneyesterday.getTime() + (1000*60*60*24*-i)); // i가 늘어날 때마다 i일만큼 전으로 돌아가기
			String d = sdf.format(oneyesterday);

			// 로그인한 사람이 oneyesterday (i일 전에) 로그인한 기록이 있는지
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("no", vo.getNo());
			map.put("day", d);
			
			int rowCnt = es.attiDateCheck(map); // 그 날짜에 출석한 기록이 있으면 1이 나올 것임
			if(rowCnt == 0) break;
			
			i += 1; // 반복문 돌 때마다 i 1씩 올라가기!
			
		}
		
		return i;
		
	}

}
