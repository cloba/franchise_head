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
				$('#loginForm').attr('action','/loginStaff');  //바꿈
				$('#loginForm').submit();
			}
		});
	});
</script>	
</head>
<body>
로그인 아이디: ${headStaffLogin.headStaffId}
<a href="/viewReceivedOrder">들어온 주문 확인</a>
<a href="/viewDeliveryList">배송관리</a>
<a href="/viewItemOutList">출고관리</a>
<a href="/viewSellList?status=Y">본사판매관리</a>
<a href="/viweHeadStockList">재고관리</a>
<a href="/viewPaymentList?status=Y">결제방식 관리</a>
<a href="/viewItemList">상품관리</a>
<a href="/viewHeadStaffList">본사직원조회</a>
<a href="/viewMenuList?status=Y">메뉴관리</a>
<a href="/viewRecipeList">레시피관리</a>
<a href="/viewSubList">가맹관리</a>
<a href="/viewSubjectList">계정과목관리</a>
<a href="/viewHeadClientList">거래처관리</a>
<a href="/viewContractList">계약관리</a>
<a href="/viewHeadAccountingList">회계관리</a>
<a href="/viewRoyaltyList">로얄티관리</a>
<a href="/viewRoyaltyOverdueList">로얄티 연체관리</a>
<a href="/viewHeadDumpList">폐기 상품 관리</a>
<c:choose>
<c:when test="${headStaffLogin.headStaffId == null or headStaffLogin.headStaffId == '' }">

	<!-- 로그인 폼 -->
	<div class="join">
		<form id="loginForm" action="" method="post" >
			<h2>로그인</h2>
			
			<div class="form-group">
				<label for="staffId">아이디 : </label>
				<input type="text" class="form-control" id="headStaffId" name ="headStaffId" placeholder="Enter ID">
			</div>
			<div class="form-group">
				<label for="staffPw">비밀번호:</label>
				<input type="password" class="form-control" id="headStaffPw" name = "headStaffPw" placeholder="Enter password">
			</div>
			<div id="right">
				<input type="button" class="btn btn-default" id="loginBtn" value="로그인"/>
			</div>
		</form>
	</div>
</c:when>
	<c:otherwise>
	아이디: ${headStaffLogin.headStaffId}
	<a href="/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
</body>
</html>
