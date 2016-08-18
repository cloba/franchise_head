<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#joinBtn {
		background: hsl(50, 100%, 97%);
		display: block; height: auto; margin: 0 auto; 
	}
</style>
<script>
$(document).ready(function(){
	$('#modifyRoyaltyPayBtn').click(function(){
		if ($('#royaltyActualAmount').val() == ""){
			alert("실제 지급한 금액을 입력해주세요.");
		}else {
			$('#modifyRoyaltyPayForm').submit();
		}
	});
});		
</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">로열티 지불 기입</h1>
		</div>
	</div>
	
		<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form action="/modifyRoyaltyPay.do" role="form" id="modifyRoyaltyPayForm" method="POST">
								<div class="form-group">
									<label>일련코드</label> 
									<input class="form-control" name="royaltyCode" id="royaltyCode" value="${royalty.royaltyCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>가맹코드</label> 
									<input class="form-control" name="subCode" id="subCode" value="${royalty.subCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>가맹점명</label> 
									<input class="form-control" name="subName" id="subName" value="${royalty.subName}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>계약코드</label> 
									<input class="form-control" name="contractCode" id="contractCode" value="${royalty.contractCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>해당 월</label> 
									<input class="form-control" name="royaltyMonth" id="royaltyMonth" value="${royalty.royaltyMonth}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>로열티 납부 기일</label> 
									<input class="form-control" name="royaltyDeadline" id="royaltyDeadline" value="${royalty.royaltyDeadline}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>납부 여부</label> 
									<input class="form-control" name="royaltyPaid" id="royaltyPaid" value="${royalty.royaltyPaid}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>해당 월 실 판매 금액</label> 
									<input class="form-control" name="subPracticalSellPriceMonth" id="subPracticalSellPriceMonth" value="${royalty.subPracticalSellPriceMonth}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>가맹 이익 금액</label> 
									<input class="form-control" name="subSellProfitMonth" id="subSellProfitMonth" value="${royalty.subSellProfitMonth}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>본사 로얄티</label> 
									<input class="form-control" name="headSellProfitBySubMonth" id="headSellProfitBySubMonth" value="${royalty.headSellProfitBySubMonth}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>실 납부 금액</label> 
									<input class="form-control" name="royaltyActualAmount" id="royaltyActualAmount" value="${royalty.royaltyActualAmount}" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>
								</div>
								<div class="form-group">
									<label>납부한 일자</label>
									<c:if test="${Royalty.royaltyPayActualDate eq null}">미지급</c:if>
									<c:if test="${royalty.royaltyPayActualDate ne null}">						
										<input type="text" name="royaltyPayActualDate" value="${royalty.royaltyPayActualDate}" readonly="readonly">	
									</c:if>
								</div>
								<input type="button" id="modifyRoyaltyPayBtn" class="btn btn-default" value="저장">
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