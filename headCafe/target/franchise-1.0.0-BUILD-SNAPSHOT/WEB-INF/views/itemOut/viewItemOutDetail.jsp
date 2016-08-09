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
<h1>출고 상세</h1>

	<table border="1">
		<tr>
			<th>출고코드</th>
			<th>출고그룹</th>
			<th>가맹발주번호</th>
			<th>가맹일련번호</th>
			<th>요청확인 직원아이디</th>
			<th>상품개별코드</th>
			<th>상품코드</th>
			<th>출고날짜</th>
			<th>출고 직원아이디</th>
			<th>배송상태</th>
		</tr>
		<tr>
			<th>${itemOut.headOutCode}</th>
			<th>${itemOut.headOutGroup}</th>
			<th>${itemOut.ordersCode}</th>
			<th>${itemOut.storeCode}</th>
			<th>${itemOut.headStaffCheck}</th>
			<th>${itemOut.specificItemCode}</th>
			<th>${itemOut.hItemCode}</th>
			<th>
				<fmt:parseDate value="${itemOut.headOutDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
			</th>
			<th>${itemOut.headStaffSender}</th>
			<c:choose>
					<c:when test="${itemOut.headOutStatus eq 1}">
						<th>가맹요청</th>
					</c:when>
					<c:when test="${itemOut.headOutStatus eq 2}">
						<th>배송준비중</th>
					</c:when>
					<c:when test="${itemOut.headOutStatus eq 3}">
						<th>배송완료</th>
					</c:when>
					<c:otherwise>
						<th>가맹 수령완료</th>
					</c:otherwise>
				</c:choose>
		</tr>
	</table>

	<a href="/modifyItemOut?headOutCode=${itemOut.headOutCode}">[수정:구현전]</a>
	<a href="/viewItemOutList">[돌아가기]</a>
</body>
</html>