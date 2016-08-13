<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script>

$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	$('#recipeCodeUp').click(function(){
		console.log('레시피코드 내림차순 정렬');
		$('#criteria').attr('value','recipe_code');
		$('#upDown').attr('value','DESC');
		$('#RecipeForm').submit();
	});
	$('#recipeCodeDown').click(function(){
		console.log('레시피코드 오름차순 정렬');
		$('#criteria').attr('value','recipe_code');
		$('#upDown').attr('value','ASC');
		$('#RecipeForm').submit();
	});
	$('#menuNameUp').click(function(){
		console.log('메뉴 재료 내림차순 정렬');
		$('#criteria').attr('value','menu_name');
		$('#upDown').attr('value','DESC');
		$('#RecipeForm').submit();
	});
	$('#menuNameDown').click(function(){
		console.log('메뉴 재료 오름차순 정렬');
		$('#criteria').attr('value','menu_name');
		$('#upDown').attr('value','ASC');
		$('#RecipeForm').submit();
	});
	$('#ingreNameUp').click(function(){
		console.log('재료명 내림차순 정렬');
		$('#criteria').attr('value','ingre_name');
		$('#upDown').attr('value','DESC');
		$('#RecipeForm').submit();
	});
	$('#ingreNameDown').click(function(){
		console.log('재료 명 오름차순 정렬');
		$('#criteria').attr('value','ingre_name');
		$('#upDown').attr('value','ASC');
		$('#RecipeForm').submit();
	});
	$('#ingreStatusUp').click(function(){
		console.log('적용상태 별 내림차순 정렬');
		$('#criteria').attr('value','ingre_status');
		$('#upDown').attr('value','DESC');
		$('#RecipeForm').submit();
	});
	$('#ingreStatusDown').click(function(){
		console.log('적용상태 별 오름차순 정렬');
		$('#criteria').attr('value','ingre_status');
		$('#upDown').attr('value','ASC');
		$('#RecipeForm').submit();
	});

	
});	
	
</script>
<body>
<h1>레시피 리스트</h1>
<form id="RecipeForm" action="/viewRecipeList.do" >
	<div> 	
		<!-- 검색조건 보내는 곳 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<input type="text" value="${search.searchKey}"><br/><br/>
		
		
		
		<!-- 검색 조건 선택  -->
		<select name="searchKey">    
			<option value="">선택</option>   
			<option value="recipe_code" <c:if test="${'recipe_code' eq search.searchKey }">selected="selected"</c:if>>레시피 코드</option>
			<option value="menu_name"<c:if test="${'menu_name' eq search.searchKey }">selected="selected"</c:if>>메뉴 이름</option>
			<option value="ingre_name" <c:if test="${'ingre_name' eq search.searchKey }">selected="selected"</c:if>>재료 이름</option>
			<option value="ingre_status" <c:if test="${'ingre_status' eq search.searchKey }">selected="selected"</c:if>>현재적용상태</option>
		</select>
		
		<!-- 검색어랑 검색버튼 -->
		<input type="text" name="searchItem" value="${search.searchItem}">
		<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
	</div>



</form>
	<div>
		<label>레시피 코드
			<span id="recipeCodeUp">▲</span>
			<span id="recipeCodeDown">▼</span></label>
		<label>메뉴 이름
			<span id="menuNameUp">▲</span>
			<span id="menuNameDown">▼</span></label>
		<label>재료 이름
			<span id="ingreNameUp">▲</span>
			<span id="ingreNameDown">▼</span></label>
		<label>현재적용상태
			<span id="ingreStatusUp">▲</span>
			<span id="ingreStatusDown">▼</span></label>	
	</div>
	
	
		<c:forEach var="Recipe" items="${list }">
			<div>
				<label>${Recipe.recipeCode}</label>
				<label>${Recipe.menuName }</label>
				<label><a href="/viewRecipeDetail.do?recipeCode=${Recipe.recipeCode}" >${Recipe.ingreName}</a></label>
				<label>${Recipe.ingreStatus}</label>
			</div>
		</c:forEach>
	


</body>
</html>