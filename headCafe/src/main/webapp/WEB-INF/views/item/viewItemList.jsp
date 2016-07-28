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
<!-- 상품 더블 클릭시 수정 페이지가 open 되는 함수가 있는 js파일 -->
<script type="text/javascript" src="resources/js/itemListPop.js"></script>
<!-- 검색과 정렬 유효성 검사하는 함수가 있는 js파일 -->
<script type="text/javascript" src="resources/js/validation.js"></script>
<script>
	
	$(document).ready(function(){
		
		/* 검색 버튼 눌렀을 때 유효성 검사 */
		$('#searchBtn').click(function(){
			console.log('버튼클릭');
			searchValid($('#itemList'));
		});
		
		$('#nameUp').click(function(){
			upDown('nameUp',$('#itemList'));
		});
		
		$('#nameDown').click(function(){
			upDown('nameDown',$('#itemList'));
		});
		
		$('#dateUp').click(function(){
			upDown('dateUp',$('#itemList'));
		});
		
		$('#dateDown').click(function(){
			upDown('dateDown',$('#itemList'));
		});
		
		$('#clientUp').click(function(){
			upDown('clientUp',$('#itemList'));
		});
		
		$('#clientDown').click(function(){
			upDown('clientDown',$('#itemList'));
		});
		
	});

</script>
<h1>상품 리스트</h1>
	<!-- 상품 검색 -->
	<form name="itemList" id="itemList" action="/viewItemList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
	
		등록 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${itemSearch.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${itemSearch.regitDateEnd}"/> 
		<br/><br/>
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="h_item_code" <c:if test="${itemSearch.searchKey eq 'h_item_code'}">selected="selected"</c:if>>상품코드</option>
			<option value="inte_code" <c:if test="${itemSearch.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품 통합코드</option>
			<option value="h_item_name" <c:if test="${itemSearch.searchKey eq 'h_item_name'}">selected="selected"</c:if>>상품명</option>
			<option value="head_client_code" <c:if test="${itemSearch.searchKey eq 'head_client_code'}">selected="selected"</c:if>>거래처 코드</option>
			<option value="head_staff_id" <c:if test="${itemSearch.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>등록직원 아이디</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${itemSearch.searchItem}"/>
		<input type="button" id="searchBtn" value="검색"/>
	</form>
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				상품명
				<span id="nameUp">▲</span>
				<span id="nameDown">▼</span>
			</th>
			<th>상품코드</th>
			<th>상품메뉴 통합코드</th>
			<th>상품 갯수</th>
			<th>박스/개별 여부</th>
			<th>매입가</th>
			<th>마진율</th>
			<th>본사 이익 금액</th>
			<th>가맹에 판매하는 가격</th>
			<th>소비자 가격</th>
			<th>
				등록날짜
				<span id="dateUp">▲</span>
				<span id="dateDown">▼</span>
			</th>
			<th>등록직원 아이디</th>
			<th>
				거래처 코드
				<span id="clientUp">▲</span>
				<span id="clientDown">▼</span>
			</th>
		</tr>
		
		<c:forEach var="itemList" items="${itemList}">
			<tr ondblclick="modifyPop('${itemList.hItemCode}')">
				<th>${itemList.hItemName}</th>
				<th>${itemList.hItemCode}</th>
				<th>${itemList.inteCode}</th>
				<th>${itemList.hItemQuantity}</th>
				<th>${itemList.hItemUnit}</th>
				<th><fmt:formatNumber value="${itemList.hItemPurchasePrice}" pattern="#,###"/></th>
				<th><fmt:formatNumber value="${itemList.hItemMarginPercent}" type="percent"/></th>
				<th><fmt:formatNumber value="${itemList.hItemHeadProfit}" pattern="#,###"/></th>
				<th><fmt:formatNumber value="${itemList.hItemSellingPrice}" pattern="#,###"/></th>
				<th><fmt:formatNumber value="${itemList.hItemRetailPrice}" pattern="#,###"/></th>
				<th><fmt:parseDate value="${itemList.hItemRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
				</th>
				<th>${itemList.headStaffId}</th>
				<th>${itemList.headClientCode}</th>
			</tr>
		</c:forEach>
	</table>
	<form name="addItemLink">
		<span onclick="addPop()">[신규등록]</span>
		<br>
		전달받은 값: <input type="text" id="addedItemName"/>
	</form>
	<a href="/">홈으로</a>
</body>
</html>