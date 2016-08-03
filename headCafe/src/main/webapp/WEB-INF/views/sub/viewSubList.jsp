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
<script>

	$(document).ready(function(){
		
		$('#subCodeUp').click(function(){
			$('#criteria').val('sub_code');
			$('#upDown').val('ASC');
			$('#subList').submit();
		});
		$('#subCodeDown').click(function(){
			$('#criteria').val('sub_code');
			$('#upDown').val('DESC');
			$('#subList').submit();
		});
		
		$('#regitDateUp').click(function(){
			$('#criteria').val('sub_regit_date');
			$('#upDown').val('ASC');
			$('#subList').submit();
		});
		$('#regitDateDown').click(function(){
			$('#criteria').val('sub_regit_date');
			$('#upDown').val('DESC');
			$('#subList').submit();
		});
		
	});

</script>
<h1>가맹 리스트</h1>
	<!-- 상품 검색 -->
	<form name="subList" id="subList" action="/viewSubList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
	
		등록 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${subSearch.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${subSearch.regitDateEnd}"/> 
		<br/><br/>
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="sub_code" <c:if test="${subSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹대표코드</option>
			<option value="sub_name" <c:if test="${subSearch.searchKey eq 'sub_name'}">selected="selected"</c:if>>가맹점명</option>
			<option value="sub_parcle_addr" <c:if test="${subSearch.searchKey eq 'sub_parcle_addr'}">selected="selected"</c:if>>지번주소</option>
			<option value="sub_road_addr" <c:if test="${subSearch.searchKey eq 'sub_road_addr'}">selected="selected"</c:if>>도로명주소</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${subSearch.searchItem}"/>
		<button>검색</button>
	</form>

	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				가맹대표코드
				<span id="subCodeUp">▲</span>
				<span id="subCodeDown">▼</span>
			</th>
			<th>등록직원</th>
			<th>등록날짜
				<span id="regitDateUp">▲</span>
				<span id="regitDateDown">▼</span>
			</th>
			<th>가맹점명</th>
			<th>주소</th>
		</tr>
		
		<c:forEach var="subList" items="${subList}">
			<tr>
				<th>${subList.subCode }</th>
				<th>${subList.headStaffId }</th>
				<th><fmt:parseDate value="${subList.subRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
				</th>
				<th>${subList.subName }</th>
				<th>${subList.subRoadAddr }</th>
			
			</tr>
		</c:forEach>
	</table>
	<a href="/">[홈으로]</a>
</body>
</html>