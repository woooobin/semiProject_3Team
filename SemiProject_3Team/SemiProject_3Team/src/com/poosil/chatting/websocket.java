package com.poosil.chatting;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//handshake 설정하기 위한 클래스를 지정한다.	
@ServerEndpoint(value = "/websocket", configurator = HttpSessionConfigurator.class)
public class websocket {
	private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());

	// handshake가 끝나면 handleOpen이 호출된다.	
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) {
		System.out.println("client is now connected...");
		// EndpointConfig의 클래스를 위 맵에 넣는다.	
		if (!configs.containsKey(userSession)) {
			// userSession 클래스는 connection이 될 때마다 인스턴스 생성되는 값이기 때문에 키로서 사용할 수 있다.
			configs.put(userSession, config);
		}
	}

	// 클라이언트로 부터 메시지가 오면 handleMessage가 호출 된다.	
	@OnMessage
	public String handleMessage(String message, Session userSession) {
		// 위 맵으로 부터 userSession을 키로 EndpointConfig값을 가져온다.	
		if (configs.containsKey(userSession)) {
			EndpointConfig config = configs.get(userSession);
			// HttpSessionConfigurator에서 설정한 session값을 가져온다.
			HttpSession session = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);
			// Session의 TestSession키로 데이터를 가져온다. (테스트용)
			return "Session - " + (String) session.getAttribute("TestSession");
		}
		return "error";
	}

	@OnClose
	public void handleClose(Session userSession) {
		System.out.println("client is now disconnected...");
		// 접속이 종료되면 map에서 EndpointConfig를 제거한다.	
		if (configs.containsKey(userSession)) {
			configs.remove(userSession);
		}
	}

	@OnError
	public void handleError(Throwable e, Session userSession) {
		e.printStackTrace();
	}
}
