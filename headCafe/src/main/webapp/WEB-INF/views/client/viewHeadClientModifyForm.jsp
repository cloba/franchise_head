							<!-- 거래처 수정화면  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#btn {
		float: right;
	}

	/* .phoneSelect{

		width: 10%;
		float: left;
		}
	.phoneLine{
		float:left;
		width:5%;
		
	}
	.phone{
		width: 100%;
	} */
	
	.post{
		display: inline;
	}
	
	.buttons{
		text-align: right;
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

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">거래처 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					client information 
					<span id="btn">
						<a href="/viewHeadClientList.do">돌아가기</a>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="modifyForm" role="form" action="/modifyClient.do" method="POST">
								<div class="form-group">
									<label>거래처명</label> 
									<input class="form-control" name="headClientInCharge" id="headClientInCharge" value="${client.headClientInCharge }">
									<p id="nameHelper" class="help-block"></p>
								</div>
								<div class="form-group">
									<label>담당자명</label> 
									<input class="form-control" name="headClientName" id="headClientName" value="${client.headClientName }">
									<p id="inChargeHelper" class="help-block"></p>
								</div>
								<div class="form-group">
									<label>계약상태</label> 
									<select class="form-control" name="headClientContract" style="width: 150px">
										<option value="1"
											<c:if test="${client.headClientContract eq '1' }">selected="selected"</c:if>>계약중</option>
										<option value="2"
											<c:if test="${client.headClientContract eq '2' }">selected="selected"</c:if>>계약중지</option>
										<option value="3"
											<c:if test="${client.headClientContract eq '3' }">selected="selected"</c:if>>계약만료</option>
										<option value="4"
											<c:if test="${client.headClientContract eq '4' }">selected="selected"</c:if>>계약파기</option>
									</select>
								</div>
								<div class="form-group phone" >
									<label style="width: 100%">연락처</label>
									<select class="form-control phoneSelect" name="headClientPhoneFirst" style="width: 100px" style="width:15%">
										<option value="010" 
											<c:if test="${client.headClientPhoneFirst eq '010' }">selected="selected"</c:if>>010</option>
										<option value="011"
											<c:if test="${client.headClientPhoneFirst eq '011' }">selected="selected"</c:if>>011</option>
										<option value="016"
											<c:if test="${client.headClientPhoneFirst eq '016' }">selected="selected"</c:if>>016</option>
										<option value="017"
											<c:if test="${client.headClientPhoneFirst eq '017' }">selected="selected"</c:if>>017</option>
										<option value="018"
											<c:if test="${client.headClientPhoneFirst eq '018' }">selected="selected"</c:if>>018</option>
										<option value="019"
											<c:if test="${client.headClientPhoneFirst eq '019' }">selected="selected"</c:if>>019</option>
									</select>
									<div class="phoneText" style="margin-left : 0%; width: 5px;" >-</div> 
									<input class="form-control phoneSelect" name="headClientPhoneSecond" id="headClientPhoneSecond" size=4 maxlength=4
										onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
										style='IME-MODE: disabled; width: 100px;'
										value="${client.headClientPhoneSecond }"/>
										<div class="phoneLine" style="margin-left:0%; width: 5px;">-</div> 
									<input
										class="form-control phoneSelect" name="headClientPhoneThird"
										id="headClientPhoneThird" size=4 maxlength=4
										onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
										style='IME-MODE: disabled; width: 100px;'
										value="${client.headClientPhoneThird }" />
									<p id="ClientPhoneHelper" class="help-block"></p>
								</div><br>
								<div class="form-group">
									<label>우편번호</label> 
									<div class="post">
										<input type="text" class="form-control" id="sample4_postcode" name="headClientPost" style="width: 300px" readonly="readonly" value="${client.headClientPost }" /> 
										<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기" />
									</div>
									<p id="clientPostHelper" class="help-block"></p>
								</div>
								<div class="form-group">
									<label>도로명 주소</label> 
									<input class="form-control" id="sample4_roadAddress" name="headClientRoadAddr" style="width: 300px" readonly="readonly" value="${client.headClientRoadAddr }" />
								</div>
								<div class="form-group">
									<label>지번 주소</label> 
									<input class="form-control" id="sample4_jibunAddress" name="headClientParcleAddr" style="width: 300px" value="${client.headClientParcleAddr }" readonly="readonly" />
								</div>
									<input type="hidden" name="headClientCode" value="${client.headClientCode }"> 
								<div class="buttons">
									<input type="button" id="modifyFormBtn" class="btn btn-default" value="저장">
									<button type="reset" class="btn btn-default">다시입력</button>
								</div>
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