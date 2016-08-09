<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>가맹점 등록화면</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- head_item에 아이템을 등록하는 페이지입니다 -->
<h1>가맹점 등록</h1>
	<form name="addForm" action="/addSub" method="post">
		<div> 
		가맹점명: <input type="text" name="subName" id="subName" required="required" /> 
		</div>
		<div> 
		점주명: <input type="text" name="subOwner" required="required"/> 
		</div>
		<div> 
		연락처: <input type="text" name="subPhoneFirst" required="required"/> 
			  <input type="text" name="subPhoneSecond" required="required"/> 	
			  <input type="text" name="subPhoneThird" required="required"/> 
		</div>
		<div>
			<label for="headStaffPost">우편번호: </label>
			<input type="text" id="sample4_postcode" name="subPost" readonly="readonly">
			<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기"/>
			<span id="headStaffPostHelper"></span>
		</div>
		<div>
			<label for="headStaffRoadAddr">도로명 주소: </label>
			<input type="text" id="sample4_roadAddress" name="subRoadAddr" style="width: 300px" readonly="readonly"/>
		</div>
		<div>
			<label for="headStaffParcleAddr">지번 주소: </label>
			<input type="text" id="sample4_jibunAddress" name="subParcelAddr" style="width: 300px"/>
			<span id="guide" style="color:#999"></span>
		</div>
		<button>등록</button>
	</form>
</body>
</html>