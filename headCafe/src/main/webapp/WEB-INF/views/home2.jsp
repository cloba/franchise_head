<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
	#loginForm{
		padding-left:30%;
		width: 60%;
	}	
	 #right{
	 	text-align: right;
	 }
</style>
<script>
	$(document).ready(function() {
		$('#loginBtn').click(function() {
			console.log('로그인버튼 클릭');
			//아이디, 비밀번호 입력여부 검사
			if ($('#staffId').val() == "") {
				//console.log('아이디 미입력');
				alert('아이디를 입력하세요.');
			} else if ($('#staffPw').val() == "") {
				//console.log('비밀번호 미입력');
				alert('비밀번호를 입력하세요.');
			} else if ($('input:radio[name=login]:checked').length < 1) {
				alert('소속을 선택해주세요.');
			} else {
				if ($('input:radio[name=login]:checked').val() == 'head') {
					$('#staffId').attr('name','headStaffId');
					$('#staffPw').attr('name','headStaffPw');
					$('#loginForm').attr('action','/loginHeadStaff');
				}else if ($('input:radio[name=login]:checked').val() == 'sub') {
					$('#staffId').attr('name','subStaffId');
					$('#staffPw').attr('name','subStaffPw');
					$('#loginForm').attr('action','/loginSubStaff');
				}
				$('#loginForm').submit();
			}
			
		});
	});
</script>
</head>
<body>
<h1>
	Hello ${subStaffLogin.subStaffId} nim  
</h1>
<c:if test="${headStaffLogin != null}">
<!-- 본사 용 -->
	<a href="/viewItemList">상품 리스트</a>
	<a href="/viewHeadStaffList">본사직원조회</a>
	<a href="/headViewHeadClientList">본사거래처조회</a>
	<a href="/viewSubList">가맹조회</a>
	<a href="/subAddSubStaff">가맹직원등록</a>
	<a href="/viewSubStaffList">가맹직원조회</a>
	<a href="/viewContractList">계약조회</a>
	<a href="/headViewIngrePriceList">재료당가격계산</a>
	<a href="/logout">logout</a>
	
</c:if>
<c:if test="${subStaffLogin != null}">
<!-- 가맹 용 -->
	<a href="/viewItemList">상품 리스트</a>
	<a href="/mySub?subCode=${subStaffLogin.subCode}">내 가맹정보 보기</a>
	<a href="/subAddSubStaff">가맹직원등록</a>
	<a href="/viewSubStaffList?subCode=${subStaffLogin.subCode}">가맹직원조회</a>
	<a href="/viewContractList">계약조회</a>
	<a href="/headViewIngrePriceList">재료당가격계산</a>
	<a href="/logout">logout</a>
	
</c:if>
<br/>
<!-- 로그인 폼 -->
<c:if test="${subStaffLogin == null and headStaffLogin == null}">
	<div class="container">
		<form role="form" action="" method="post" id="loginForm">
		<h2>로그인</h2>
			<div>
				<input type="radio" class="login" name="login" value="head"/> 본사
				<input type="radio" class="login" name="login" value="sub" /> 가맹 
			</div>
			<div class="form-group">
				<label for="staffId">아이디 : </label>
				<input type="text" class="form-control" id="staffId" name ="" placeholder="Enter ID">
			</div>
			<div class="form-group">
				<label for="staffPw">비밀번호:</label>
				<input type="password" class="form-control" id="staffPw" name = "" placeholder="Enter password">
			</div>
			<div id="right">
				<input type="button" class="btn btn-default" id="loginBtn" value="로그인"/>
			</div>
		</form>
	</div>
</c:if>
</body>
</html>
