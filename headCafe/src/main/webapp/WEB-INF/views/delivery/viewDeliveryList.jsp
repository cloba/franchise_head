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
			$('#criteria').val('delivery_code');
			$('#upDown').val('ASC');
			$('#delList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('delivery_code');
			$('#upDown').val('DESC');
			$('#delList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('delivery_date');
			$('#upDown').val('ASC');
			$('#delList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('delivery_date');
			$('#upDown').val('DESC');
			$('#delList').submit();
		});
		
		$('#returnUp').click(function(){
			$('#criteria').val('delivery_return');
			$('#upDown').val('ASC');
			$('#delList').submit();
		});
		$('#returnDown').click(function(){
			$('#criteria').val('delivery_return');
			$('#upDown').val('DESC');
			$('#delList').submit();
		});
		
		$('#changeBtn').click(function(){
			
			if(($('input[name=checked]:checkbox:checked').length <1)){
				alert('체크박스를 선택하세요');
				console.log($('input[name=checked]:checkbox:checked').length);	
			
			}else if($('#deliveryStatus option:selected').val()=='setSelect'){
				alert('옵션을 선택하세요');
				console.log($('#deliveryStatus option:selected').val());
				
			}else{
				$('#updateStatus').submit();
			}
			
			
		});
		
		
	});

</script>
<h1>배송 리스트</h1>
	<div>로그인 아이디: ${headStaffLogin.headStaffId}</div>
	<!-- 배송 검색 -->
	<form name="delList" id="delList" action="/viewDeliveryList.do" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		배송 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
		<br/><br/>
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="delivery_code" <c:if test="${search.searchKey eq 'delivery_code'}">selected="selected"</c:if>>배송코드</option>
			<option value="received_order_code" <c:if test="${search.searchKey eq 'received_order_code'}">selected="selected"</c:if>>가맹발주번호</option>
		</select>
		
		<select id="status" name="status">
			<option value="">::수령여부 검색::</option>
			<option value="N" <c:if test="${search.status eq '1'}">selected="selected"</c:if>>가맹수령전</option>
			<option value="Y" <c:if test="${search.status eq '2'}">selected="selected"</c:if>>가맹수령함</option>
		</select>
		
		<input type="text" id="searchItem" name="searchItem" value="${search.searchItem}"/>
		<input type="submit" id="searchBtn" value="검색"/>
	</form>
	
	<br>
	<a href="/viewDeliveryList.do">[배송목록 전체보기]</a>
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>선택</th>
			<th>
				배송코드
				<span id="codeUp">▲</span>
				<span id="codeDown">▼</span>
			</th>
			<th>가맹발주번호</th>
			<th>배송날짜
				<span id="dateUp">▲</span>
				<span id="dateDown">▼</span>
			</th>
			<th>가맹수령여부</th>
			<th>반송해당여부
				<span id="returnUp">▲</span>
				<span id="returnDown">▼</span>
			</th>
			<th>상태</th>
		</tr>
		<form action="/updateStatus.do" method="post" id="updateStatus">
			<c:forEach var="list" items="${deliveryList}">
				<tr>
					<th><input type="checkbox" class="checkDeleveryCode" name="checked" value="${list.deliveryCode}"/></th>
					<th><a href="/viewDeliveryDetail.do?deliveryCode=${list.deliveryCode}">${list.deliveryCode}</a></th>
					<th>${list.receivedOrderCode}</th>
					<th><fmt:parseDate value="${list.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
						<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></th>
					<th>${list.deliveryReceive}</th>
					<th>${list.deliveryReturn}</th>
					<c:if test="${list.deliveryStatus eq 1}">
						<th>배송준비중</th>
					</c:if>
					<c:if test="${list.deliveryStatus eq 2}">
						<th>배송중</th>
					</c:if>
					<c:if test="${list.deliveryStatus eq 3}">
						<th>배송완료</th>
					</c:if>
				</tr>
			</c:forEach>
			<select id="statusDelivery" name="deliveryStatus">
				<option value="setSelect">:::선택:::</option>
				<option value="2">배송중</option>
				<option value="3">가맹이 받음</option>
			</select>
			<input type="button" id="changeBtn" value="변경">
		</form>
	</table>
	<a href="/">[홈으로]</a>
</body>
</html>