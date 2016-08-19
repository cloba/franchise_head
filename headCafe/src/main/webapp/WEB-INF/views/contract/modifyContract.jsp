<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#btn {
		float: right;
	}
	.buttons{
		text-align: right;
	}
</style>
<script type="text/javascript"> 
	$(document).ready(function(){
		var target = $('#status').val();
		console.log(target);
		if( target == 1 ){
			$('#option1').attr('selected','selected');
		}else if( target == 2 ){
			$('#option2').attr('selected','selected');
		}else if( target == 4 ){
			$('#option4').attr('selected','selected');
		};
	});
</script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">계약 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					계약을 수정합니다
					<span id="btn">
						<a href="/viewContractDetail.do?contractCode=${contract.contractCode}">돌아가기</a>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="modifyForm" role="form" action="/modifyContract.do" method="POST" enctype="multipart/form-data">
								<div class="form-group">
									<label>계약코드</label> 
									<input class="form-control" name="contractCode" id="contractCode" value="${contract.contractCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>가맹일련번호</label> 
									<input class="form-control" name="subCode" id="subCode" value="${contract.subCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>계약상태</label> 
									<select class="form-control" id="contractStatus" name="contractStatus">
										<option id="option1" value="1">계약중</option>
										<option id="option2" value="2">계약연기</option>
										<option id="option4" value="4">계약만료</option>
									</select>
								</div>
								<div class="form-group">
									<label>첨부파일</label> 
									${contract.contractFileOriginalName}<input type="file" class="form-control" name="file" required="required"/>
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