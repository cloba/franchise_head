<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
		//단위-EX 선택시 수량 입력 불가능
		$('.unit').change(function(){
			var unit = $('.unit:checked').val()
			console.log('unit:'+unit);
			if( unit == 'EX' ){
				console.log('EX선택');
				$('#hItemQuantity').val(1);
				$('#hItemQuantity').attr('readonly',true);
			}else{
				console.log('BOX선택');
				$('#hItemQuantity').attr('readonly',false);
			}
		});
		
		//천단위 마다 콤마 찍기
		$('.comma').blur(function(){
		//	console.log($(this).val());
			var result = inputNumberFormat($(this).val());
			$(this).val(result);
		});
		
		$('.comma').focus(function(){
		//	console.log('focus');
			var result = uncomma($(this).val());
			$(this).val(result);
		});
	});
</script>
<script type="text/javascript" src="/resources/js/comma.js"></script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상품 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					item - <strong>${item.hItemName}</strong>
					<span id="btn">
						<a href="/viewItemDetail.do?hItemCode=${item.hItemCode}">돌아가기</a>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="modifyForm" role="form" action="/headModifyItem.do" method="POST">
								<div class="form-group">
									<label>상품명</label> 
									<input class="form-control" name="hItemName" id="hItemName" value="${item.hItemName}" required="required"/>
								</div>
								<div class="form-group">
									<label>상품코드</label> 
									<input class="form-control" name="hItemCode" id="hItemCode" value="${item.hItemCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>통합코드</label> 
									<input class="form-control" name="inteCode" id="inteCode" value="${item.inteCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<c:if test="${item.hItemUnit eq 'BOX'}">
										<label>단위</label> 
										<input type="radio" class="unit" name="hItemUnit" value="BOX" checked="checked"/> 박스
										<input type="radio" class="unit" name="hItemUnit" value="EX"/> 개별
									</c:if>
									<c:if test="${item.hItemUnit eq 'EX'}">
										<label>단위</label> 
										<input type="radio" class="unit" name="hItemUnit" value="BOX"/> 박스
										<input type="radio" class="unit" name="hItemUnit" value="EX" checked="checked"/> 개별
									</c:if>
								</div>
								<div class="form-group">
									<label>아이템 갯수</label> 
									<input class="form-control" id="hItemQuantity" name="hItemQuantity" value="${item.hItemQuantity}" required="required"/>
								</div>
								<div class="form-group">
									<label>매입가격</label> 
									<input class="form-control comma" name="hItemPurchasePrice" value="<fmt:formatNumber value="${item.hItemPurchasePrice}" pattern="#,###"/>" required="required"/>
								</div>
								<div class="form-group">
									<label>이익률</label> 
									<input class="form-control" name="hItemMarginPercent" value="${item.hItemMarginPercent}" required="required"/>%
								</div>
								<div class="form-group">
									<label>판매가격</label> 
									<input class="form-control comma" name="hItemSellingPrice" value="<fmt:formatNumber value="${item.hItemSellingPrice}" pattern="#,###"/>" required="required"/>
								</div>
								<div class="form-group">
									<label>소비자가격</label> 
									<input class="form-control comma" name="hItemRetailPrice" value="<fmt:formatNumber value="${item.hItemRetailPrice}" pattern="#,###"/>" required="required"/>
								</div>
								<div class="form-group">
									<label>매입처</label> 
									<input class="form-control" name="headClientCode" value="${item.headClientCode}" required="required"/>
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