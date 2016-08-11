<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	
	console.log('길이: '+$('.ingreName').length)
	
	$('#addRecipeBtn').click(function(){
		
		if( $('.ingreName').length < 1 ){
			var orderTemp = 0;
		}else{
			var orderTemp = eval($(".ingreName:last").attr('id').replace("ingreName",""));
			var order = orderTemp+1;
			
		}
		
		$('#addIngreDiv').append('<div> 재료명: <input type="text" id="ingreName'+order+'" class="ingreName" name="hItemCodeArr" required="required" /> 사용량: <input type="text" name="ingreAmountArr" required="required"/> <p id="unit'+order+'"></p></div>');
	});
});
</script>
</head>
<body>
<h1>회원가입</h1>
	<form action="/addHeadStaff" method="POST" id="joinForm">

		<div><label>메뉴이름 : </label><div>${menuCode }</div></div>
	 
		<div><label>조리 순서 </label><div id="recipeAdd"></div></div>
		
		<div>
			<input type="button" id="addRecipeBtn" value="순서 추가"/>
			<input type="submit" value="저장">
		</div>

	</form>

</body>
</html>