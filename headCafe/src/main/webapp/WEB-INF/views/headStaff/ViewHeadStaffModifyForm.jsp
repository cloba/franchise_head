<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		//핸드폰 가운데 자리 유효성
		$('#headStaffPhoneSecond').blur(function(){
			if($('#headStaffPhoneSecond').val().length ==''){
				if( $('#headStaffPhoneHelper').hide()){
					$('#headStaffPhoneHelper').show();
				}
				$('#headStaffPhoneHelper').css('color','red');
				$('#headStaffPhoneHelper').text('전화번호를 입력해주세요.');
			}else{
				$('#headStaffPhoneHelper').hide();
			}
			
		});
		//핸드폰 뒷자리 유효성
		$('#headStaffPhoneThird').blur(function(){
			if($('#headStaffPhoneThird').val().length ==''){
				if( $('#headStaffPhoneHelper').hide()){
					$('#headStaffPhoneHelper').show();
				}
				$('#headStaffPhoneHelper').css('color','red');
				$('#headStaffPhoneHelper').text('전화번호를 입력해주세요.');
			}else{
				$('#headStaffPhoneHelper').hide();
			}
			
		});
		
		// 폼 제출
		$('#modifyBtn').click(function(){
			if ($('#headStaffName').val() == ""){
				alert("이름 입력해주세요.");
			}else if ($('#headStaffPhoneSecond').val().length < 3){
				alert("전화번호를 입력 해주세요.");
			}else if ($('#headStaffPhoneThird').val().length < 4){
				alert("전화번호를 입력 해주세요.");
			}else if ($('#headStaffDep').val() == '0'){
				alert("부서를 선택해주세요.");
 			}else if($('#sample4_postcode').val().length < 5){
				alert("주소를 입력 해주세요."); 
			}else {
				$('#modifyForm').submit();
			}
		});
	});
</script>
</head>
<style>
tabel , td, th, tr{
	border: 1px solid;
}
</style>
<body>
<h1>본사 직원 수정 폼</h1>
<div>
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<th>아이디</th> -->
<!-- 			<th>비밀번호</th> -->
<!-- 			<th>이름</th> -->
<!-- 			<th>직급(권한)</th> -->
<!-- 			<th>부서</th> -->
<!-- 			<th>입사일</th> -->
<!-- 			<th>등록일</th> -->
<!-- 			<th>퇴사일</th> -->
<!-- 			<th>우편번호</th> -->
<!-- 			<th>도로명주소</th> -->
<!-- 			<th>지번주소</th> -->
			
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td><input type="text" name="headStaffId" value="${headStaff.headStaffId }" readonly="readonly"></td> --%>
<%-- 			<td><input type="text" name="headStaffPw" value="${headStaff.headStaffPw }"></td> --%>
<%-- 			<td><input type="text" name="headStaffName" value="${headStaff.headStaffName }" readonly="readonly"></td> --%>
<%-- 			<td><input type="text" name="headStaffLevel" value="${headStaff.headStaffLevel }"></td> --%>
<%-- 			<td><input type="text" name="headStaffDep" value="${headStaff.headStaffDep }"></td> --%>
<%-- 			<td><input type="text" name="headStaffJoin" value="${headStaff.headStaffJoin }"></td> --%>
<%-- 			<td><input type="text" name="headStaffRegitDate" value="${headStaff.headStaffRegitDate }"></td> --%>
<%-- 			<td><input type="text" name="headStaffRegitId" value="${headStaff.headStaffRegitId }"></td> --%>
<%-- 			<td><input type="text" name="headStaffPost" value="${headStaff.headStaffPost }"></td> --%>
<%-- 			<td><input type="text" name="headStaffRoadAddr" value="${headStaff.headStaffRoadAddr}"></td> --%>
<%-- 			<td><input type="text" name="headStaffParcleAddr" value="${headStaff.headStaffParcleAddr }"></td> --%>
<%-- <%-- 				<td>${HeadStaff.headStaffResign }</td> --%> --%>
<!-- 		</tr> -->
<!-- 	</table> -->
	<form id="modifyForm" method="POST" action="/modifyHeadStaff">
		<div>
			<label>아이디: </label>
			<input type="text" name="headStaffId" value="${headStaff.headStaffId }" readonly="readonly">
			<span id="idHelper"></span>
		</div>
		
		<div>
			<label>비번: </label>
			<input type="text" name="headStaffPw" id="headStaffPw" value="${headStaff.headStaffPw }">
			<span id="pwHelper"></span>
		</div>
		
		<div>
			<label>이름: </label>
			<input type="text" name="headStaffName" id="headStaffName" value="${headStaff.headStaffName }" readonly="readonly">
			<span id="nameHelper"></span>
		</div>
		
		<!-- 사용자 권한에 따른 권한 변경 추가해야함  -->
		<div>
			<label>권한: </label>
			<input type="text" name="headStaffLevel" id="headStaffLevel" value="${headStaff.headStaffLevel }" readonly="readonly">
			<span id="pwHelper"></span>
		</div>
	
		<div>
			<label>부서 선택</label>
			<select id="headStaffDep" name="headStaffDep">
<%-- 				<c:if test="${headStaff.headStaffLevel != null }"> --%>
<%-- 					<option value="${headStaff.headStaffLevel }">${headStaff.headStaffLevel }</option> --%>
<%-- 				</c:if> --%>
				<option value="0">부서 선택</option>
				<option value="영업부" <c:if test="${headStaff.headStaffDep eq '영업부' }">selected="selected"</c:if>>영업부</option>
				<option value="관리부"<c:if test="${headStaff.headStaffDep eq '관리부' }">selected="selected"</c:if>>관리부</option>
				<option value="재무부"<c:if test="${headStaff.headStaffDep eq '재무부' }">selected="selected"</c:if>>재무부</option>
				<option value="마케팅부"<c:if test="${headStaff.headStaffDep eq '마케팅부' }">selected="selected"</c:if>>마케팅부</option>
				<option value="기획전략"<c:if test="${headStaff.headStaffDep eq '기획전략' }">selected="selected"</c:if>>기획전략</option>
			</select>
		</div>
		
		<div>
			<label for="headStaffPhone">연락처 : </label>
			<select name="headStaffPhoneFirst" style="width: 50px" >
						<option value="010" <c:if test="${headStaff.headStaffPhoneFirst eq '010' }">selected="selected"</c:if>>010</option>
						<option value="011"<c:if test="${headStaff.headStaffPhoneFirst eq '011' }">selected="selected"</c:if>>011</option>
						<option value="016"<c:if test="${headStaff.headStaffPhoneFirst eq '016' }">selected="selected"</c:if>>016</option>
						<option value="017"<c:if test="${headStaff.headStaffPhoneFirst eq '017' }">selected="selected"</c:if>>017</option>
						<option value="018"<c:if test="${headStaff.headStaffPhoneFirst eq '018' }">selected="selected"</c:if>>018</option>
						<option value="019"<c:if test="${headStaff.headStaffPhoneFirst eq '019' }">selected="selected"</c:if>>019</option>
				</select>-	
			<input type="text" name="headStaffPhoneSecond" id="headStaffPhoneSecond" size=4 maxlength=4 value="${headStaff.headStaffPhoneSecond }" />-
			<input type="text" name="headStaffPhoneThird" id="headStaffPhoneThird" size=4 maxlength=4 value="${headStaff.headStaffPhoneThird }" />
			<span id="headStaffPhoneHelper"></span>
		</div>
<!-- 		<div> -->
<!-- 			<input type="hidden" name="headStaffLevel" value="관리자"> -->
<!-- 		</div> -->
		<div>
			<label for="headStaffPost">우편번호: </label>
			<input type="text" id="sample4_postcode" name="headStaffPost" readonly="readonly" value="${headStaff.headStaffPost }">
			<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기"/>
			<span id="headStaffPostHelper"></span>
		</div>
		<div>
			<label for="headStaffRoadAddr">도로명 주소: </label>
			<input type="text" id="sample4_roadAddress" name="headStaffRoadAddr" style="width: 300px" value="${headStaff.headStaffRoadAddr}" readonly="readonly"/>
		</div>
		<div>
			<label for="headStaffParcleAddr">지번 주소: </label>
			<input type="text" id="sample4_jibunAddress" name="headStaffParcleAddr" style="width: 300px" value="${headStaff.headStaffParcleAddr }" />
			<span id="guide" style="color:#999"></span>
		</div>
		<div>  
			<input type="button" id="modifyBtn" value="[ 회원정보 수정 ]" > </a>
			<a href="/viewHeadStaffList?headStaffId=${headStaff.headStaffId }">[ 직원 리스트 관리 ]</a>
		</div>	
	</form>
</div>
</body>
</html>