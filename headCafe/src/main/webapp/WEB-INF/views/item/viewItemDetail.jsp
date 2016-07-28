<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			<th>${item.hItemPurchasePrice}</th>
			<th>${item.hItemMarginPercent}</th>
			<th>${item.hItemHeadProfit}</th>
			<th>${item.hItemSellingPrice}</th>
			<th>${item.hItemRetailPrice}</th>
			<th>${item.hItemRegitDate}</th>
			<th>${item.headStaffId}</th>
			<th>${item.headClientCode}</th>
		</tr>
	</table>
	<a href="/headModifyItem?hItemCode=${item.hItemCode}">[수정]</a>
	<a href="/viewItemList">[상품목록]</a>
</body>
</html>