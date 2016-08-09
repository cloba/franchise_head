<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<h1>가맹점 수정</h1>
	<form id="modifyForm" action="/modifySub" method="post">
		<div> 
		가맹점코드: <input type="text" id="subCode" name="subCode" value="${sub.subCode}" readonly="readonly"/> 
		</div>
		<div> 
		등록직원아이디: <input type="text" id="headStaffId" name="headStaffId" value="${sub.headStaffId}" readonly="readonly"/> 
		</div>
		<div> 
		가맹점명: <input type="text" id="subName" name="subName" value="${sub.subName}" required="required"/> 
		</div>
		<div> 
		가맹점주명: <input type="text" id="subOwner" name="subOwner" value="${sub.subOwner}" required="required"/> 
		</div>
		<div> 
		전화번호: <input type="text" name="subPhoneFirst" value="${sub.subPhoneFirst}" required="required"/> 
				<input type="text" name="subPhoneSecond" value="${sub.subPhoneSecond}" required="required"/> 
				<input type="text" name="subPhoneThird" value="${sub.subPhoneThird}" required="required"/> 
		</div>
		<div>
			<label for="headStaffPost">우편번호: </label>
			<input type="text" id="sample4_postcode" name="subPost" value="${sub.subPost}" readonly="readonly">
			<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기"/>
			<span id="headStaffPostHelper"></span>
		</div>
		<div>
			<label for="headStaffRoadAddr">도로명 주소: </label>
			<input type="text" id="sample4_roadAddress" name="subRoadAddr" value="${sub.subRoadAddr}" style="width: 300px" readonly="readonly"/>
		</div>
		<div>
			<label for="headStaffParcleAddr">지번 주소: </label>
			<input type="text" id="sample4_jibunAddress" name="subParcelAddr" value="${sub.subParcelAddr}" style="width: 300px"/>
			<span id="guide" style="color:#999"></span>
		</div>
		<button>저장</button>
	</form>
</body>
</html>