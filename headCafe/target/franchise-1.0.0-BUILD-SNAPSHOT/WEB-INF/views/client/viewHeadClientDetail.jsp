<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>


<h1>본사 거래처 디테일</h1>

	<div><label>거래처 코드 : </label>${client.headClientCode }</div><br/>
	<div><label>거래처 명 : </label>${client.headClientName }</div><br/>
	<div><label>계약 상태 : </label>${client.headClientContract }</div><br/>
	<div><label>담당자 명 : </label>${client.headClientInCharge }</div><br/>
	<div><label>연락처  : </label>${client.headClientPhoneFirst} - ${client.headClientPhoneSecond } - ${client.headClientPhoneThird }</div><br/>
	
	<div><label>거래처 우편주소 : </label>${client.headClientPost }</div><br/>
	<div><label>거래처 번지주소 : </label>${client.headClientParcleAddr }</div><br/>
	<div><label>거래처 도로명주소 : </label>${client.headClientRoadAddr }</div><br/>
	
	<div><label>등록한 직원  : </label>${client.headStaffId }</div><br/>
	<div><label>등록한 날짜  : </label>${client.headClientRegitDate }</div><br/>
	

</body>
</html>