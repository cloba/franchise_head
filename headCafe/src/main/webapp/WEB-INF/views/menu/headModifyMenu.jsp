<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
				console.log('order: '+order);
				
			}
			
			$('#addIngreDiv').append('<div> 재료명: <input type="text" id="ingreName'+order+'" class="ingreName" name="hItemCodeArr" required="required" /> 사용량: <input type="text" name="ingreAmountArr" required="required"/> <p id="unit'+order+'"></p></div>');
			
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
<!-- 메뉴를 수정하는 페이지입니다 -->
<h1>메뉴 수정!</h1>
	<form name="addForm" action="/headModifyMenu.do" method="post">
		<!-- 메뉴정보입력 -->
		<div> 
		메뉴이름: <input type="text" name="menuName" id="menuName" value="${menu.menuName }" required="required" /> 
		</div>
		<div> 
		소비자가격: <input type="text" name="menuSellingPrice" value="${menu.menuSellingPrice}" required="required"/> 
		</div>
		<hr/>
		
		<div id="addIngreDiv">
		<!-- 재료정보입력 -->재료정보
		<c:forEach var="ingreList" items="${ingreList}">
			<div> 
			재료이름: <input type="text" id="ingreName0" class="ingreName" name="hItemCodeArr" value="${ingreList.ingreName}" required="required"/> 
			</div>
			<div> 
			사용량: <input type="text" name="ingreAmountArr" value="${ingreList.ingreAmount}" required="required"/> 
			</div>
			<p id="unit0"></p>
		</c:forEach>
		</div>
		
		<input type="button" id="addIngreBtn" value="재료추가"/>
		<input type="submit" value="저장">
	</form>
</body>
</html>