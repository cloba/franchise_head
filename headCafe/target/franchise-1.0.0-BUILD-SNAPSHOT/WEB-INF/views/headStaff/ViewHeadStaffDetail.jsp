<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
			<th>핸드폰번호</th>
			<th>우편번호</th>
			<th>도로명주소</th>
			<th>지번주소</th>
			<!-- 퇴사한 직원에 한해서 퇴사일을 보여줌 -->
			<c:if test="${HeadStaff.resignIdentify == 'Y' }"> 
				<th>퇴사일</th>
			</c:if>
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
			<td>${headStaff.headStaffPhoneFirst } - ${headStaff.headStaffPhoneSecond } - ${headStaff.headStaffPhoneThird}</td>
			<td>${headStaff.headStaffPost }</td>
			<td>${headStaff.headStaffRoadAddr }</td>
			<td>${headStaff.headStaffParcleAddr }</td>
			<!-- 퇴사한 직원에 한해서 퇴사일을 보여줌 -->
			<c:if test="${HeadStaff.resignIdentify == 'Y' }"> 
				<td>${HeadStaff.headStaffResign }</td> 
 			</c:if>  
			<td>${headStaff.headStaffRegitDate }</td>
			<td>${headStaff.headStaffRegitId }</td>
		</tr>
	</table>
	<div>
		<a href="/modifyFormHeadStaff?headStaffId=${headStaff.headStaffId }"><input id="modifyHeadStaff" type="button" value="회원정보 관리"></a>
		<a href = "/addResignStaff?headStaffId=${headStaff.headStaffId}"><input type="button" value="퇴사등록"></a>
		<a href="/viewHeadStaffList"><input id="cancel" type="button" value="되돌아가기"></a>
	</div>	
</div>
</body>
</html>