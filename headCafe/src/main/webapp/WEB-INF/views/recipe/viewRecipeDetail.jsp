<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>레시피 디테일</h1>

	<div><label>메뉴이름 : </label>${recipe.menuCode }</div><br/>
	
	<c:forEach var="Recipe" items="${list}">  
		<div class="recipeAct">${Recipe.recipeOrder}  ${Recipe.recipeAct}</div>
		
		
		
	</c:forEach><br/>
	
	
	<div><label>등록날짜</label>${recipe.recipeRegitDate }</div>
	
	<div><label>등록한 직원</label>${recipe.headStaffId}</div>
</body>
</html>