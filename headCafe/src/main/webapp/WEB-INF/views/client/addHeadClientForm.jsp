<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#joinBtn {
		background: hsl(50, 100%, 97%);
		display: block; height: auto; margin: 0 auto; 
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		$('#joinBtn').click(function(){
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
				$('#joinForm').submit();
			}
		});
	});
</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">거래처 추가</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form action="/addHeadClient.do" role="form" method="POST" id="joinForm">
								<div class="form-group">
									<label>거래처명</label> 
									<input class="form-control" name="headClientName" id="headClientName" value="" required="required"/>
									<p id="nameHelper" class="help-block"></p>
								</div>
								<div class="form-group">
									<label>담당자명</label> 
									<input class="form-control" name="headClientInCharge" id="headClientInCharge" value="" required="required"/>
									<p id="inChargeHelper" class="help-block"></p>
								</div>
								<div class="form-group phone" >
									<label style="width: 100%">연락처</label>
									<select class="form-control phoneSelect" name="headClientPhoneFirst" style="width: 100px" style="width:15%">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									<input class="form-control" type="text" name="headClientPhoneSecond" id="headClientPhoneSecond" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'  value=""/>-
									<input class="form-control" type="text" name="headClientPhoneThird" id="headClientPhoneThird" size=4 maxlength=4 onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'  value=""/>
									<p id="ClientPhoneHelper" class="help-block"></p>
								</div><br>
								
								<div class="form-group">
									<label>우편번호</label> 
										<input type="text" class="form-control" id="sample4_postcode" name="headClientPost" style="width: 300px" readonly="readonly" value="" /> 
										<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기" />
									<p id="clientPostHelper" class="help-block"></p>
								</div>
								<div class="form-group">
									<label>도로명 주소</label> 
									<input class="form-control" id="sample4_roadAddress" name="headClientRoadAddr" style="width: 300px" readonly="readonly" value="" />
								</div>
								<div class="form-group">
									<label>지번 주소</label> 
									<input class="form-control" id="sample4_jibunAddress" name="headClientParcleAddr" style="width: 300px" value="" readonly="readonly" />
								</div>
								<input type="hidden" name="headStaffId" value="${login.headStaffId }">
								<input type="hidden" name="headClientCode" value="${client.headClientCode }"> 
								<input type="button" id="joinBtn" class="btn btn-default" value="저장">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>