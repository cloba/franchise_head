<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.btns{
		 margin-left: 300px;
	}
</style>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">결제방식 등록</h1>
		</div>
	</div>
	<form action="/addPayment.do" role="form" method="POST" id="addForm">
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
								<div class="form-group">
									<label>결제방식</label> 
									<input class="form-control" name="payMethod" required="required" />
								</div>
								<div class="form-group">
									<label>수수료</label> 
									<input class="form-control" name="profitPercent" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>%
								</div>
								</div>
						</div>
					</div>
				</div>
				<div class="btns">
				<a class="btn btn-default" href="/viewPaymentList.do">돌아가기</a>
				<input type="button" id="addBtn" class="btn btn-default" value="등록">
			</div>
			</div>
			</div>
			</form>
		</div>
	</body>
</html>
