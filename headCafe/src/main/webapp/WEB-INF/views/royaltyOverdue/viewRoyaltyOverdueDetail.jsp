<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로얄티 연체 디테일</h1>
<div>
	<div><label>로열티 지급예정 코드: </label>${royaltyOverdue.royaltyOverdueCode}</div>
	<div><label>점포명: </label>${royaltyOverdue.subName}</div>
	<div><label>계약코드: </label>${royaltyOverdue.contractCode}</div>
	<div><label>지불 상태: </label> 
		<c:if test="${royaltyOverdue.royaltyOverdueStatus == 'N'}">미납</c:if>
		<c:if test="${royaltyOverdue.royaltyOverdueStatus == 'Y'}">완납</c:if></div>
		
	<div><label>납부 금액: </label>${royaltyOverdue.royaltyOverduePaid}</div>
	<div><label>납부 일자: </label>${royaltyOverdue.royaltyOverduePayDate}</div>
	<div><label>남은 금액: </label>${royaltyOverdue.royaltyOverdueRest}</div>
	
	<a href="/addRoyaltyPay">로얄티 연체 추가</a>
</div>	
</body>

</html>