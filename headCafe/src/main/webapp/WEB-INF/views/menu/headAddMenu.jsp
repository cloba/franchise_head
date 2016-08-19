<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
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
		console.log('길이: '+$('.ingreName').length)
		
		$('#addIngreBtn').click(function(){
			
			if( $('.ingreName').length < 1 ){
				var orderTemp = 0;
			}else{
				var orderTemp = eval($(".ingreName:last").attr('id').replace("ingreName",""));
				var order = orderTemp+1;
				
			}
			
			$('#addIngreDiv').append('<div> 재료명: <input type="text" id="ingreName'+order+'" class="ingreName form-control" name="hItemCodeArr" required="required" /> 사용량: <input type="text" class="form-control" name="ingreAmountArr" required="required"/> <span id="unit'+order+'"></span></div>');
			
			var id = 'ingreName'+order;
			var unit = 'unit'+order;
			
			$(function() {
				$('#'+id).autocomplete({
					source : function(request, response) {
						$.ajax({
							url : "/searchIngre.do",
							dataType : "json",
							data : {
								ingreName: $('#'+id).val()
							},
							success : function(json) {
								console.log('성공');
								response($.map(json, function(data){
									
									//재료에 따른 단위를 표시합니다
									$('#'+unit).text(data.hItemAmountUnit);
									return{
										label : data.hItemName,
										value : data.hItemCode
									};
								}));
							},
							error : function(json){
								alert("err" + json);
							}
						});
					},
				});
			});   
		});
	});
</script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">메뉴등록</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form action="/headAddMenu.do" role="form" method="POST" id="addForm">
								<div class="form-group">
									<label>메뉴이름</label> 
									<input class="form-control" name="menuName" id="menuName" value=""  required="required" />
								</div>
								<div class="form-group">
									<label>소비자가격</label> 
									<input class="form-control" name="menuSellingPrice" id="menuSellingPrice" value=""  required="required" />
								</div>
								<div id="addIngreDiv"></div>
								<input type="button" id="addIngreBtn" class="btn btn-default" value="재료추가">
								<input type="submit" class="btn btn-default" value="저장"/>
							</form>
						</div>
					</div>
				</div>
			</div>
			<a href="/viewMenuList.do">돌아가기</a>
		</div>
	</div>
</div>

</body>
</html>
