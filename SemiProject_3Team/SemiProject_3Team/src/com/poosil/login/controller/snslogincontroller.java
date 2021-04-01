package com.poosil.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poosil.login.biz.loginBiz;
import com.poosil.login.dto.loginDto;

@WebServlet("/snslogin")
public class snslogincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public snslogincontroller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println(command);
		String useremail = request.getParameter("useremail");
		System.out.println(useremail);

		loginBiz biz = new loginBiz();
		if (command.equals("snslogin")) {
			System.out.println(useremail);
			String token = request.getParameter("token");
			System.out.println(token);
			int snsres = biz.snslogin(useremail);

			if (snsres == 0) {

				System.out.println(snsres);
				response.sendRedirect("snssignup.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("sessionID", useremail);
				loginDto dto = biz.snslogin2(useremail);
				if (dto != null) {
					// session scope에 객체 담기
					// 일반적으로 로그인 정보 session에 담는다. 만료되기 전 까지 페이지 전체에 적용 가능. request 보다 session에.
					session.setAttribute("dto", dto);
					// 만료되는 시간 설정 (default: 30분)
					if (dto.getUserenabled().equals("Y")) {
						if (dto.getUserrole().equals("ADMIN")) {
							session.setAttribute("sessionID", useremail);
							dispatch(request, response, "index.jsp");
						} else if (dto.getUserrole().equals("USER")) {
							session.setAttribute("sessionID", useremail);
							dispatch(request, response, "index.jsp");
							
						}
					} else {
						PrintWriter out = response.getWriter();
						out.println("<script>alert('탈퇴한 회원입니다.'); location.href='login.do?command=logout';</script>");
						out.flush();

					}
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script>alert('로그인 실패'); location.href='login.jsp';</script>");
					out.flush();
				}

				
			}
		}else if (command.equals("insertuser")) {
			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			int userphone = Integer.parseInt(request.getParameter("userphone"));
			System.out.println(request.getParameter("userphone"));
			String address = request.getParameter("address");
			// String addresslatitude = request.getParameter("addresslatitude");
			// String addresslongitude = request.getParameter("addresslongitude");
			// String sellersopt = request.getParameter("sellersopt");
			String avatar = request.getParameter("avatar");
			// String usernickname = request.getParameter("usernickname");
			String username = request.getParameter("username");
			String userenabled = request.getParameter("userenabled");
			String usernickname = request.getParameter("usernickname");

			loginDto dto = new loginDto();
			dto.setUserid(userid);
			dto.setPassword(password);
			dto.setUseremail(useremail);
			dto.setUserphone(userphone);
			dto.setAddress(address);
			dto.setAvatar(avatar);
			dto.setUsername(username);
			dto.setUserenabled(userenabled);
			dto.setUsernickname(usernickname);
			int res = biz.insertUser(dto);

			if (res > 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('sns회원가입 성공!');location.href='index.jsp'; </script>");
				out.flush();
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('sns회원가입 실패!'); location.href='login.do?command=signupform';</script>");
				out.flush();
			} 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
