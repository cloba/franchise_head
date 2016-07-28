<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">			
	<title>Home</title>
<script>
	//로그인 메서드
	$(document).ready(function() {
		$('#loginBtn').click(function() {
			console.log('로그인버튼 클릭');
			if ($('#staffId').val() == "") {
				alert('아이디를 입력하세요.');
			} else if ($('#staffPw').val() == "") {
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

<a href="/viweHeadStrockList">재고관리</a>


<div class="join">
		<form id="loginForm" action="" method="post" >
		<h2>로그인</h2>
			<div>
				<input type="radio" class="login" name="login" value="head"/> 본사
				<input type="radio" class="login" name="login" value="sub" /> 가맹 
			</div>
			<div class="form-group">
				<label for="staffId">아이디 : </label>
				<input type="text" class="form-control" id="staffId" name ="StaffId" placeholder="Enter ID">
			</div>
			<div class="form-group">
				<label for="staffPw">비밀번호:</label>
				<input type="password" class="form-control" id="staffPw" name = "StaffPw" placeholder="Enter password">
			</div>
			<div id="right">
				<input type="button" class="btn btn-default" id="loginBtn" value="로그인"/>
			</div>
		</form>
	</div>
</body>
</html>
