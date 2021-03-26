package com.poosil.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poosil.login.biz.loginBiz;
import com.poosil.login.dto.loginDto;

@WebServlet("/logincontroller")
public class logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public logincontroller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		loginBiz biz = new loginBiz();

		if (command.equals("login")) {

			String userid = request.getParameter("userid");
			String password = request.getParameter("password");

			HttpSession session = request.getSession();

			loginDto dto = biz.login(userid, password);

			if (dto != null) {
				// session scope에 객체 담기
				// 일반적으로 로그인 정보 session에 담는다. 만료되기 전 까지 페이지 전체에 적용 가능. request 보다 session에.
				session.setAttribute("dto", dto);
				// 만료되는 시간 설정 (default: 30분)
				if (dto.getUserrole().equals("ADMIN")) {
					dispatch(request, response, "adminmain.jsp");
				} else if (dto.getUserrole().equals("USER")) {
					dispatch(request, response, "usermain.jsp");

				}

			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 실패'); location.href='login.jsp';</script>");
				out.flush();

			}

		}else if(command.equals("adminback")){
			dispatch(request, response, "adminmain.jsp");
			
		}else if(command.equals("userback")) {
			dispatch(request, response, "usermain.jsp");
		} else if (command.equals("logout")) {
			HttpSession session = request.getSession();
			// session scope에서 값 삭제 (만료)
			// 클라이언트 하나(브라우저 하나)를 관리하는게 session 하나.
			session.invalidate();
			response.sendRedirect("login.jsp");

		} else if (command.equals("listall")) {
			// 1. 보내준 값이 있니?
			// 2. db에 전달할 값
			List<loginDto> list = biz.selectAllUser();
			// 3. 화면에 전달 할 값. 보내줄 객체가 있으면 request에 담자
			// request
			request.setAttribute("list", list);
			// 4. 보낸다.
			dispatch(request, response, "userlistall.jsp");
		} else if (command.equals("listen")) {
			List<loginDto> list = biz.selectEnabledUser();
			request.setAttribute("list", list);
			dispatch(request, response, "userlisten.jsp");
		} else if (command.equals("updateform")) {
			String userid = request.getParameter("userid");
			loginDto dto = biz.selectUser(userid);
			request.setAttribute("dto", dto);
			dispatch(request, response, "userupdate.jsp");

		} else if (command.equals("userupdate")) {
			String userid = request.getParameter("userid");
			String userrole = request.getParameter("user");

			int res = biz.updateRole(userid, userrole);

			if (res > 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정 성공!'); location.href='login.do?command=listen';</script>");
				out.flush();

			} else {
				PrintWriter out = response.getWriter();
				out.println(
						"<script>alert('수정 실패!'); location.href='login.do?command=updateform&userid=<%=userid%>';</script>");
				out.flush();
			}
		} else if (command.equals("signupform")) {
			response.sendRedirect("signup.jsp");

		} else if (command.equals("idchk")) {
			
			String userid = request.getParameter("userid");
			int result = biz.idCheck(userid);
			System.out.println(userid);
			boolean idnotused = true;
			if (result > 0) {
				idnotused = false;
			}
			response.sendRedirect("idchk.jsp?idnotused=" + idnotused);

		} else if (command.equals("insertuser")) {
			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			String useremail = request.getParameter("useremail");
			int userphone = Integer.parseInt(request.getParameter("userphone"));
			String address = request.getParameter("address");
			//String addresslatitude = request.getParameter("addresslatitude");
			//String addresslongitude = request.getParameter("addresslongitude");
			String isseller = request.getParameter("isseller");
			//String sellersopt = request.getParameter("sellersopt");
			String avatar = request.getParameter("avatar");
			//String usernickname = request.getParameter("usernickname");
			String username = request.getParameter("username");
			
			
			
			loginDto dto = new loginDto();
			dto.setUserid(userid);
			dto.setPassword(password);
			dto.setUseremail(useremail);
			dto.setUserphone(userphone);
			dto.setAddress(address);
			dto.setIsseller(isseller);
			dto.setAvatar(avatar);
			dto.setUsername(username);
			int res = biz.insertUser(dto);
			
			if (res > 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('회원가입 성공!'); location.href='login.html';</script>");
				out.flush();
			}else {
				PrintWriter out = response.getWriter();
				out.println(
						"<script>alert('회원가입 실패!'); location.href='login.do?command=signupform';</script>");
				out.flush();
			}
			
		}else if(command.equals("myinfo")) {
			String userid = request.getParameter("userid");
			System.out.println(userid);
			loginDto dto = biz.selectMy(userid);
			
			request.setAttribute("dto",dto );
			
			System.out.println(dto);
			dispatch(request, response, "myinfo.jsp");
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
