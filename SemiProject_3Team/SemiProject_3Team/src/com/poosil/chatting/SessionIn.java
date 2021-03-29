package com.poosil.chatting;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//테스트를 위한 클래스	
@WebServlet("/SessionIn")
public class SessionIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SessionIn() {
		super();
	}

    // 파라미터 param에 값이 넘겨오면 TestSession이름으로 세션에 넣는다.	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String param = request.getParameter("param");
		if (param == null || param.isEmpty()) {
			param = "hello world";
		}
		request.getSession().setAttribute("TestSession", param);
		response.getWriter().append("Session In OK ");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}