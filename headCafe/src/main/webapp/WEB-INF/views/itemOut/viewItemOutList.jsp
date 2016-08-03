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
			$('#criteria').val('head_out_code');
			$('#upDown').val('ASC');
			$('#outList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('head_out_code');
			$('#upDown').val('DESC');
			$('#outList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('head_out_date');
			$('#upDown').val('ASC');
			$('#outList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('head_out_date');
			$('#upDown').val('DESC');
			$('#outList').submit();
		});
		
	});

</script>
<h1>출고 리스트</h1>
	<!-- 출고 검색 -->
	<form name="outList" id="outList" action="/viewItemOutList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		출고 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
		<br/><br/>
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="head_out_code" <c:if test="${search.searchKey eq 'head_out_code'}">selected="selected"</c:if>>본사출고코드</option>
			<option value="store_code" <c:if test="${search.searchKey eq 'store_code'}">selected="selected"</c:if>>가맹일련번호</option>
			<option value="specific_item_code" <c:if test="${search.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>상품개별코드</option>
		</select>
		
		<select id="status" name="status">
			<option value="">::배송상태 검색::</option>
			<option value="1" <c:if test="${search.status eq '1'}">selected="selected"</c:if>>가맹요청중</option>
			<option value="2" <c:if test="${search.status eq '2'}">selected="selected"</c:if>>배송준비중</option>
			<option value="3" <c:if test="${search.status eq '3'}">selected="selected"</c:if>>배송완료</option>
			<option value="4" <c:if test="${search.status eq '4'}">selected="selected"</c:if>>가맹확인완료</option>
		</select>
		
		<input type="text" id="searchItem" name="searchItem" value="${search.searchItem}"/>
		<input type="submit" id="searchBtn" value="검색"/>
	</form>
	
	<br>
	<a href="/viewItemOutList">[출고목록 전체보기]</a>
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				본사출고코드
				<span id="codeUp">▲</span>
				<span id="codeDown">▼</span>
			</th>
			<th>가맹일련번호</th>
			<th>상품개별코드</th>
			<th>출고날짜
				<span id="dateUp">▲</span>
				<span id="dateDown">▼</span>
			</th>
			<th>배송상태</th>
		</tr>
		
		<c:forEach var="outList" items="${outList}">
			<tr>
				<th><a href="/viewItemOutDetail?headOutCode=${outList.headOutCode}">${outList.headOutCode}</a></th>
				<th>${outList.storeCode}</th>
				<th>${outList.specificItemCode}</th>
				<th><fmt:parseDate value="${outList.headOutDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></th>
				<c:choose>
					<c:when test="${outList.headOutStatus eq 1}">
						<th>가맹요청</th>
					</c:when>
					<c:when test="${outList.headOutStatus eq 2}">
						<th>배송준비중</th>
					</c:when>
					<c:when test="${outList.headOutStatus eq 3}">
						<th>배송완료</th>
					</c:when>
					<c:otherwise>
						<th>가맹 수령완료</th>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<a href="/">[신규등록:미구현]</a>
	<a href="/">[홈으로]</a>
</body>
</html>