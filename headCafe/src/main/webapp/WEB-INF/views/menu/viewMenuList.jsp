<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- 검색과 정렬 유효성 검사하는 함수가 있는 js파일 -->
<script type="text/javascript" src="resources/js/validation.js"></script>
<script>

	$(document).ready(function(){
		
		$('#nameUp').click(function(){
			$('#criteria').val('menu_name');
			$('#upDown').val('ASC');
			$('#menuList').submit();
		});
		$('#nameDown').click(function(){
			$('#criteria').val('menu_name');
			$('#upDown').val('DESC');
			$('#menuList').submit();
		});
		
		$('#statusUp').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('ASC');
			$('#menuList').submit();
		});
		$('#statusDown').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('DESC');
			$('#menuList').submit();
		});
		
		
		/* 검색 버튼 눌렀을 때 유효성 검사 */
	/* 	$('#searchBtn').click(function(){
			console.log('버튼클릭');
			searchValid($('#menuList'));
		});
		
		$('#nameUp').click(function(){
			upDown('nameUp',$('#menuList'));
		});
		
		$('#nameDown').click(function(){
			upDown('nameDown',$('#menuList'));
		}); */
		
	});

</script>
<h1>메뉴 리스트</h1>
	<!-- 메뉴 검색 -->
	<form name="menuList" id="menuList" action="/viewMenuList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
		<input type="hidden" name="status" value="${menuSearch.status}"/>
	
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="menu_code" <c:if test="${menuSearch.searchKey eq 'menu_code'}">selected="selected"</c:if>>메뉴코드</option>
			<option value="inte_code" <c:if test="${menuSearch.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품메뉴 통합코드</option>
			<option value="menu_name" <c:if test="${menuSearch.searchKey eq 'menu_name'}">selected="selected"</c:if>>메뉴이름</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${menuSearch.searchItem}"/>
		<input type="submit" id="searchBtn" value="검색"/>
	</form>
	
	<br>
	<!-- 적용상태에 따른 a태그 분리 -->
		<c:if test="${menuSearch.status == 'Y'}"> 
			<a href="/viewMenuList?status=N">[미적용메뉴 보기]</a>
		</c:if>
		<c:if test="${menuSearch.status == 'N'}"> 
			<a href="/viewMenuList?status=Y">[적용메뉴 보기]</a>
		</c:if>
		<c:if test="${menuSearch.status == ''}">
			<a href="/viewMenuList?status=N">[미적용메뉴 보기]</a> 
			<a href="/viewMenuList?status=Y">[적용메뉴 보기]</a>
		</c:if>	
	<a href="/viewMenuList">[전체메뉴 보기]</a>
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				메뉴명
				<span id="nameUp">▲</span>
				<span id="nameDown">▼</span>
			</th>
			<th>메뉴코드</th>
			<th>상품메뉴 통합코드</th>
			<th>
				적용상태
				<span id="statusUp">▲</span>
				<span id="statusDown">▼</span>
			</th>
		</tr>
		
		<c:forEach var="menuList" items="${menuList}">
			<tr>
				<th><a href="/viewMenuDetail?menuCode=${menuList.menuCode}">${menuList.menuName}</a></th>
				<th>${menuList.menuCode}</th>
				<th>${menuList.inteCode}</th>
				<th>${menuList.menuStatus}</th>
			</tr>
		</c:forEach>
	</table>
	<a href="/headAddMenu">[신규등록]</a>
	<a href="/">[홈으로]</a>
</body>
</html>