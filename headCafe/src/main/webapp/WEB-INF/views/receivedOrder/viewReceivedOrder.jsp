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
		
		$('#nameUp').click(function(){
			$('#criteria').val('received_order_sub_code');
			$('#upDown').val('ASC');
			$('#searchForm').submit();
		});
		$('#nameDown').click(function(){
			$('#criteria').val('received_order_sub_code');
			$('#upDown').val('DESC');
			$('#searchForm').submit();
		});
		
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
<h1>받은 주문 리스트</h1>
	<!--  검색 -->
	<form name="searchForm" id="searchForm" action="/viewReceivedOrder.do" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
		<input type="hidden" name="status" value="${search.status}"/>
		
		<c:if test="${search.status ne 'N'}">
			확인 날짜: 
			<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
			<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
			<br/><br/>
		</c:if>
		
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="received_order_code" <c:if test="${search.searchKey eq 'received_order_code'}">selected="selected"</c:if>>받은주문 코드</option>
			<option value="received_order_sub_code" <c:if test="${search.searchKey eq 'received_order_sub_code'}">selected="selected"</c:if>>가맹코드</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${search.searchItem}"/>
		<input type="submit" id="searchBtn" value="검색"/>
	</form>
	
	<br>
	<!-- 적용상태에 따른 a태그 분리 -->
		<c:if test="${search.status == 'N'}"> 
			<a href="/viewReceivedOrder?status=Y">[확인된 주문만 보기]</a>
			<a href="/viewReceivedOrder">[전체주문 보기]</a>
		</c:if>
		<c:if test="${search.status == 'Y'}"> 
			<a href="/viewReceivedOrder?status=N">[확인안된 주문만 보기]</a>
			<a href="/viewReceivedOrder">[전체주문 보기]</a>
		</c:if>
		<c:if test="${search.status == '' or search.status == null}">
			<a href="/viewReceivedOrder?status=Y">[확인된 주문만 보기]</a> 
			<a href="/viewReceivedOrder?status=N">[확인안된 주문만 보기]</a>
		</c:if>	
	
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>일련코드</th>
			<th>상품통합코드</th>
			<th>가맹코드
				<span id="nameUp">▲</span>
				<span id="nameDown">▼</span>
			</th>
			<th>주문수량</th>
			<th>주문그룹</th>
			<th>금액</th>
			<c:if test="${search.status ne 'N'}">
				<th>본사확인여부</th>
				<th>확인날짜</th>
				<th>확인한 직원 아이디</th>
			</c:if>
			<th>확인</th>
		</tr>
		
		<c:forEach var="list" items="${list}">
			<tr>
				<th>${list.code}</th>
				<th>${list.item}</th>
				<th>${list.subCode}</th>
				<th>${list.quantity}</th>
				<th>${list.group}</th>
				<th>${list.amount}</th>
				<c:if test="${search.status ne 'N'}">
					<th>${list.check}</th>
					<th>${list.date}</th>
					<th>${list.staff}</th>
				</c:if>
				<c:if test="${list.check eq 'N'}">
					<th><a href="/confirmOrder?receivedOrderCode=${list.code}">확인</a></th>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<a href="/">[홈으로]</a>
</body>
</html>