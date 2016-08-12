<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>본사 거래처 디테일</h1>
	<form id="modifyForm" action="/modifyClient">
		<div><label>거래처 코드 : </label><input type="text" name="headClientCode" value="${client.headClientCode}"></div><br/>
		<div><label>거래처 명 : </label><input type="text" name="headClientName" value="${client.headClientName}"></div><br/>
		<div><label>계약 상태 : </label><input type="text" name="headClientContract" value="
			<c:if test="${client.headClientContract eq '1'}">계약	 체결 중</c:if>
			<c:if test="${client.headClientContract eq '2'}">계약 중지</c:if>
			<c:if test="${client.headClientContract eq '3'}">계약	 만료</c:if>
			<c:if test="${client.headClientContract eq '4'}">계약	 파기</c:if>"></div><br/>
		
		<div><label>담당자 명 : </label><input type="text" name="headClientInCharge" value="${client.headClientInCharge}"></div><br/>
		
		<div><label>연락처  : </label><input type="text" name="headClientPhoneFirst" value="${client.headClientPhoneFirst}"> - 
									<input type="text" name="headClientPhoneSecond" value="${client.headClientPhoneSecond}"> -
									<input type="text" name="headClientPhoneThird" value="${client.headClientPhoneThird}"></div><br/>		
											
		<div><label>거래처 우편주소 : </label><input type="text" name="headClientPost" value="${client.headClientPost}"></div><br/>
		<div><label>거래처 번지주소 : </label><input type="text" name="headClientParcleAddr" value="${client.headClientParcleAddr}"></div><br/>
		<div><label>거래처 도로명주소 : </label><input type="text" name="headClientRoadAddr" value="${client.headClientRoadAddr}"></div><br/>
		
		<div><label>등록한 직원  : </label><input type="text" name="headStaffId" value="${client.headStaffId}"></div><br/>
		<div><label>등록한 날짜  : </label><input type="text" name="headClientRegitDate" value="${client.headClientRegitDate}"></div><br/>
	</form>
	<input type="submit" value="수정"> 
	<a href="/viewHeadClientList">[돌아가기]</a>
</body>
</html>