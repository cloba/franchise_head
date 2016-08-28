							<!-- 직원 정보 수정 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#btn {
		float: right;
	}
	.buttons{
		text-align: right;
	}
</style>
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">직원 정보 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					직원정보
					<span id="btn">
						<a href="/viewHeadStaffList.do?headStaffId=${headStaff.headStaffId }">돌아가기</a>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="modifyForm" role="form" action="/modifyHeadStaff.do" method="POST">
								<div class="form-group">
									<label>아이디</label> 
									<input class="form-control" name="headStaffId" id="headStaffId" value="${headStaff.headStaffId}" readonly="readonly"/>
									<span id="idHelper"></span>
								</div>
								<div class="form-group">
									<label>비밀번호</label> 
									<input class="form-control" type="password" name="headStaffPw" id="headStaffPw" required="required"/>
								</div>
								<div class="form-group">
									<label>성명</label> 
									<input class="form-control" name="headStaffName" id="headStaffName" value="${headStaff.headStaffId}" readonly="readonly"/>
									<span id="nameHelper"></span>
								</div>
								<div class="form-group">
									<label>직급(권한)</label> 
									<input class="form-control" name="headStaffLevel" id="headStaffLevel" value="${headStaff.headStaffLevel}" readonly="readonly"/>
									<span id="pwHelper"></span>
								</div>
								<div class="form-group">
									<label>부서</label> 
									<select class="form-control" name="headStaffDep" id="headStaffDep">
										<option value="0">부서 선택</option>
										<option value="영업부" <c:if test="${headStaff.headStaffDep eq '영업부' }">selected="selected"</c:if>>영업부</option>
										<option value="관리부"<c:if test="${headStaff.headStaffDep eq '관리부' }">selected="selected"</c:if>>관리부</option>
										<option value="재무부"<c:if test="${headStaff.headStaffDep eq '재무부' }">selected="selected"</c:if>>재무부</option>
										<option value="마케팅부"<c:if test="${headStaff.headStaffDep eq '마케팅부' }">selected="selected"</c:if>>마케팅부</option>
										<option value="기획전략"<c:if test="${headStaff.headStaffDep eq '기획전략' }">selected="selected"</c:if>>기획전략</option>
									</select>
								</div>
								<div class="form-group">
									<label>연락처</label> 
									<select class="form-control" name="headStaffPhoneFirst" id="headStaffPhoneFirst">
										<option value="010" <c:if test="${headStaff.headStaffPhoneFirst eq '010' }">selected="selected"</c:if>>010</option>
										<option value="011"<c:if test="${headStaff.headStaffPhoneFirst eq '011' }">selected="selected"</c:if>>011</option>
										<option value="016"<c:if test="${headStaff.headStaffPhoneFirst eq '016' }">selected="selected"</c:if>>016</option>
										<option value="017"<c:if test="${headStaff.headStaffPhoneFirst eq '017' }">selected="selected"</c:if>>017</option>
										<option value="018"<c:if test="${headStaff.headStaffPhoneFirst eq '018' }">selected="selected"</c:if>>018</option>
										<option value="019"<c:if test="${headStaff.headStaffPhoneFirst eq '019' }">selected="selected"</c:if>>019</option>
									</select><br>
									<input class="form-control" type="text" name="headStaffPhoneSecond" id="headStaffPhoneSecond" size=4 maxlength=4 value="${headStaff.headStaffPhoneSecond }" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>-
									<input class="form-control" type="text" name="headStaffPhoneThird" id="headStaffPhoneThird" size=4 maxlength=4 value="${headStaff.headStaffPhoneThird }" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' />
									<span id="headStaffPhoneHelper"></span>
								</div>
								<div class="form-group">
									<label>우편번호</label> 
									<input class="form-control" name="headStaffPost" id="sample4_postcode" value="${headStaff.headStaffPost}" readonly="readonly"/>
									<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기"/>
									<span id="headStaffPostHelper"></span>
								</div>
								<div class="form-group">
									<label>도로명주소</label> 
									<input class="form-control" name="headStaffRoadAddr" id="sample4_roadAddress" value="${headStaff.headStaffRoadAddr}" readonly="readonly"/>
									<span id="pwHelper"></span>
								</div>
								<div class="form-group">
									<label>지번주소</label> 
									<input class="form-control" name="headStaffParcleAddr" id="sample4_jibunAddress" value="${headStaff.headStaffParcleAddr}" readonly="readonly"/>
									<span id="guide" style="color:#999"></span>
								</div>
								<div class="buttons">
									<input type="submit" id="modifyBtn" class="btn btn-default" value="저장">
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