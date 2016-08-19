<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.btns{
		 margin-left: 300px;
	}
</style>
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
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">신규 직원 등록</h1>
		</div>
	</div>
	<form action="/addHeadStaff.do" role="form" method="POST" id="joinForm">
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
								<div class="form-group">
									<label>성명</label> 
									<input class="form-control" name="headStaffName" id="headStaffName" required="required" />
									<span id="nameHelper"></span>
								</div>
								<div class="form-group">
									<label>연락처</label> 
									<select class="form-control" name="headStaffPhone" style="width: 50px" required="required">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>-	
									<input class="form-control" type="text" name="headStaffPhoneSecond" id="headStaffPhoneSecond" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>-
									<input class="form-control" type=text name="headStaffPhoneThird" id="headStaffPhoneThird" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>
									<span id="headStaffPhoneHelper"></span>
								</div>
								<div class="form-group">
									<label>부서</label> 
									<select class="form-control" id="headStaffDep" name="headStaffDep" required="required">
										<option value="0">부서 선택</option>
										<option value="영업부">영업부</option>
										<option value="관리부">관리부</option>
										<option value="재무부">재무부</option>
										<option value="마케팅부">마케팅부</option>
										<option value="기획전략">기획전략</option>
									</select>
								</div>
								<div class="form-group">
									<label>우편번호</label> 
									<input class="form-control" id="sample4_postcode" name="headStaffPost" readonly="readonly"/>
									<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기"/>
									<span id="headStaffPostHelper"></span>
								</div>
								<div class="form-group">
									<label>도로명주소</label> 
									<input class="form-control" type="text" id="sample4_roadAddress" name="headStaffRoadAddr" style="width: 300px" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>지번주소</label> 
									<input class="form-control" type="text" id="sample4_jibunAddress" name="headStaffParcleAddr" style="width: 300px" readonly="readonly"/>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<a class="btn btn-default" href="/viewHeadStaffList.do">돌아가기</a>
				<input type="button" id="joinBtn" class="btn btn-default" value="등록">
			</div>
			</form>
		</div>
	</body>
</html>