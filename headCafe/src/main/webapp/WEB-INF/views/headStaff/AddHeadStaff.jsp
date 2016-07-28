<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="/addHeadStaff" method="POST">
		<div>
			<label>headStaffID : </label>
			<input type="text" name="headStaffId"/>
		</div>
		<div>
			<label>headStaffPw : </label>
			<input type="text" name="headStaffPw"/>
		</div>
		
		<div>
			<label>성명: </label>
			<input type="text" name="headStaffName">
		</div>
		<div>
			<input type="hidden" name="headStaffLevel" value="관리자">
		</div>
		<div>
			<label>부서 선택</label>
			<select name="headStaffDep">
				<option>부서 선택</option>
				<option>영업부</option>
				<option>관리부</option>
				<option>재무부</option>
				<option>마케팅부</option>
				<option>기획전략</option>
			</select>
		</div>
		<div>
			<label>입사일: </label>
			<input type="text" value="" name="headStaffJoin"> 
		</div>
		<div>
			<input type="submit" value="가입">
		</div>
	</form>
</body>
</html>