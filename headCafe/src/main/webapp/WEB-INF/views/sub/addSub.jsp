<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	#joinBtn {
		background: hsl(50, 100%, 97%);
		display: block; height: auto; margin: 0 auto; 
	}
	
	.phone-group {
		display: inline;
	}
	
</style>
<script>
	$(document).ready(function(){

		// 폼 제출
		$('#joinBtn').click(function(){
			if ($('#subName').val() == ""){
				alert("가맹점 명을 입력 해주세요.");
			}else if ($('#subOwner').val().length < 2){
				alert("점주명을 입력 해주세요.");
			}else if ($('#subPhoneFirst').val().length < 3){
				alert("전화번호를 입력 해주세요.");
			}else if ($('#subPhoneSecond').val().length < 3){
				alert("전화번호를 입력 해주세요.");	
			}else if ($('#subPhoneThird').val().length < 3){
				alert("전화번호를 입력 해주세요.");	
 			}else if($('#sample4_postcode').val().length < 5){
				alert("주소를 입력 해주세요."); 
			}else {
				$('#addForm').submit();
			}
		
		});
		
	});
</script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">신규 가맹등록</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form action="/addSub.do" role="form" method="POST" id="addForm">
								<div class="form-group">
									<label>가맹점명</label> 
									<input class="form-control" name="subName" id="subName" required="required" />
								</div>
								<div class="form-group">
									<label>점주명</label> 
									<input class="form-control" name="subOwner" id="subOwner" required="required"/>
								</div>
								<div class="form-group phone-group">
									<label>연락처</label> 
									<input class="form-control" name="subPhoneFirst" id="subPhoneFirst" required="required"/>-
									<input class="form-control" name="subPhoneSecond" id="subPhoneSecond" required="required"/>-
									<input class="form-control" name="subPhoneThird" id="subPhoneThird" required="required"/>
								</div>
								<div class="form-group">
									<label>우편번호</label> 
										<input type="text" class="form-control" id="sample4_postcode" name="subPost" style="width: 300px" readonly="readonly" value="" /> 
										<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기" />
								</div>
								<div class="form-group">
									<label>도로명 주소</label> 
									<input class="form-control" id="sample4_roadAddress" name="subRoadAddr" style="width: 300px" readonly="readonly" value="" />
								</div>
								<div class="form-group">
									<label>지번 주소</label> 
									<input class="form-control" id="sample4_jibunAddress" name="subParcelAddr" style="width: 300px" value="" readonly="readonly" />
								</div>
								<input type="hidden" name="headStaffId" value="${login.headStaffId}">
								<input type="button" id="joinBtn" class="btn btn-default" value="등록">
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
