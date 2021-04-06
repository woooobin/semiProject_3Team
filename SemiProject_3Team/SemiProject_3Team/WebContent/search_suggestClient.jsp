<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
	// 데이터베이스에 등록된 인기 연관 검색어라는 가정 (실제로 쓸 땐 DB 연동해서 사용)
	String[] keywords = {"강아지", "고양이", "강아지고양이", "고양이강아지", "고구마", "고구마특산품",
						"고구마감자", "대진", "대진이네", "바나나특산픔", "바나나", "특산품", "고향", "펀딩", "우리",
						"지역", "후원", "감자", "딸기" };

	//사용자가 입력한 단어의 연관 제시어 검색하여 리스트 반환
	public List<String> search(String keyword){
		if(keyword == null || keyword.equals("")){
			return null;
			// return Collection.EMPTY_LIST; 내장변수
		}
		// keyword = keyword.toUpperCase(); // 대문자 검사
		List<String> lists = new ArrayList<String>();
		for(int i = 0; i < keywords.length; i++){
			if(keywords[i].startsWith(keyword)){
				lists.add(keywords[i]);
			}
		}
		return lists;
	}
%>
<%
	// 파라미터를 읽어온 뒤 연관제시어 찾기
	String keyword = request.getParameter("keyword");
	List<String> keywordList = search(keyword);
	
	// 키워드 갯수와 키워드 단어들을 | 로 구분
	out.print(keywordList.size());
	out.print("|");
	
	// 출력 형식 5|abc,ajax,adf
	Iterator<String> it = keywordList.iterator();
	while(it.hasNext()){
		String value = (String)it.next();
		out.print(value);
		if(keywordList.size() - 1 > 0){
			out.print(",");	// 마지막 단어에는 쉼표가 찍히지 않도록 'size()-1'번 반복
		}
	}
%>

</body>
</html>