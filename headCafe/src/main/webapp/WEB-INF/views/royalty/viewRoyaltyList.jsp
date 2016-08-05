<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script>
	
$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	$('#royaltyCodeUp').click(function(){
		console.log('>로열티지불 코드 내림차순 정렬');
		$('#criteria').attr('value','royalty_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#royaltyCodeDown').click(function(){
		console.log('>로열티지불 코드 오름차순 정렬');
		$('#criteria').attr('value','royalty_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#contractCodeUp').click(function(){
		console.log('계약코드 내림차순 정렬');
		$('#criteria').attr('value','contract_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#contractCodeDown').click(function(){
		console.log('계약코드 오름차순 정렬');
		$('#criteria').attr('value','contract_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#royaltyMonthUp').click(function(){
		console.log('해당 월 내림차순 정렬');
		$('#criteria').attr('value','royalty_month');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#royaltyMonthDown').click(function(){
		console.log('해당 월 오름차순 정렬');
		$('#criteria').attr('value','royalty_month');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#subNameUp').click(function(){
		console.log('점포명 내림차순 정렬');
		$('#criteria').attr('value','sub_name');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#subNameDown').click(function(){
		console.log('점포명 오름차순 정렬');
		$('#criteria').attr('value','sub_name');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
});	
	
</script>
<body>
<h1>전 가맹 로얄티  리스트</h1>

<form id="royaltyForm" action="/viewRoyaltyList" >
	<div> 	
		<!-- 검색조건 보내는 곳 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<input type="text" value="${search.searchKey}"><br/><br/>
		
		
		
		<!-- 검색 조건 선택  -->
		<select name="searchKey">    
			<option value="">선택</option>   
			<option value="royalty_code" <c:if test="${'royalty_code' eq search.searchKey }">selected="selected"</c:if>>로열티지불 코드</option>
			<option value="contract_code"<c:if test="${'contract_code' eq search.searchKey }">selected="selected"</c:if>>계약코드</option>
			<option value="royalty_month" <c:if test="${'royalty_month' eq search.searchKey }">selected="selected"</c:if>>해당 월</option>
		</select>
		
		<!-- 검색어랑 검색버튼 -->
		<input type="text" name="searchItem" value="${search.searchItem}">
		<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
	</div>



</form>
	<div>  
		<label>로열티지불 코드
			<span id="royaltyCodeUp">▲</span>
			<span id="royaltyCodeDown">▼</span></label>
		<label>계약코드
			<span id="contractCodeUp">▲</span>
			<span id="contractCodeDown">▼</span></label>
		<label>해당 월
			<span id="royaltyMonthUp">▲</span>
			<span id="royaltyMonthDown">▼</span></label>
		<label>로열티 지급 기일
			<span id="royaltyDealineUp"></span>
			<span id="royaltyDealineDown"></span></label>	
		<label>로열티 지급 여부
			<span id="royaltyPaidUp"></span>
			<span id="royaltyPaidDown"></span></label>		
		<label>해당 월 실제 판매 금액
			<span id="subPracticalSellPriceMonthUp"></span>
			<span id="subPracticalSellPriceMonthDown"></span></label>		
		<label>해당 월 가맹의 이익 금액
			<span id="subSellProfitMonthUp"></span>
			<span id="subSellProfitMonthDown"></span></label>	
		<label>해당 월 이 가맹에 대한본사 로얄티
			<span id="headSellProfitBySubMonthUp"></span>
			<span id="headSellProfitBySubMonthDown"></span></label>	
		<label>실제 지급 날짜
			<span id="royaltyPayActualDateUp"></span>
			<span id="royaltyPayActualDateDown"></span></label>	
		<label>해당월에 실제 지급한 금액
			<span id="royaltyActualAmountUp"></span>
			<span id="royaltyActualAmountDown"></span></label>	
		<label>가맹 점포 명
			<span id="subNameUp">▲</span>
			<span id="subNameDown">▼</span></label>			
	</div>

	
	
		<c:forEach var="Royalty" items="${list }">
			<div>
				<label>${Royalty.royaltyCode}</label>
				<label>${Royalty.contractCode }</label>
				<label>${Royalty.royaltyMonth}</label>
				<label>${Royalty.royaltyDealine}</label>
				<label>${Royalty.subPracticalSellPriceMonth}</label>
				<label>${Royalty.subSellProfitMonth}</label>
				<label>${Royalty.headSellProfitBySubMonth}</label>
				<label>${Royalty.royaltyPayActualDate}</label>
				<label>${Royalty.royaltyActualAmount}</label>
				<label>${Royalty.subName}</label>
			</div>
		</c:forEach>


</body>
</html>