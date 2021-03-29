package com.poosil.chatting;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//테스트를 위한 클래스	
@WebServlet("/SessionOut")
public class SessionOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SessionOut() {
		super();
	}

// 요청되면 TestSession이름으로 세션을 제거한다.	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("TestSession", null);
		response.getWriter().append("Session Clear ");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}