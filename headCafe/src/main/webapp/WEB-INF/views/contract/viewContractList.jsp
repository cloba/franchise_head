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
<h1>계약 리스트</h1>
	<!-- 계약 검색 -->
	<form name="contractList" id="contractList" action="/viewContractList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
	
		계약 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${conSearch.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${conSearch.regitDateEnd}"/> 
		<br/><br/>
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="contract_code" <c:if test="${conSearch.searchKey eq 'contract_code'}">selected="selected"</c:if>>계약코드</option>
			<option value="store_code" <c:if test="${conSearch.searchKey eq 'store_code'}">selected="selected"</c:if>>가맹대표코드</option>
			<option value="contractor_name" <c:if test="${conSearch.searchKey eq 'contractor_name'}">selected="selected"</c:if>>가맹점주 이름</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${conSearch.searchItem}"/>
		<button>검색</button>
	</form>

	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				계약코드
				<!-- <span id="nameUp">▲</span>
				<span id="nameDown">▼</span> -->
			</th>
			<th>가맹일련번호</th>
			<th>계약날짜</th>
			<th>점주이름</th>
		</tr>
		
		<c:forEach var="contractList" items="${contractList}">
			<tr>
				<th><a href="/viewContractDetail">${contractList.contractCode }</th>
				<th>${contractList.storeCode }</th>
				<th><fmt:parseDate value="${contractList.contractActualDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
				</th>
				<th>${contractList.contractorName }</th>
			</tr>
		</c:forEach>
	</table>
	<a href="/viewContractList">[전체리스트]</a>
	<a href="/">[홈으로]</a>
</body>
</html>