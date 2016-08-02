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
		
		$('#codeUp').click(function(){
			$('#criteria').val('head_sell_code');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('head_sell_code');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
		$('#groupUp').click(function(){
			$('#criteria').val('head_sell_group');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#groupDown').click(function(){
			$('#criteria').val('head_sell_group');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('head_sell_date');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('head_sell_date');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
	});

</script>
<h1>판매 내역</h1>
	<!-- 판매 내역 검색 -->
	<form name="sellList" id="sellList" action="/viewSellList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
	
		판매일자: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
		<br/><br/>
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="head_sell_code" <c:if test="${search.searchKey eq 'head_sell_code'}">selected="selected"</c:if>>판매코드</option>
			<option value="inte_code" <c:if test="${search.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품 통합코드</option>
			<option value="store_code" <c:if test="${search.searchKey eq 'store_code'}">selected="selected"</c:if>>가맹일련번호</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${search.searchItem}"/>
		<input type="submit" id="searchBtn" value="검색"/>
	</form>
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				판매코드
				<span id="codeUp">▲</span>
				<span id="codeDown">▼</span>
			</th>
			<th>상품메뉴 통합코드</th>
			<th>판매수량</th>
			<th>가맹일련번호</th>
			<th>판매그룹번호
				<span id="groupUp">▲</span>
				<span id="groupDown">▼</span>
			</th>
			<th>판매금액</th>
			<th>
				판매일자
				<span id="dateUp">▲</span>
				<span id="dateDown">▼</span>
			</th>
		</tr>
		
		<c:forEach var="list" items="${sellList}">
			<tr>
				<th><a href="/viewSellList?headSellCode=${list.headSellCode}">${list.headSellCode}</a></th>
				<th>${list.inteCode}</th>
				<th>${list.headSellQuantity}</th>
				<th>${list.storeCode}</th>
				<th>${list.headSellGroup}</th>
				<th><fmt:formatNumber value="${list.headSellSellingPrice}" pattern="#,###"/></th>
				<th><fmt:parseDate value="${list.headSellDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
				</th>
			</tr>
		</c:forEach>
	</table>
	<a href="/viewSellList">[전체보기]</a>
	<a href="/">[홈으로]</a>
</body>
</html>