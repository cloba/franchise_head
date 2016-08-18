<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#headStaffName').blur(function(){
			if($('#headStaffName').val().length ==''){
				if( $('#nameHelper').hide()){
					$('#nameHelper').show();
				}
				$('#nameHelper').css('color','red');
				$('#nameHelper').text('이름을 입력해주세요.');
			}else{
				$('#nameHelper').hide();
			}
			
		});
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
		$('#joinBtn').click(function(){
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
				$('#joinForm').submit();
			}
		});
	});
</script>

</head>
<body>
	<h1>회원가입</h1>
	<form action="/addHeadStaff" method="POST" id="joinForm">
<!-- 		<div> -->
<!-- 			<label>headStaffID : </label> -->
<!-- 			<input type="text" name="headStaffId"/> -->
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label>headStaffPw : </label> -->
<!-- 			<input type="text" name="headStaffPw"/> -->
<!-- 		</div> -->
		
		<div>
			<label>성명: </label>
			<input type="text" name="headStaffName" id="headStaffName">
			<span id="nameHelper"></span>
		</div>
		
		<div>
			<label for="headStaffPhone">연락처 : </label>
			<select name="headStaffPhone" style="width: 50px" >
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select>-	
			<input type="text" name="headStaffPhoneSecond" id="headStaffPhoneSecond" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>-
			<input type=text name="headStaffPhoneThird" id="headStaffPhoneThird" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>
			<span id="headStaffPhoneHelper"></span>
		</div>
<!-- 		<div> -->
<!-- 			<input type="hidden" name="headStaffLevel" value="관리자"> -->
<!-- 		</div> -->
		<div>
			<label>부서 선택</label>
			<select id="headStaffDep" name="headStaffDep" >
				<option value="0">부서 선택</option>
				<option value="영업부">영업부</option>
				<option value="관리부">관리부</option>
				<option value="재무부">재무부</option>
				<option value="마케팅부">마케팅부</option>
				<option value="기획전략">기획전략</option>
			</select>
		</div>
		<div>
			<label for="headStaffPost">우편번호: </label>
			<input type="text" id="sample4_postcode" name="headStaffPost" readonly="readonly">
			<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기"/>
			<span id="headStaffPostHelper"></span>
		</div>
		<div>
			<label for="headStaffRoadAddr">도로명 주소: </label>
			<input type="text" id="sample4_roadAddress" name="headStaffRoadAddr" style="width: 300px" readonly="readonly"/>
		</div>
		<div>
			<label for="headStaffParcleAddr">지번 주소: </label>
			<input type="text" id="sample4_jibunAddress" name="headStaffParcleAddr" style="width: 300px"/>
			<span id="guide" style="color:#999"></span>
		</div>
	<!-- 	<div>
			<label>입사일: </label>
			<input type="text" value="" name="headStaffJoin"> 
		</div> -->
		<div>
			<input type="button" value="가입" id="joinBtn">
		</div>
	</form>
</body>
</html>