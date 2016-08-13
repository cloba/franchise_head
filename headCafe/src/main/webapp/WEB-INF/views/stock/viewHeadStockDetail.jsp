<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>본사직원 디테일</h1>
<div>
	<div>
		<label>개별상품코드</label>
		<label>상품코드</label>
		<label>본사매입기록</label>
		<label>유통기한</label>		
		<label>입고날짜(권한)</label>
		<label>출고여부</label>
		<label>반품상품 해당여부</label>
		<label>등록일자</label>
		<label>등록한 본사직원 아이디</label>	
	</div>
	
	<div>
		<label>${stock.specificItemCode }</label>
		<label>${stock.hItemCode }</label>
		<label>${stock.headBuyDate }</label>
		<c:if test="${stock.headStockInExpiryDate != null}">
			<label>${stock.headStockInExpiryDate }</label>
		</c:if>
		<c:if test="${stock.headStockInExpiryDate == null}">
			유통기한 없음
		</c:if>
		<label>${stock.headStockInDate }</label>
		<label>${stock.headStockItemOut }</label>
		<label>${stock.headStockReturn }</label>
		<label>${stock.headStockRegitDate }</label>
		<label>${stock.headStaffId }</label>

	</div>
	
	<div>
		<a href= "/viweHeadStockList.do"									>[ 재고 리스트 페이지로  ]</a>
		<a href= "/"													>[ 재고 수정 ]</a>
		<a href= "/"													>[ 되돌아가기]</a>
	</div>	
</div>



</body>
</html>