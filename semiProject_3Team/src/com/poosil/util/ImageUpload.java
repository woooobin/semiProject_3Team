package com.poosil.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/imageUpload.do")
public class ImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageUpload() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		// 게시글 원글 등록 처리용 컨트롤러
		
		request.setCharacterEncoding("utf-8");
		// 업로드할 파일의 용량 제한 : 10Mbyte로 제한한다면

		int maxSize = 1024 * 1024 * 10;

		RequestDispatcher view = null;

		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println(root);
		// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리

		String savePath = root + "image";

		// web/board_upload 로 지정함
		// request 를 MultipartRequest 객체로 변환함

		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
//		String originFileName = mrequest.getFilesystemName("upfile");
		
		Enumeration files = mrequest.getFileNames();
		
		String str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장
		String originFileName = mrequest.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		
		System.out.println(originFileName);


		JsonObject result = new JsonObject();
		result.addProperty("url", originFileName);

		response.getWriter().append(result + "");
		response.setContentType("text/html; charset=utf-8");

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		// TODO Auto-generated method stub

		doGet(request, response);

	}

}
