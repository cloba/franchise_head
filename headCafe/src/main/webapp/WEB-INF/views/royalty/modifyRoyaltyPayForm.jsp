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
	$('#modifyRoyaltyPayBtn').click(function(){
		if ($('#royaltyActualAmount').val() == ""){
			alert("실제 지급한 금액을 입력해주세요.");
		}else {
			$('#modifyRoyaltyPayForm').submit();
		}
	});
});		
</script>
</head>
<body>
	<form id="modifyRoyaltyPayForm" action="modifyRoyaltyPay.do" method="POST">
	
		<div>
			<label>로열티지불 코드 : </label>
			<input type="text" name="royaltyCode" value="${royalty.royaltyCode}" readonly="readonly">
		</div><br/>	
		
		<div>
			<label>가맹 점 포명</label>
			<input type="text" name="subName" value="${royalty.subName}" readonly="readonly">
		</div>
	
		<div>
			<label>계약코드</label>
			<input type="text" name="contractCode" value="${royalty.contractCode}" readonly="readonly">
		</div>
	
		<div>
			<label>해당월</label>
			<input type="text" name="royaltyMonth" value="${royalty.royaltyMonth}" readonly="readonly">
		</div>
			
		<div>
			<label>가맹대표코드</label>
			<input type="text" name="subCode" value="${royalty.subCode}" readonly="readonly">	
		</div>
			
		<div>
			<label>로열티 지급 기일</label>
			<input type="text" name="royaltyDeadline" value="${royalty.royaltyDeadline}" readonly="readonly">	
		</div>
		
		<div>
			<label>로열티 지급 여부</label>
			<input type="text" name="royaltyPaid" value="${royalty.royaltyPaid}" readonly="readonly">
		</div>
		
		<div>
			<label>해당 월 실제 판매 금액</label>
			<input type="text" name="subPracticalSellPriceMonth" value="${royalty.subPracticalSellPriceMonth}" readonly="readonly">
			
		</div>
		<div>
			<label>해당 월 가맹 이익 금액</label>
			<input type="text" name="subSellProfitMonth" value="${royalty.subSellProfitMonth}" readonly="readonly">
			
		</div>
		<div>
			<label>해당 월 이 가맹에 대한본사 로얄티</label>
			<input type="text" name="headSellProfitBySubMonth" value="${royalty.headSellProfitBySubMonth}" readonly="readonly">
		</div>
		
		
		<div>
			<label>해당월에 실제 지급한 금액 : </label>
			<input type="text" name="royaltyActualAmount" value="${royalty.royaltyActualAmount}" id="royaltyActualAmount" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'>
		</div>
	
		<div>
			<label>실제 지급 날짜 : </label>
			<c:if test="${Royalty.royaltyPayActualDate eq null}">	미지급			</c:if>
			<c:if test="${royalty.royaltyPayActualDate ne null}">						
				<input type="text" name="royaltyPayActualDate" value="${royalty.royaltyPayActualDate}" readonly="readonly">	
			</c:if>
		</div><br>
		
		<div>
			<input type="button" id="modifyRoyaltyPayBtn" value="로얄티 지불 기입" >
		</div>
	</form>
</body>
</html>