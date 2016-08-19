<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#btn {
		float: right;
	}
	.buttons{
		text-align: right;
	}
</style>
<script>
	$(document).ready(function(){
		//상품코드 유효성
		$('#hItemCode').blur(function(){
			if($('#hItemCode').val().length ==''){
				if( $('#nameHelper').hide()){
					$('#nameHelper').show();
				}
				$('#nameHelper').css('color','red');
				$('#nameHelper').text('상품코드를 입력해주세요.');
			}else{
				$('#nameHelper').hide();
			}
			
		});
		
		//개별상품코드 유효성
		$('#specificItemCode').blur(function(){
			if($('#specificItemCode').val().length ==''){
				if( $('#specificItemCodeHelper').hide()){
					$('#specificItemCodeHelper').show();
				}
				$('#specificItemCodeHelper').css('color','red');
				$('#specificItemCodeHelper').text('개별상품 코드를 입력해주세요.');
			}else{
				$('#specificItemCodeHelper').hide();
			}
			
		});
		//폐기사유 유효성
		$('#headClientPhoneSecond').blur(function(){
			if($('#headClientPhoneSecond').val().length ==''){
				if( $('#headDumpReasonHelper').hide()){
					$('#headDumpReasonHelper').show();
				}
				$('#headDumpReasonHelper').css('color','red');
				$('#headDumpReasonHelper').text('폐기사유를 입력해주세요.');
			}else{
				$('#headDumpReasonHelper').hide();
			}
			
		});
		
		// 폼 제출
		$('#modifyBtn').click(function(){
			if ($('#hItemCode').val() == ""){
				alert("상품코드를 입력해주세요.");
			}else if ($('#specificItemCode').val() == ""){
				alert("개별상품 코드를 입력 해주세요.");	
			}else if ($('#headDumpReason').val() == ""){
				alert("폐기사유를 입력 해주세요.");
			}else {
				$('#modifyHeadDumpForm').submit();
			}
		});
	});
</script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">판매불가 상품 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					상세 수정
					<span id="btn">
						<a href="/viewHeadDumpDetail.do?headDumpCode=${headDump.headDumpCode }">돌아가기</a>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="modifyHeadDumpForm" role="form" action="/modifyHeadDump.do" method="POST">
								<div class="form-group">
									<label>판매불가코드</label> 
									<input class="form-control" name="headDumpCode" value="${headDump.headDumpCode }" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>상품코드</label> 
									<input class="form-control" name="hItemCode" id="hItemCode" value="${headDump.hItemCode}" required="required"/>
									<span id="hItemCodeHelper"></span>
								</div>
								<div class="form-group">
									<label>개별상품코드</label> 
									<input class="form-control" name="specificItemCode" id="specificItemCode" value="${headDump.specificItemCode}" required="required"/>
									<span id="specificItemCodeHelper"></span>
								</div>
								<div class="form-group">
									<label>폐기사유</label> 
									<input class="form-control" name="headDumpReason" id="headDumpReason" value="${headDump.headDumpReason}" required="required"/>
									<span id="headDumpReasonHelper"></span>
								</div>
								<div class="buttons">
									<input type="submit" id="modifyFormBtn" class="btn btn-default" value="저장">
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