<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- 검색과 정렬 유효성 검사하는 함수가 있는 js파일 -->
<script type="text/javascript" src="resources/js/validation.js"></script>
<script>

	$(document).ready(function(){
		
		/* 검색 버튼 눌렀을 때 유효성 검사 */
		$('#searchBtn').click(function(){
			console.log('버튼클릭');
			searchValid($('#menuList'));
		});
		
		$('#nameUp').click(function(){
			upDown('nameUp',$('#menuList'));
		});
		
		$('#nameDown').click(function(){
			upDown('nameDown',$('#menuList'));
		});
	});

</script>
<h1>메뉴 리스트</h1>
	<!-- 메뉴 검색 -->
	<form name="menuList" id="menuList" action="/viewMenuList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
	
		등록 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${Search.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${Search.regitDateEnd}"/> 
		<br/><br/>
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="menu_code" <c:if test="${Search.searchKey eq 'menu_code'}">selected="selected"</c:if>>메뉴코드</option>
			<option value="inte_code" <c:if test="${Search.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품메뉴 통합코드</option>
			<option value="menu_name" <c:if test="${Search.searchKey eq 'menu_name'}">selected="selected"</c:if>>메뉴이름</option>
			<option value="menu_status" <c:if test="${Search.searchKey eq 'menu_status'}">selected="selected"</c:if>>적용상태</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${Search.searchItem}"/>
		<input type="button" id="searchBtn" value="검색"/>
	</form>
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				메뉴명
				<span id="nameUp">▲</span>
				<span id="nameDown">▼</span>
			</th>
			<th>메뉴코드</th>
			<th>상품메뉴 통합코드</th>
			<th>적용상태</th>
		</tr>
		
		<c:forEach var="menuList" items="${menuList}">
			<tr ondblclick="modifyPop('${menuList.menuCode}')">
				<th><a href="/viewItemDetail?menuCode=${menuList.menuCode}">${menuList.menuName}</a></th>
				<th>${menuList.menuCode}</th>
				<th>${menuList.inteCode}</th>
				<th>${menuList.menuStatus}</th>
			</tr>
		</c:forEach>
	</table>
	<a href="/">[신규등록]</a>
	<a href="/">[홈으로]</a>
</body>
</html>