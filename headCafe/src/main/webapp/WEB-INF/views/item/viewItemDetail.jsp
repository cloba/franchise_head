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
<h1>상품상세</h1>
	<table border="1">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>통합코드</th>
			<th>개수</th>
			<th>단위</th>
			<th>구입가</th>
			<th>이익률</th>
			<th>이익금액</th>
			<th>판매금액</th>
			<th>소비자가격</th>
			<th>등록일자</th>
			<th>등록한 직원 아이디</th>
			<th>거래처 코드</th>
		</tr>
		<tr>
			<th>${item.hItemCode}</th>
			<th>${item.hItemName}</th>
			<th>${item.inteCode}</th>	
			<th>${item.hItemQuantity}</th>
			<th>${item.hItemUnit}</th>
			<th><fmt:formatNumber value="${item.hItemPurchasePrice}" pattern="#,###"/></th>
			<th>${item.hItemMarginPercent}</th>
			<th>${item.hItemHeadProfit}</th>
			<th><fmt:formatNumber value="${item.hItemSellingPrice}" pattern="#,###"/></th>
			<th><fmt:formatNumber value="${item.hItemRetailPrice}" pattern="#,###"/></th>
			<th><fmt:parseDate value="${item.hItemRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></th>
			<th>${item.headStaffId}</th>
			<th>${item.headClientCode}</th>
		</tr>
	</table>
	<a href="/headModifyItem.do?hItemCode=${item.hItemCode}">[수정]</a>
	<a href="/viewItemList.do">[상품목록]</a>
</body>
</html>