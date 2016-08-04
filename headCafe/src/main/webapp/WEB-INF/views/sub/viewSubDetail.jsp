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
<h1>가맹 상세</h1>

	<table border="1">
		<tr>
			<th>가맹대표코드</th>
			<th>가맹점명</th>
			<th>가맹등록일자</th>
			<th>점주명</th>
			<th>연락처</th>
			<th>우편번호</th>
			<th>도로명주소</th>
			<th>지번주소</th>
			<th>등록직원 아이디</th>
		</tr>
		<tr>
			<th>${sub.subCode}</th>
			<th>${sub.subName}</th>
			<th>
				<fmt:parseDate value="${sub.subRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
			</th>
			<th>${sub.subOwner}</th>
			<th>${sub.subPhoneFirst}-${sub.subPhoneSecond}-${sub.subPhoneThird}</th>
			<th>${sub.subPost}</th>
			<th>${sub.subRoadAddr}</th>
			<th>${sub.subParcelAddr}</th>
			<th>${sub.headStaffId}</th>
		</tr>
	</table>

	<a href="/modifySub?subCode=${sub.subCode}">[수정:구현전]</a>
	<a href="/viewSubList">[돌아가기]</a>
</body>
</html>