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
<script>
	$(document).ready(function(){
		//이름 유효성
		$('#headClientName').blur(function(){
			if($('#headClientName').val().length ==''){
				if( $('#nameHelper').hide()){
					$('#nameHelper').show();
				}
				$('#nameHelper').css('color','red');
				$('#nameHelper').text('이름을 입력해주세요.');
			}else{
				$('#nameHelper').hide();
			}
			
		});
		
		//담당자 유효성
		$('#headClientInCharge').blur(function(){
			if($('#headClientInCharge').val().length ==''){
				if( $('#inChargeHelper').hide()){
					$('#inChargeHelper').show();
				}
				$('#inChargeHelper').css('color','red');
				$('#inChargeHelper').text('이름을 입력해주세요.');
			}else{
				$('#inChargeHelper').hide();
			}
			
		});
		//핸드폰 가운데 자리 유효성
		$('#headClientPhoneSecond').blur(function(){
			if($('#headClientPhoneSecond').val().length ==''){
				if( $('#headStaffPhoneHelper').hide()){
					$('#headStaffPhoneHelper').show();
				}
				$('#ClientPhoneHelper').css('color','red');
				$('#ClientPhoneHelper').text('전화번호를 입력해주세요.');
			}else{
				$('#ClientPhoneHelper').hide();
			}
			
		});
		//핸드폰 뒷자리 유효성
		$('#headClientPhoneThird').blur(function(){
			if($('#headClientPhoneThird').val().length ==''){
				if( $('#ClientPhoneHelper').hide()){
					$('#ClientPhoneHelper').show();
				}
				$('#ClientPhoneHelper').css('color','red');
				$('#ClientPhoneHelper').text('전화번호를 입력해주세요.');
			}else{
				$('#ClientPhoneHelper').hide();
			}
			
		});
		
		// 폼 제출
		$('#modifyFormBtn').click(function(){
			if ($('#headClientName').val() == ""){
				alert("거래처명을 입력해주세요.");
			}else if ($('#headClientInCharge').val() == ""){
				alert("담당자명을 입력 해주세요.");	
			}else if ($('#headClientPhoneSecond').val().length < 3){
				alert("전화번호를 입력 해주세요.");
			}else if ($('#headClientPhoneThird').val().length < 4){
				alert("전화번호를 입력 해주세요.");
 			}else if($('#sample4_postcode').val().length < 5){
				alert("주소를 입력 해주세요."); 
			}else {
				$('#modifyForm').submit();
			}
		});
	});
</script>
</head>
<body>
<h1>본사 거래처 디테일</h1>
	<form id="modifyForm" action="/modifyClient" method="POST">
		<div>
			<label>거래처명: </label>
			<input type="text" name="headClientName" id="headClientName" value="${client.headClientName }">
			<span id="nameHelper"></span>
		</div>
		
		<div>
			<label>담당자명: </label>
			<input type="text" name="headClientInCharge" id="headClientInCharge" value="${client.headClientInCharge }">
			<span id="inChargeHelper"></span>
		</div>
		
		<div><label>계약 상태: </label>
			<select name="headClientContract" style="width: 150px">
					<option value="1" <c:if test="${client.headClientContract eq '1' }">selected="selected"</c:if>>계약중</option>
					<option value="2" <c:if test="${client.headClientContract eq '2' }">selected="selected"</c:if>>계약중지</option>
					<option value="3" <c:if test="${client.headClientContract eq '3' }">selected="selected"</c:if>>계약만료</option>
					<option value="4" <c:if test="${client.headClientContract eq '4' }">selected="selected"</c:if>>계약파기</option>
			</select>
		</div>
		
		<div>
			<label for="headClientPhoneFirst">연락처 : </label>
			<select name="headClientPhoneFirst" style="width: 50px" >
						<option value="010" <c:if test="${client.headClientPhoneFirst eq '010' }">selected="selected"</c:if>>010</option>
						<option value="011" <c:if test="${client.headClientPhoneFirst eq '011' }">selected="selected"</c:if>>011</option>
						<option value="016" <c:if test="${client.headClientPhoneFirst eq '016' }">selected="selected"</c:if>>016</option>
						<option value="017" <c:if test="${client.headClientPhoneFirst eq '017' }">selected="selected"</c:if>>017</option>
						<option value="018" <c:if test="${client.headClientPhoneFirst eq '018' }">selected="selected"</c:if>>018</option>
						<option value="019" <c:if test="${client.headClientPhoneFirst eq '019' }">selected="selected"</c:if>>019</option>
				</select>-	
			<input type="text" name="headClientPhoneSecond" id="headClientPhoneSecond" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' value="${client.headClientPhoneSecond }"/>-
			<input type="text" name="headClientPhoneThird" id="headClientPhoneThird" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' value="${client.headClientPhoneThird }"/>
			<span id="ClientPhoneHelper"></span>
		</div>
		
		<div>
			<label for="headClientPost">우편번호: </label>
			<input type="text" id="sample4_postcode" name="headClientPost" readonly="readonly" value="${client.headClientPost }">
			<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기"/>
			<span id="clientPostHelper"></span>
		</div>
		<div>
			<label for="headClientRoadAddr">도로명 주소: </label>
			<input type="text" id="sample4_roadAddress" name="headClientRoadAddr" style="width: 300px" readonly="readonly" value="${client.headClientRoadAddr }"/>
		</div>
		<div>
			<label for="headClientParcleAddr">지번 주소: </label>
			<input type="text" id="sample4_jibunAddress" name="headClientParcleAddr" style="width: 300px" value="${client.headClientParcleAddr }"/>
			<span id="guide" style="color:#999"></span>
		</div>
		<div>
			<input type="hidden" name="headClientCode" value="${client.headClientCode }">
		</div>

		<div>
			<input type="button" id="modifyFormBtn" value="수정"> 
		</div>
	</form>
	<a href="/viewHeadClientList">[돌아가기]</a>
</body>
</html>