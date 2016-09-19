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
			action();
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
	
	//재료 추가 버튼 클릭시 실행되는 함수입니다
	//재료명과 사용량 입력칸이 추가됩니다
	var action = function(){
		//재료명을 입력하는 칸은 재료추가 버튼을 누를 때 마다 늘어납니다. 
		//네이밍 규칙은 ingreName0, ingreName1.. 입니다
		//재료명 입력칸이 없으면 order에 0을 담습니다
		if( $('.ingreName').length < 1 ){
			var order = 0;
		//재료명 입력칸이 있으면 기존 order에 1을 더합 값을 담습니다
		}else{
			var orderTemp = eval($(".ingreName:last").attr('id').replace("ingreName",""));
			var order = orderTemp+1;
		}
		
		//재료명, 사용량 입력칸과 재료에 따른 단위를 추가 합니다
		$('#addIngreDiv').append('<div class="form-group"> <label>재료명<label> &nbsp;<input type="text" id="ingreName'+order+'" class="ingreName form-control" '+
								'name="hItemCodeArr" required="required" /> </div> <div class="form-group"> <label>사용량<label> &nbsp;<input type="text" class="form-control" '+
								'name="ingreAmountArr" value="0" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style="IME-MODE:disabled;"/>'+
								'</div> <div class="form-group"><label>단위</label> &nbsp;&nbsp;&nbsp;<span id="unit'+order+'"></span></div>');
		
		//위에서 만든 order를 이용하여 바로 전에 생성 된 입력칸과 단위에 아이디를 부여합니다
		var id = 'ingreName'+order;
		var unit = 'unit'+order;
		
		//입력한 값을 바탕으로 추천재료를 보여주는 함수입니다
		$(function() {
			$('#'+id).autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "/searchIngre.do",	//DB의 재료테이블에서 ingreName과 일치하는 row를 가져오는 controller입니다
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
			
			//재료명 입력칸에 추천검색어가 아닌 값을 사용자가 직접 입력했을 경우를 대비한 유효성 검사입니다
			$('#'+id).on('autocompletechange change', function(){	//
				
				$.ajax({
					url : "/searchItemForMenu.do",	//ingreName에 입력된 값을 DB의 재료테이블의 값과 비교하여 그 수를 가져옵니다
					dataType : "json",
					data : {
						hItemCode: this.value
					},
					success : function(data) {
						console.log('success');
						console.log('result!: '+data);
						
						if( data < 1 ){		//입력한 값이 재료테이블에 있는 값과 일치하지 않을 경우 경고메세지를 보여주고 버튼을 비활성화 합니다
							$('#IngreHelper').css('color','red');
							$('#'+id).val('');
							$('#addIngreBtn').attr('disabled',true);
						}else{				//입력한 값이 재료테이블에 있는 값과 일치할 경우 수정을 불가능하게 합니다
							$('#'+id).attr("readonly",true);
							$('#IngreHelper').css('color','black');
							$('#addIngreBtn').attr('disabled',false);
							$('#addBtn').attr('disabled',false);
						}
					},
					error : function(json){
						console.log("err" + json);
					}
				});
			});
		});   
	}
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
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
								<div id="IngreHelper">재료명을 정확하게 입력하세요</div>
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
