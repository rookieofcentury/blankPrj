package com.blank.app.chat.server;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.blank.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatServer extends TextWebSocketHandler{

	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	//연결 완료 이후 동작
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("[연결]{}",session);
		Map map = session.getAttributes();	//이게 닉네임 받아오는 건데 저는 loginMember에 있는 no를 가지고 오고 싶어용
		

		
		log.info(map.toString());
		sessionSet.add(session);
	}

	//메세지 보냄//session.sendMessage(message);
	
	
	
	//메세지 받음
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("[수신] {} : {}", session, message);	//누가 뭐라고 보냈는지
		
		//연결된 모든 클라에게 발신
		for(WebSocketSession x : sessionSet) {
			if(!x.isOpen()) continue;
			x.sendMessage(message);
		}
	}
	
	//소켓 연결 종료 이후에 동작
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//session : 클라 정보 , status : 왜 접속이 끊겼는지
		log.info("[종료] {} 연결 종료 {}", session, status);
		sessionSet.remove(session);
	}
	
}
