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
<h1>결제방식 상세</h1>

	<table border="1">
		<tr>
			<th>결제방식코드</th>
			<th>결제방식</th>
			<th>카드수수료</th>
			<th>등록직원 아이디</th>
			<th>등록일자</th>
			<th>적용상태</th>
		</tr>
		<tr>
			<th>${payment.payMethodCode}</th>
			<th>${payment.payMethod}</th>
			<th>${payment.profitPercent}</th>
			<th>${payment.headStaffId}</th>
			<th>
				<fmt:parseDate value="${payment.profitRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
			</th>
			<th>${payment.profitStatus}</th>
		</tr>
	</table>

	<a href="/modifyPayment?payMethodCode=${payment.payMethodCode}">[수정:구현전]</a>
	<a href="/viewPaymentList">[돌아가기]</a>
</body>
</html>