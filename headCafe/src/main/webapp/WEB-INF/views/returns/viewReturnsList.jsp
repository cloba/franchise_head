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
	$('#returnsCodeUp').click(function(){
		$('#criteria').attr('value','returns_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#returnsCodeDown').click(function(){
		$('#criteria').attr('value','returns_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#ordersCodeUp').click(function(){
		$('#criteria').attr('value','orders_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#ordersCodeDown').click(function(){
		$('#criteria').attr('value','orders_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#specificItemCodeUp').click(function(){
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#specificItemCodeDown').click(function(){
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#returnPriceUp').click(function(){
		$('#criteria').attr('value','return_price');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#returnPriceDown').click(function(){
		$('#criteria').attr('value','return_price');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#returnReDeliveryUp').click(function(){
		$('#criteria').attr('value','return_re_delivery');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#returnReDeliveryDown').click(function(){
		$('#criteria').attr('value','return_re_delivery');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
});	
	
</script>
<body>
<h1>전 가맹 로얄티  리스트</h1>

<form id="royaltyForm" action="/viewReturnsList" >
	<div> 	
		<!-- 검색조건 보내는 곳 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<input type="text" value="${search.searchKey}"><br/><br/>
		
		
		
		<!-- 검색 조건 선택  -->
		<select name="searchKey">    
			<option value="">선택</option>   
			<option value="returns_code" <c:if test="${'returns_code' eq search.searchKey }">selected="selected"</c:if>>로열티지불 코드</option>
			<option value="orders_code"<c:if test="${'orders_code' eq search.searchKey }">selected="selected"</c:if>>계약코드</option>
			<option value="specific_item_code" <c:if test="${'specific_item_code' eq search.searchKey }">selected="selected"</c:if>>해당 월</option>
			<option value="return_price" <c:if test="${'return_price' eq search.searchKey }">selected="selected"</c:if>>해당 월</option>
			<option value="return_re_delivery" <c:if test="${'return_re_delivery' eq search.searchKey }">selected="selected"</c:if>>해당 월</option>
		</select>
		
		<!-- 검색어랑 검색버튼 -->
		<input type="text" name="searchItem" value="${search.searchItem}">
		<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
	</div>
</form>

	<!-- 로얄티 상단 메뉴 -->
	<div>  
		<label>반품 코드
			<span id="returnsCodeUp">▲</span>
			<span id="returnsCodeDown">▼/</span></label>
		<label>가맹발주 번호
			<span id="ordersCodeUp">▲</span>
			<span id="ordersCodeDown">▼/</span></label>			
		<label>개별상품코드/
			<span id="specificItemCodeUp">▲</span>
			<span id="specificItemCodeDown">▼</span></label>
		<label>반품사유
			<span id="returnReasonUp"></span>
			<span id="returnReasonDown">/</span></label>
		<label>반품가격/
			<span id="returnPriceUp">▲</span>
			<span id="returnPriceDown">▼</span></label>	
	    <!-- <label>가맹보고날짜/
			<span id="royaltyPaidUp"></span>
			<span id="royaltyPaidDown"></span></label> 	 -->
		<!-- <label>본사확인날짜/
			<span id="subPracticalSellPriceMonthUp"></span>
			<span id="subPracticalSellPriceMonthDown"></span></label>	 -->	
		<!-- <label>확인한 직원 아이디/
			<span id="subSellProfitMonthUp"></span>
			<span id="subSellProfitMonthDown"></span></label>	 --> 
		<label>재배송 요청 여부/
			<span id="returnReDeliveryUp">▲</span>
			<span id="returnReDeliveryDown">▼</span></label>	
<!-- 		<label>반품 취소 여부/
			<span id="royaltyPayActualDateUp"></span>
			<span id="royaltyPayActualDateDown"></span></label> -->	
	</div>

	
		<!-- 로얄티 실제 보여주는 정보 -->
		<c:forEach var="Returns" items="${returnsList}">
			<div>
				<label>																   ${Returns.returnsCode}        </label>
		   		<label><a href="/viewReturnsDetail?returnsCode=${Returns.returnsCode}">${Returns.ordersCode}   </a>  </label> 
				<label>														     	   ${Returns.specificItemCode}   </label>
		 	    <label><a href="/viewReturnsDetail?returnsCode=${Returns.returnsCode}">${Returns.returnReason} </a>  </label>
				<%-- <label>																         
					<c:if test="${Returns.returnPrice eq 0}">			    		교환 요청	              </c:if>		    	
					<c:if test="${Returns.returnPrice ne 0}">			           ${Returns.returnPrice} </c:if></label>	 --%>    	
		    	<label>												                   ${Returns.returnPrice}원        </label> 
				<label>
					<c:if test="${Returns.returnReDelivery eq 'N'}">			    환불 요청			          </c:if>
					<c:if test="${Returns.returnReDelivery ne 'Y'}">              재배송 요청                                    </c:if></label>
			</div>
		</c:forEach>


</body>
</html>