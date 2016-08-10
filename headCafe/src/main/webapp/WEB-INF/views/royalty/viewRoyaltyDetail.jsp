<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>로얄티 디테일</h1>



	<div><label>로열티지불 코드 : </label>${royalty.royaltyCode}</div><br/>	
	<div><label>가맹 점 포명</label>${royalty.subName}</div>
	<div><label>계약코드</label>${royalty.contractCode}</div>
	<div><label>해당월</label>${royalty.royaltyMonth}</div>
	<div><label>가맹대표코드</label>${royalty.subCode}</div>
	<div><label>로열티 지급 기일</label>${royalty.royaltyDeadline}</div>
	<div><label>로열티 지급 여부</label>${royalty.royaltyPaid}</div>
	<div><label>해당 월 실제 판매 금액</label>${royalty.subPracticalSellPriceMonth}</div>
	<div><label>해당 월 가맹 이익 금액</label>${royalty.subSellProfitMonth}</div>
	<div><label>해당 월 이 가맹에 대한본사 로얄티</label>${royalty.headSellProfitBySubMonth}</div>
	<div><label>실제 지급 날짜</label>${royalty.royaltyPayActualDate}</div>
	<div><label>해당월에 실제 지급한 금액</label>${royalty.royaltyActualAmount}</div>

	

</body>
</html>