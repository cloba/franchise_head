<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
		//단위-EX 선택시 수량 입력 불가능
		$('.unit').change(function(){
			var unit = $('.unit:checked').val()
			if( unit == 'EX' ){
			//	console.log('EX선택');
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
		
		//test용 form submit
		$('#addBtn').click(function(){
			console.log('클릭')
			$('#addForm').submit();
		});
		
		
	});
</script>
 <script type="text/javascript" src="/resources/js/comma.js"></script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">신규 상품 등록</h1>
		</div>
	</div>
	<form action="/headAddItem.do" role="form" method="POST" id="addForm">
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
								<div class="form-group">
									<label>상품명</label> 
									<input class="form-control" name="hItemName" id="hItemName" required="required" />
								</div>
								<div class="form-group">
									<label>단위</label> 
									<div>
										<input type="radio" class="unit" name="hItemUnit" id="unitBox" value="BOX" required="required"/> 박스
										<input type="radio" class="unit" name="hItemUnit" id="unitEx" value="EX"/> 개별
									</div>
								</div>
								<div class="form-group">
									<label>수량</label> 
									<input class="form-control" name="hItemQuantity" id="hItemQuantity" required="required" />
								</div>
								<div class="form-group">
									<label>매입가</label> 
									<input class="form-control comma" name="hItemPurchasePrice" id="hItemPurchasePrice" required="required" />
								</div>
								<div class="form-group">
									<label>이익율</label> 
									<div class="margin">
										<input id="percent" type="text" class="form-control" name="hItemMarginPercent" id="hItemMarginPercent" required="required" />
										<span>%</span>
									</div>
								</div>
								<div class="form-group">
									<label>소비자금액</label> 
									<input class="form-control comma" name="hItemRetailPrice" id="hItemRetailPrice" required="required" />
								</div>
								<div class="form-group">
									<label>매입처</label> 
									<input class="form-control" name="headClientCode" id="headClientCode" required="required" />
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<a class="btn btn-default" href="/viewItemList.do">돌아가기</a>
				<input type="button" id="addBtn" class="btn btn-default" value="등록">
			</div>
			</form>
		</div>
		
	</body>
</html>