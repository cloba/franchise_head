<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		ClickCount = 0;
		
		$('#addIngreBtn').click(function(){
			ajaxAction();
			ClickCount++;
			$('#addIngreBtn').attr('disabled',true);
			$('#addBtn').attr('disabled',true);
		});
		
		$('#addBtn').click(function(){
			console.log('클릭');
			console.log('clickCount: '+ClickCount)
			if ($('#menuName').val() == ""){
				alert("메뉴이름을 입력해주세요");
			}else if ($('#menuSellingPrice').val()== ""){
				alert("소비자가격을 입력 해주세요.");
			}else if( ClickCount < 1 ){
				alert("재료를 추가 해주세요.");
			}else{
				$('#addForm').submit();
			} 
		});
	});
	
	var ajaxAction = function(){
		if( $('.ingreName').length < 1 ){
		//	console.log('0번째');
			var order = 0;
		}else{
			var orderTemp = eval($(".ingreName:last").attr('id').replace("ingreName",""));
			var order = orderTemp+1;
		//	console.log(order+'번째');
		}
		
		//입력칸 추가
		$('#addIngreDiv').append('<div> 재료명: <input type="text" id="ingreName'+order+'" class="ingreName form-control" name="hItemCodeArr" required="required" /> 사용량: <input type="text" class="form-control" name="ingreAmountArr" value="0" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style="IME-MODE:disabled;"/> <span id="unit'+order+'"></span></div>');
		
		var id = 'ingreName'+order;
		var unit = 'unit'+order;
		
		$(function() {
			console.log('autocomplete 돌아감!');
			$('#'+id).autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "/searchIngre.do",
						dataType : "json",
						data : {
							ingreName: $('#'+id).val()
						},
						success : function(json) {
							console.log('success 돌아감');
							response($.map(json, function(item){
								//재료에 따른 단위를 표시합니다
								$('#'+unit).text(item.hItemAmountUnit);
								return{
									label : item.hItemName,
									value : item.hItemCode
								};
								
							}));
						},
						error : function(json){
							alert("err" + json);
						}
					});
				},
			});
			$('#'+id).on('autocompletechange change', function(){
				console.log('change!');
				console.log('value: '+this.value);
				
				$.ajax({
					url : "/checkItem.do",
					dataType : "json",
					data : {
						hItemCode: this.value
					},
					success : function(data) {
						console.log('success');
						console.log('result: '+data);
						
						if( data < 1 ){
							$('#IngreHelper').css('color','red');
							$('#'+id).val('');
							$('#addIngreBtn').attr('disabled',true);
						}else{
							$('#'+id).attr("readonly",true);
							$('#IngreHelper').css('color','black');
							$('#addIngreBtn').attr('disabled',false);
							$('#addBtn').attr('disabled',false);
						}
					}
				});
			});
		});   
	}
</script>
<script type="text/javascript" src="/resources/js/comma.js"></script>
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
							<form action="/headAddMenu.do" method="POST" id="addForm">
								<div class="form-group">
									<label>메뉴이름</label> 
									<input class="form-control" name="menuName" id="menuName" value=""  required="required" />
								</div>
								<div class="form-group">
									<label>소비자가격(원)</label> 
									<input class="form-control comma" type="text" name="menuSellingPrice" id="menuSellingPrice" value=""  required="required"  onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;'/>
								</div>
								<div id="addIngreDiv"></div>
								<div id="IngreHelper">재료명을 정확히 입력하세요</div>
								<input type="button" id="addIngreBtn" class="btn btn-default" value="재료추가">
								<input type="button" id="addBtn" class="btn btn-default" value="저장"/>
								<input type="hidden" name="headStaffId" value="${login.headStaffId}">
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
