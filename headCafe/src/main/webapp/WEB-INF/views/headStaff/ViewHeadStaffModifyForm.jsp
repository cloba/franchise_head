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
<h1>본사 직원 수정 폼</h1>
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
			<th>퇴사일</th>
		</tr>
		<tr>
			<td><input type="text" name="headStaffId" value="${headStaff.headStaffId }"></td>
			<td><input type="text" name="headStaffPw" value="${headStaff.headStaffPw }"></td>
			<td><%-- <input type="text" name="headStaffName" value=" --%>${headStaff.headStaffName }</td>
			<td><input type="text" name="headStaffLevel" value="${headStaff.headStaffLevel }"></td>
			<td><input type="text" name="headStaffDep" value="${headStaff.headStaffDep }"></td>
			<td><input type="text" name="headStaffJoin" value="${headStaff.headStaffJoin }"></td>
			<td><input type="text" name="headStaffRegitDate" value="${headStaff.headStaffRegitDate }"></td>
			<td><input type="text" name="headStaffRegitId" value="${headStaff.headStaffRegitId }"></td>
<%-- 				<td>${HeadStaff.headStaffResign }</td> --%>
		</tr>
	</table>
	<div>
		<a href="/modifyFormHeadStaff"><input id="modifyHeadStaff" type="button" value="회원정보 관리"></a>
		<a href="/viewHeadStaffList?headStaffId=${headStaff.headStaffId }"><input id="cancel" type="button" value="직원 리스트 관리"></a>
	</div>	
</div>
</body>
</html>