package com.poosil.chatting;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class HttpSessionConfigurator extends Configurator {
	public static final String Session = "Session";
	public static final String Context = "Context";

	// 	EndPointConfig에 HttpSession과 HttpContext를 넣는다. Request와 Response는 웹 요청, 응답시에만 필요한 데이터이기 때문에 필요없다.	
	@Override
	public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
		// HttpRequest로부터 Session을 받는다.	
		HttpSession session = (HttpSession) request.getHttpSession();
		// 	HttpSession으로 부터 Context도 받는다.	
		ServletContext context = session.getServletContext();
		config.getUserProperties().put(HttpSessionConfigurator.Session, session);
		config.getUserProperties().put(HttpSessionConfigurator.Context, context);
	}
}

