package com.poosil.free.controller;

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

import com.poosil.comment.biz.CommentBiz;
import com.poosil.comment.biz.CommentBizImpl;
import com.poosil.comment.dao.CommentDao;
import com.poosil.comment.dao.CommentDaoImpl;
import com.poosil.comment.dto.CommentDto;
import com.poosil.free.biz.FreeBoardBiz;
import com.poosil.free.biz.FreeBoardBizImpl;
import com.poosil.free.dao.FreeBoardDao;
import com.poosil.free.dao.FreeBoardDaoImpl;
import com.poosil.free.dto.FreeBoardDto;
import com.poosil.login.dto.loginDto;

@WebServlet("/free.do")
public class FreeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		CommentBiz cbiz = new CommentBizImpl();
		CommentDao cdao = new CommentDaoImpl();
		FreeBoardDao dao = new FreeBoardDaoImpl();
		FreeBoardBiz biz = new FreeBoardBizImpl();
		String command = request.getParameter("command");

		if (command.equals("list")) {
			List<FreeBoardDto> list = biz.selectList();
			request.setAttribute("list", list);
			System.out.println("list: "+list.get(1).getRegdate());
			dispatch(request, response, "freeboard/list.jsp");
		} else if (command.equals("select")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));

			dao.readcount(freeboardseq);

			FreeBoardDto dto = biz.selectOne(freeboardseq);
			List<CommentDto> clist = cbiz.selectList(freeboardseq);
			request.setAttribute("clist", clist);
			
			request.setAttribute("dto", dto);
			dispatch(request, response, "freeboard/select.jsp");

		} else if (command.equals("insertform")) {
			dispatch(request, response, "freeboard/insert.jsp");

		} else if (command.equals("insertres")) {

			loginDto loginDto = (loginDto) session.getAttribute("dto");

			// 로그인한 유저 npe 처리
			if (loginDto != null) {

				String userid = loginDto.getUserid();
				String freeboardtitle = request.getParameter("freeboardtitle");
				String freeboardcontent = request.getParameter("freeboardcontent");

				FreeBoardDto dto = new FreeBoardDto(0, userid, freeboardtitle, freeboardcontent, null, 0);
				int res = biz.insert(dto);

				if (res > 0) {
					response.sendRedirect("free.do?command=list");
				} else {
					response.sendRedirect("free.do?command=insertform");
				}
			}

		} else if (command.equals("updateform")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));

			FreeBoardDto dto = biz.selectOne(freeboardseq);

			request.setAttribute("fbdto", dto);

			dispatch(request, response, "freeboard/update.jsp");

		} else if (command.equals("updateres")) {

			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			String freeboardtitle = request.getParameter("freeboardtitle");
			String freeboardcontent = request.getParameter("freeboardcontent");

			FreeBoardDto dto = new FreeBoardDto(freeboardseq, null, freeboardtitle, freeboardcontent, null, 0);

			int res = biz.update(dto);

			if (res > 0) {
				response.sendRedirect("free.do?command=select&freeboardseq=" + freeboardseq);
			} else {
				response.sendRedirect("free.do?command=updateform&freeboardseq=" + freeboardseq);
			}

		} else if (command.equals("delete")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			int res = biz.delete(freeboardseq);
			System.out.println("FREEBOARDSEQ : " + freeboardseq);

			if (res > 0) {
				dispatch(request, response, "free.do?command=list");
			} else {
				dispatch(request, response, "free.do?command=select&freeboardseq=" + freeboardseq);
			}

		} else if (command.equals("cinsert")) {
			String userid = request.getParameter("userid");
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			String commentcontent = request.getParameter("commentcontent");
			System.out.println("seq : " + freeboardseq);
			System.out.println("sessionID : " + userid);
			System.out.println("commentcontent : " + commentcontent);

			CommentDto cdto = new CommentDto();
			cdto.setFreeboardseq(freeboardseq);
			cdto.setUserid(userid);
			cdto.setCommentcontent(commentcontent);

			int res = cbiz.insert(cdto);
			PrintWriter out = response.getWriter();
			if (res > 0) {
				response.sendRedirect("free.do?command=select&freeboardseq=" + freeboardseq);
			} else {
				out.println("<script type='text/javascript'>");
				out.println("history.back();");
				out.println("alert('댓글 작성 실패');");
				out.println("</script>");
			}

		} else if (command.equals("updateanswer")) {

			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			int updatecommentno = Integer.parseInt(request.getParameter("updatecommentno"));
			String updateuserid = request.getParameter("updateuserid");
			String updatecontent = request.getParameter("updatecontent");

			CommentDto cdto = new CommentDto();
			cdto.setFreeboardseq(freeboardseq);
			cdto.setCommentno(updatecommentno);
			cdto.setUserid(updateuserid);
			cdto.setCommentcontent(updatecontent);
			System.out.println("freeboardseq:" + freeboardseq);
			System.out.println("updatecommentno:" + updatecommentno);
			System.out.println("updateuserid:" + updateuserid);
			System.out.println("updatecontent:" + updatecontent);
			int res = cbiz.answerProc(cdto);
		
			PrintWriter out = response.getWriter();
			if (res > 0) {
				response.sendRedirect("free.do?command=select&freeboardseq=" + freeboardseq );
			} else {
				out.println("<script type='text/javascript'>");
				out.println("alert('댓글 수정 실패');");
				out.println("</script>");
			}

		} else if (command.equals("insertCommentAnswer")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			int parentcommentno = Integer.parseInt(request.getParameter("parentcommentNo"));
			String answeruserid = request.getParameter("answeruserid");
			String answercontent = request.getParameter("answercontent");

			CommentDto cdto = new CommentDto();
			cdto.setCommentno(parentcommentno);
			cdto.setUserid(answeruserid);
			cdto.setCommentcontent(answercontent);

			int ares = cbiz.answerProc(cdto);
			PrintWriter out = response.getWriter();
			if (ares > 0) {
				response.sendRedirect("free.do?command=select&freeboardseq=" + freeboardseq);
			} else {
				out.println("<script type='text/javascript'>");
				out.println("alert('대댓글 작성 실패');");
				out.println("</script>");
			}
		} else if (command.equals("cdelete")) {
			int commentno = Integer.parseInt(request.getParameter("commentno"));
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			int res = cbiz.delete(commentno);
			System.out.println("no : " + commentno);
			System.out.println("res : " + res);
			PrintWriter out = response.getWriter();
			if (res > 0) {
				response.sendRedirect("free.do?command=select&freeboardseq=" + freeboardseq);
			} else {
				out.println("<script type='text/javascript'>");
				out.println("alert('댓글 삭제 실패');");
				out.println("</script>");
			}
		}

	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doPost(request, response);
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}

}
