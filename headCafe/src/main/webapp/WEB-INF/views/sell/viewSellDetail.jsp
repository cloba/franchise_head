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
<h1>판매내역 상세</h1>
	<table border="1">
		<tr>
			<th>판매코드</th>
			<th>상품메뉴 통합코드</th>
			<th>판매수량</th>
			<th>가맹번호</th>
			<th>판매그룹번호</th>
			<th>매입금액</th>
			<th>판매금액</th>
			<th>판매일자</th>
			<th>마감유무</th>
			<th>마감담당 직원</th>
			<th>마감일자</th>
			<th>수금여부</th>
			<th>본사이익금액</th>
		</tr>
		<tr>
			<th>${sell.headSellCode}</th>
			<th>${sell.inteCode}</th>
			<th>${sell.headSellQuantity}</th>
			<th>${sell.subCode}</th>
			<th>${sell.headSellGroup}</th>
			<th>${sell.headSellPurchasePrice}</th>
			<th>${sell.headSellSellingPrice}</th>
			<th><fmt:parseDate value="${sell.headSellDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></th>
			<th>${sell.headSellFinal}</th>
			<th>${sell.headSellFinalStaff}</th>
			<th><fmt:parseDate value="${sell.headSellFinalDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></th>
			<th>${sell.headSellDistr}</th>
			<th><fmt:formatNumber value="${sell.headSellProfitHead}" pattern="#,###"/></th>
		</tr>
	</table>
	<a href="#">[수정/미구현]</a>
	<a href="/viewSellList">[전체판매내역]</a>
</body>
</html>