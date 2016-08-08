<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
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
			
			$('#addIngreDiv').append('<div> 재료명: <input type="text" id="ingreName'+order+'" class="ingreName" name="hItemCodeArr" required="required" /> 사용량: <input type="text" name="ingreAmountArr" required="required"/> <p id="unit'+order+'"></p></div>');
			
			var id = 'ingreName'+order;
			var unit = 'unit'+order;
			
			$(function() {
				$('#'+id).autocomplete({
					source : function(request, response) {
						$.ajax({
							url : "/searchIngre",
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
<!-- menu에 메뉴를 등록하는 페이지입니다 -->
<h1>메뉴 등록</h1>
	<form name="addForm" action="/headAddMenu" method="post">
		<!-- menu 정보입력 -->
		<div> 
		메뉴이름: <input type="text" name="menuName" id="menuName" required="required" /> 
		</div>
		<!-- <div> 
		재료구입가: <input type="text" name="menuIngrePrice" required="required"/> 
		</div> -->
		<div> 
		소비자가격: <input type="text" name="menuSellingPrice" required="required"/> 
		</div>
		
		<div id="addIngreDiv"></div>
		<input type="button" id="addIngreBtn" value="재료추가"/>
		<input type="submit" value="저장">
	</form>
</body>
</html>