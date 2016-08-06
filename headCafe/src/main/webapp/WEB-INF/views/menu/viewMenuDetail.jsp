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
			<th>${menu.menuCode}</th>
			<th>${menu.menuName}</th>
			<th>${menu.inteCode}</th>
			<th><fmt:formatNumber value="${menu.menuIngrePrice}" pattern="#,###"/></th>
			<th><fmt:formatNumber value="${menu.menuSellingPrice}" pattern="#,###"/></th>
			<th>${menu.headStaffId}</th>
			<th>
				<fmt:parseDate value="${menu.menuRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></th>
			<th>${menu.menuStatus}</th>
			<c:choose>
				<c:when test="${menu.menuStatus ne 'Y'}">
					<th>${menu.menuExpiredDate}</th>
				</c:when>
				<c:otherwise>
					<th>비대상</th>
				</c:otherwise>
			</c:choose>
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
		<c:forEach var="ingreList" items="${ingreList}">
			<tr>
				<th>${ingreList.menuCode}</th>
				<th>${ingreList.hItemCode}</th>
				<th>${ingreList.ingreName}</th>
				<th>${ingreList.ingreAmount}</th>
				<th>${ingreList.ingreMoney}</th>
				<th>${ingreList.headStaffId}</th>
				<th>${ingreList.ingreRegitDate}</th>
			</tr>
		</c:forEach>
	</table>

	<a href="/headModifyMenu?menuDetail=${menu.menuCode}">[수정:구현전]</a>
	<a href="/viewRecipeDetail?menuCode=${menu.menuCode}">[레시피보기]</a>
	<a href="/viewMenuList">[메뉴목록]</a>
</body>
</html>