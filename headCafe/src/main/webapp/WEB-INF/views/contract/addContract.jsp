<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#joinBtn {
		background: hsl(50, 100%, 97%);
		display: block; height: auto; margin: 0 auto; 
	}
	.btns{
		 margin-left: 300px;
	}
	#percent {
		width: 80%;
	}
	.margin {
		display: inline;
	}
</style>
<script>
	$(document).ready(function(){
		//천단위 마다 콤마 찍기
		$('.comma').blur(function(){
			console.log($(this).val());
			var result = inputNumberFormat($(this).val());
			$(this).val(result);
		});
		
		$('.comma').focus(function(){
			console.log('focus');
			var result = uncomma($(this).val());
			$(this).val(result);
		});
		/* $('#addBtn').click(function(){
			$('#addForm').submit();
		}); */
		
	});
</script>
<script type="text/javascript" src="/resources/js/comma.js"></script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">신규 계약 등록</h1>
		</div>
	</div>
	<form action="/addContract.do" role="form" method="POST" id="addForm" enctype="multipart/form-data">
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
								<div class="form-group">
									<label>가맹일련번호</label> 
									<input class="form-control" name="subCode" required="required" />
								</div>
								<div class="form-group">
									<label>계약자명</label> 
									<input class="form-control" name="contractorName" required="required" />
								</div>
							 	<div class="form-group">
									<label>계약일자</label> 
									<input class="form-control" type="date" name="contractActualDate" required="required" />
								</div>
								<div class="form-group">
									<label>계약만료일</label> 
									<input class="form-control" type="date" name="contractExpiryDate" required="required" />
								</div> 
								<div class="form-group">
									<label>가맹금</label> 
									<input class="form-control comma" name="contractDeposit" required="required" />
								</div>
								<div class="form-group">
									<label>이익배분율</label> 
									<input class="form-control" name="contractProfitPercent" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' />
								</div>
								<div class="form-group">
									<label>로열티 지급기일</label> 
									<input class="form-control" name="royaltyDeadline" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' maxlength=2 />
								</div>
								<div class="form-group">
									<label>계약서첨부파일</label> 
									<input class="form-control" type="file" name="file" required="required" />
								</div> --
								<div class="form-group">
									<label>계약차수</label> 
									<input class="form-control" type="number" name="contractN" required="required" min="1" />
								</div>
								<div>
									<input type="hidden" name="headStaffId" value="${login.headStaffId}">
								</div> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<a class="btn btn-default" href="/viewContractList.do">돌아가기</a>
				<input type="submit" id="addBtn" class="btn btn-default" value="등록">
			</div>
			</form>
		</div>
	</body>
</html>
	