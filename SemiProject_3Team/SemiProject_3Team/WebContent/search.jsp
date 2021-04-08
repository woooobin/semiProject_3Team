<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Search Main</title>
    <script>
</script>
  </head>
  <body>
  <a href="./hashtag_search.jsp" ><h2>해시태그로 검색하기</h2></a>
    <div class="s013">
      <form action="projectsearch.do" method="get">
      <input type="hidden" name="command" value="list">
        <fieldset>
          <legend>QUICK FIND YOUR PROJECT</legend>
        </fieldset>
        <div class="inner-form">
          <div class="left">
            <div class="input-wrap first">
              <div class="input-field first">
                <label>WHAT</label>
                <input type="text" name="keyword" value="${map.keyword}" placeholder="ex: food, service " />
              </div>
            </div>
            <div class="input-wrap second">
              <div class="input-field second">
                <label>SEARCH OPTION</label>
                <div class="input-select">
                 <select data-trigger="" name="searchOption">
                    <option value="all" <c:out value="${map.searchOption == 'all' ? 'selectd':'' }"/>>전체</option>
                    <option value="projectMainTitle" <c:out value="${map.searchOption =='projectMainTitle'?'selectd': ''}"/>>제목</option>
                    <option value="projectSubTitle" <c:out value="${map.searchOption == 'projectSubTitle'?'selectd':'' }"/>>부제목</option>
                    <option value="detailDesc" <c:out value="${map.searchOption == 'detailDesc'?'selectd':'' }"/>>내용</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <button class="btn-search" type="submit">SEARCH</button>
        </div>
      </form>
    </div>
  </body>
</html>
