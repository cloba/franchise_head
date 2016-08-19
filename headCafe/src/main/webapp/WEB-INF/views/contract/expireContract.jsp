<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.btns{
		 margin-left: 300px;
	}
</style>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">계약파기</h1>
		</div>
	</div>
	<form action="/expireContract.do" role="form" method="POST">
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
								<div class="form-group">
									<strong>계약번호: ${code}</strong> 
									<input type="hidden" name="contractCode" value="${code}"/>
								</div>
								<div class="form-group">
									<label>파기일</label> 
									<input class="form-control" type="date" name="contractExpiredDate" required="required" />
								</div>
								<div class="form-group">
									<label>사유</label> 
									<textarea class="form-control" name="contractExpireContent" rows="10" cols="30"></textarea>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<a class="btn btn-default" href="/viewContractDetail.do?contractCode=${code}">돌아가기</a>
				<input type="button" id="addBtn" class="btn btn-default" value="등록">
			</div>
			</form>
		</div>
	</body>
</html>