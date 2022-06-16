package org.starworks.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ServerEndpoint(value = "/ws")
public class ChattingController {

	private static final List<Session> sessionList = new ArrayList<Session>();;

	public ChattingController() {
		// TODO Auto-generated constructor stub
		System.out.println("웹소켓(서버) 객체생성");
	}
	
	@GetMapping("/ws")
	public void ws() {
		
	}
	
	@GetMapping("/test")
	public void test() {
		
	}

//	@RequestMapping(value = "/data.mc")
//	@ResponseBody
//	public void getData(HttpServletRequest request) {
//		String temp = request.getParameter("temp");
//		String humi = request.getParameter("humi");
//		System.out.println("getData:" + temp + ": " + humi);
//		sendAllMessage(temp + ": " + humi);
//	}

	private void sendAllMessage(String message) {
		System.out.println("웹소켓(서버) sendAllMessage");
		try {
			for (Session session : ChattingController.sessionList) {
					session.getBasicRemote().sendText(message);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println("Open session id:" + session.getId());

		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("Connection Established--------------------");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}

	/*
	 * 모든 사용자에게 메시지를 전달한다.
	 * 
	 * @param self
	 * 
	 * @param message
	 */
	private void sendAllSessionToMessage(Session self, String message) {
		System.out.println("웹소켓(서버) sendAllSessionToMessage");
		try {
			for (Session session : ChattingController.sessionList) {
				if (!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(message);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("웹소켓(서버) onMessage");
		System.out.println("Message From " + message);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("send Messge : " + message);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sendAllSessionToMessage(session, message);
	}

	@OnError
	public void onError(Throwable e, Session session) {

	}

	@OnClose
	public void onClose(Session session) {
		System.out.println("웹소켓(서버) onClose");
		sessionList.remove(session);
	}
}
