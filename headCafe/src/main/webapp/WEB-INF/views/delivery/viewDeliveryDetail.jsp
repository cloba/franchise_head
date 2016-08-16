<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC>
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
<h1>배송 상세</h1>

	<table border="1">
		<tr>
			<th>배송코드</th>
			<th>가맹발주번호</th>
			<th>배송일자</th>
			<th>가맹수령여부</th>
			<th>현 위치</th>
			<th>확인 직원 아이디</th>
			<th>확인날짜</th>
			<th>반송해당여부</th>
			<th>배달직원</th>
		</tr>
		<tr>
			<th>${delivery.deliveryCode}</th>
			<th>${delivery.receivedOrderCode}</th>
			<th>
				<fmt:parseDate value="${delivery.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
			</th>
			<th>${delivery.deliveryReceive}</th>
			<th>${delivery.deliveryLocation}</th>
			<th>${delivery.headStaffId}</th>
			<th>${delivery.headStaffId}</th>
			<th>${delivery.deliveryConfirmDate}</th>
			<th>${delivery.deliveryPerson}</th>
			<th>${itemOut.headStaffSender}</th>
		</tr>
	</table>

	<a href="/modifyDelivery.do?deliveryCode=${delivery.deliveryCode}">[수정:구현전]</a>
	<a href="/viewDeliveryList.do">[돌아가기]</a>
</body>
</html>