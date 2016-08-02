<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<h1>계정과목 리스트</h1>
	<!-- 계정과목 검색 -->
	<form name="subjectList" id="subjectList" action="/viewSubjectList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
	
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="subject_code" <c:if test="${subjectSearch.searchKey eq 'subject_code'}">selected="selected"</c:if>>계정과목코드</option>
			<option value="subject_name" <c:if test="${subjectSearch.searchKey eq 'subject_name'}">selected="selected"</c:if>>계정과목명</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${subjectSearch.searchItem}"/>
		<button>검색</button>
	</form>

	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				계정과목코드
				<!-- <span id="nameUp">▲</span>
				<span id="nameDown">▼</span> -->
			</th>
			<th>계정과목명</th>
			<th>상세</th>
		</tr>
		
		<c:forEach var="subjectList" items="${subjectList}">
			<tr>
				<th>${subjectList.subjectCode }</th>
				<th>${subjectList.subjectName }</th>
				<th>${subjectList.subjectContent }</th>
			</tr>
		</c:forEach>
	</table>
<a href="/viewSubjectList">전체리스트보기</a>
<a href="/">홈으로</a>
</body>
</html>