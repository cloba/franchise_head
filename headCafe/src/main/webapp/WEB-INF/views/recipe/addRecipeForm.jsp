<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.recipeContent{
	width: 200px;
}
</style>
<script>
$(document).ready(function(){
	
	console.log('길이: '+$('.recipeOrder').length)
	var order = 0;
	var number = 0;
	var orderTemp = 0;
	$('#addRecipeBtn').click(function(){
		/*
		if( $('.recipeOrder').length < 1 ){
			var orderTemp = 0;
			var number = 1;
		}else{ 
			var orderTemp = eval($(".recipeOrder:last").attr('id').replace("recipeOrder",""));
		*/
			order = orderTemp+1;
			number++
			console.log('order:'+order)
	//	}
		$('#recipeAdd').append('<div> 순서: <input type="text" readonly="readonly" id="recipeOrder'+number+'" class="recipeOrder" name="recipeOrderArr" required="required" value="'+number+'" /> 레시피 내용: <input type="text" class="recipeContent" name="recipeActArr" required="required" size="40" maxlength="35"/></div>');
		
	});
});
</script>
</head>
<body>
<h1>레시피 등록</h1>
	<form action="/addRecipe" method="POST" id="joinForm">

		<div>	
			<div><label>메뉴이름: </label>${recipeCommand.menuCode}</div>
		</div>
	 
		<div>
			<label>조리 순서 </label>
			<div id="recipeAdd"></div>
		</div>
		
		<div>
			<input type="button" id="addRecipeBtn" value="순서 추가"/>
			<input type="submit" value="저장">
		</div>
		<div>
			<input type="hidden" name="menuCode" value="${recipeCommand.menuCode}">
		</div>

	</form>

</body>
</html>