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
		
		$('#conCodeUp').click(function(){
			$('#criteria').val('contract_code');
			$('#upDown').val('ASC');
			$('#contractList').submit();
		});
		$('#conCodeDown').click(function(){
			$('#criteria').val('contract_code');
			$('#upDown').val('DESC');
			$('#contractList').submit();
		});
		
		$('#conDateUp').click(function(){
			$('#criteria').val('contract_actual_date');
			$('#upDown').val('ASC');
			$('#contractList').submit();
		});
		$('#conDateDown').click(function(){
			$('#criteria').val('contract_actual_date');
			$('#upDown').val('DESC');
			$('#contractList').submit();
		});
		
	});

</script>
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
		
		<!-- 파기여부선택 -->
		<select id="status" name="status">
			<option value="">::파기여부 검색::</option>
			<option value="Y" <c:if test="${search.status eq 'Y'}">selected="selected"</c:if>>파기된 계약</option>
			<option value="N" <c:if test="${search.status eq 'N'}">selected="selected"</c:if>>유효한 계약</option>
		</select>
		
		<input type="text" id="searchItem" name="searchItem" value="${conSearch.searchItem}"/>
		<button>검색</button>
	</form>
	
	<br>
	<a href="/viewContractList">[계약 리스트 전체보기]</a>

	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				계약코드
				<span id="conCodeUp">▲</span>
				<span id="conCodeDown">▼</span>
			</th>
			<th>가맹일련번호</th>
			<th>계약날짜
				<span id="conDateUp">▲</span>
				<span id="conDateDown">▼</span>
			</th>
			<th>점주이름</th>
			<th>파기여부</th>
		</tr>
		
		<c:forEach var="contractList" items="${contractList}">
			<tr>
				<th><a href="/viewContractDetail?contractCode=${contractList.contractCode }">${contractList.contractCode }</a></th>
				<th>${contractList.subCode }</th>
				<th><fmt:parseDate value="${contractList.contractActualDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
				</th>
				<th>${contractList.contractorName }</th>
				<th>${contractList.contractExpire }</th>
			</tr>
		</c:forEach>
	</table>
	<a href="/viewContractList">[전체리스트]</a>
	<a href="/">[홈으로]</a>
</body>
</html>