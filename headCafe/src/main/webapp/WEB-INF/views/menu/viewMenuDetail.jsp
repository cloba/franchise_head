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
<h1>상품 상세</h1>
${menuMap.menuDetail.ingrePriceCode}
${menuDetail.ingrePriceCode}
${ingrePriceCode}

	<table border="1">
		<tr>
			<th>메뉴코드</th>
			<th>메뉴명</th>
			<th>통합코드</th>
			<th>재료구입가</th>
			<th>소비자 가격</th>
			<th>등록직원</th>
			<th>등록날짜</th>
			<th>적용상태</th>
			<th>적용만료날짜</th>
		</tr>
		<tr>
			<th>${menuDetail.ingrePriceCode}</th>
			<th>${menuDetail.menuName}</th>
			<th>${menuDetail.inteCode}</th>
			<th><fmt:formatNumber value="${menuDetail.menuIngrePrice}" pattern="#,###"/></th>
			<th><fmt:formatNumber value="${menuDetail.menuSellingPrice}" pattern="#,###"/></th>
			<th>${menuDetail.headStaffId}</th>
			<th>
				<fmt:parseDate value="${menuDetail.menuRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></th>
			<th>${menuDetail.headStaffId}</th>
			<th>${menuDetail.menuStatus}</th>
			<c:if test="${menuDetail.menuStatus eq 'Y'}">
				<th>${menuDetail.menuExpiredDate}</th>
			</c:if>
		</tr>
	</table>
	
<h3>[필요한 재료량과 가격계산]</h3>	<a href="#">등록(구현전)</a>
	<table border="1">
		<tr>
			<th>메뉴명(그룹코드)</th>
			<th>상품코드</th>
			<th>재료이름</th>
			<th>사용량</th>
			<th>가격</th>
			<th>승인한 직원아이디</th>
			<th>등록일자</th>
		</tr>
		<c:forEach var="menuIngre" items="${menuIngre}">
			<tr>
				<th>${menuIngre.menuCode}</th>
				<th>${menuIngre.headItemCode}</th>
				<th>${menuIngre.ingreName}</th>
				<th>${menuIngre.ingreAmount}</th>
				<th>${menuIngre.ingreMoney}</th>
				<th>${menuIngre.headStaffId}</th>
				<th>${menuIngre.ingreRegitDate}</th>
			</tr>
		</c:forEach>
	</table>

	<a href="/headModifyMenu?menuDetail=${menuDetail.menuCode}">[수정:구현전]</a>
	<a href="/viewMenuList">[메뉴목록]</a>
</body>
</html>