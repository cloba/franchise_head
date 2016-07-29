<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
tabel , td, th, tr{
	border: 1px solid;
}
</style>
<body>
<h1>본사직원 디테일</h1>
<div>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>직급(권한)</th>
			<th>부서</th>
			<th>입사일</th>
			<th>등록일</th>
			<th>등록한 직원</th>
		</tr>
		<tr>
			<td>${headStaff.headStaffId }</td>
			<td>${headStaff.headStaffPw }</td>
			<td>${headStaff.headStaffName }</td>
			<td>${headStaff.headStaffLevel }</td>
			<td>${headStaff.headStaffDep }</td>
			<td>${headStaff.headStaffJoin }</td>
			<td>${headStaff.headStaffRegitDate }</td>
			<td>${headStaff.headStaffRegitId }</td>
<%-- 				<td>${HeadStaff.headStaffResign }</td> --%>
			<td><a href = "/addResignStaff?headStaffId=${headStaff.headStaffId}"><input type="button" value="퇴사등록"></a></td>
		</tr>
	</table>
	<div>
		<a href="/modifyFormHeadStaff?headStaffId=${headStaff.headStaffId }"><input id="modifyHeadStaff" type="button" value="회원정보 관리"></a>
		<a href="/viewHeadStaffList"><input id="cancel" type="button" value="되돌아가기"></a>
	</div>	
</div>
</body>
</html>