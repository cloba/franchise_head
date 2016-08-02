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
		
		$('#codeUp').click(function(){
			$('#criteria').val('pay_method_code');
			$('#upDown').val('ASC');
			$('#paymentList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('pay_method_code');
			$('#upDown').val('DESC');
			$('#paymentList').submit();
		});
		
		$('#statusUp').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('ASC');
			$('#paymentList').submit();
		});
		$('#statusDown').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('DESC');
			$('#paymentList').submit();
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
<h1>결제방식 리스트</h1>
	<!-- 결제방식 검색 -->
	<form name="paymentList" id="paymentList" action="/viewPaymentList" method="post">
		<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
		<input type="hidden" name="status" value="${search.status}"/>
	
		<select id="searchKey" name="searchKey">
			<option value="">::선택::</option>
			<option value="pay_method_code" <c:if test="${search.searchKey eq 'pay_method_code'}">selected="selected"</c:if>>결제방식 코드</option>
			<option value="pay_method" <c:if test="${search.searchKey eq 'pay_method'}">selected="selected"</c:if>>결제 방식</option>
		</select>
		<input type="text" id="searchItem" name="searchItem" value="${search.searchItem}"/>
		<input type="submit" id="searchBtn" value="검색"/>
	</form>
	
	<br>
	<!-- 적용상태에 따른 a태그 분리 -->
		<c:if test="${search.status == 'Y'}"> 
			<a href="/viewPaymentList?status=N">[미적용 결제방식 보기]</a>
			<a href="/viewPaymentList">[전체 결제방식 보기]</a>
		</c:if>
		<c:if test="${search.status == 'N'}"> 
			<a href="/viewPaymentList?status=Y">[적용중인 결제방식 보기]</a>
			<a href="/viewPaymentList">[전체 결제방식 보기]</a>
		</c:if>
		<c:if test="${search.status == null}">
			<a href="/viewPaymentList?status=N">[미적용 결제방식 보기]</a> 
			<a href="/viewPaymentList?status=Y">[적용중인 결제방식 보기]</a>
		</c:if>	
	
	
	<!-- 조회 결과 -->
	<table border="1">
		<tr>
			<th>
				결제방식 코드
				<span id="codeUp">▲</span>
				<span id="codeDown">▼</span>
			</th>
			<th>결제방식</th>
			<th>수익</th>
		</tr>
		<c:forEach var="list" items="${paymentList}">
			<tr>
				<th><a href="/viewPaymentDetail?payMethodCode=${list.payMethodCode}">${list.payMethodCode}</a></th>
				<th>${list.payMethod}</th>
				<th>${list.profitPercent}%</th>
			</tr>
		</c:forEach>
	</table>
	<a href="/">[신규등록:미구현]</a>
	<a href="/">[홈으로]</a>
</body>
</html>