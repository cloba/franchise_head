<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">		
	<title>Home</title>
<script>
	//로그인 메서드
	$(document).ready(function() {
		$('#loginBtn').click(function() {
			console.log('로그인버튼 클릭');
			if ($('#headStaffId').val() == "") {
				alert('아이디를 입력하세요.');
			} else if ($('#headStaffPw').val() == "") {
				alert('비밀번호를 입력하세요.');
			}else{
				$('#loginForm').attr('action','/login.go');  //바꿈
				$('#loginForm').submit();
			}
		});
	});
</script>	
</head>
<body>
<c:choose>
	<c:when test="${login.headStaffId ne null}">
		아이디: ${login.headStaffId}
		<a href="/logout.do">로그아웃</a>
	</c:when>
	<c:otherwise>
		<a href="/login.go">로그인</a>
	</c:otherwise>
</c:choose>
<a href="/viewReceivedOrder.do">들어온 주문 확인</a>
<a href="/viewDeliveryList.do">배송관리</a>
<a href="/viewItemOutList">출고관리</a>
<a href="/viewSellList">본사판매관리</a>
<a href="/viweHeadStockList.do">재고관리</a>
<a href="/viewPaymentList?status=Y">결제방식 관리</a>
<a href="/viewItemList">상품관리</a>
<a href="/viewHeadStaffList">본사직원조회</a>
<a href="/viewMenuList.do?status=Y">메뉴관리</a>
<a href="/viewSubList">가맹관리</a>
<a href="/viewSubjectList">계정과목관리</a>
<a href="/viewHeadClientList.do">거래처관리</a>
<a href="/viewContractList.do">계약관리</a>
<a href="/viewHeadAccountingList.do">회계관리</a>
<a href="/viewRoyaltyList.do">로얄티관리</a>
<a href="/viewRoyaltyOverdueList.do">로얄티 연체관리</a>
<a href="/viewHeadDumpList.do">판매 불가 상품 관리</a>
<a href="/viewReturnsList.do">반품 상품 관리</a>

</body>
</html>
