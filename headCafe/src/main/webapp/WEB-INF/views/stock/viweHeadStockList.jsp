<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>

$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	$('#specificItemUp').click(function(){
		console.log('개별상품코드 내림차순 정렬');
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','DESC');
		$('#HeadStaffStockForm').submit();
	});
	$('#specificItemDown').click(function(){
		console.log('개별상품코드 오름차순 정렬');
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','ASC');
		$('#HeadStaffStockForm').submit();
	});
	$('#itemUp').click(function(){
		console.log('이름 내림차순 정렬');
		$('#criteria').attr('value','h_item_code');
		$('#upDown').attr('value','DESC');
		$('#HeadStaffStockForm').submit();
	});
	$('#itemDown').click(function(){
		console.log('이름 오름차순 정렬');
		$('#criteria').attr('value','h_item_code');
		$('#upDown').attr('value','ASC');
		$('#HeadStaffStockForm').submit();
	});
	$('#inDateUp').click(function(){
		console.log('거래처로 내림차순 정렬');
		$('#criteria').attr('value','head_stock_in_date');
		$('#upDown').attr('value','DESC');
		$('#HeadStaffStockForm').submit();
	});
	$('#inDateDown').click(function(){
		console.log('거래처로 오름차순 정렬');
		$('#criteria').attr('value','head_stock_in_date');
		$('#upDown').attr('value','ASC');
		$('#HeadStaffStockForm').submit();
	});
	$('#itemOutUp').click(function(){
		console.log('거래처로 내림차순 정렬');
		$('#criteria').attr('value','head_stock_item_out');
		$('#upDown').attr('value','DESC');
		$('#HeadStaffStockForm').submit();
	});
	$('#itemOutDown').click(function(){
		console.log('거래처로 오름차순 정렬');
		$('#criteria').attr('value','head_stock_item_out');
		$('#upDown').attr('value','ASC');
		$('#HeadStaffStockForm').submit();
	});
	
});	
	
</script>
</head>
<body>
private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchItem;
	private String criteria;
	private String upDown;
	
	
	<form action="viweHeadStockList" id="HeadStaffStockForm">
		<div> 	
			<!-- 검색조건 보내는 곳 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
			<input type="text" value="${ Search.searchKey}"><br/><br/>
			
			<!-- 검색 조건 선택  -->
			<select name="searchKey">    
				<option value="">선택</option>   
				<option value="specific_item_code" <c:if test="${'specific_item_code' eq Search.searchKey }">selected="selected"</c:if>>개별상품코드</option>
				<option value="h_item_code"<c:if test="${'h_item_code' eq Search.searchKey }">selected="selected"</c:if>>상품코드</option>
				<option value="head_stock_in_date" <c:if test="${'head_stock_in_date' eq Search.searchKey }">selected="selected"</c:if>>입고일자</option>
				<option value="head_stock_item_out" <c:if test="${'head_stock_item_out' eq Search.searchKey }">selected="selected"</c:if>>출고일자</option>
			
				
			</select>
			
			<!-- 검색어랑 검색버튼 -->
			<input type="text" name="searchItem" value="${Search.searchItem}">
			<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
		</div>
	</form>


	<h1>재고 리스트</h1>
	
	<div>
		<label>개별상품코드
			<span id="specificItemUp">▲</span>
			<span id="specificItemDown">▼</span></label>
		<label>상품코드
			<span id="itemUp">▲</span>
			<span id="itemDown">▼</span></label>
		<label>입고날짜
			<span id="inDateUp">▲</span>
			<span id="inDateDown">▼</span></label>
		<label>출고여부
			<span id="itemOutUp">▲</span>
			<span id="itemOutDown">▼</span></label>
	</div>
	


 	<c:forEach var="Stock" items="${list}">
	 	<div>
		 	<label>${Stock.specificItemCode }</label>
		 	<label><a href="viewHeadStrockDetail?specificItemCode=${ Stock.specificItemCode}">${Stock.hItemCode }</a></label>
		 	<label>${Stock.headStockInDate }</label>
		 	<label>${Stock.headStockItemOut }</label>
	 	</div>
	 </c:forEach>



</body>
</html>