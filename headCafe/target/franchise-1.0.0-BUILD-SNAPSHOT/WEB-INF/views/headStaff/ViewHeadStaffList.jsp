<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
tabel , td, th, tr{
	border: 1px solid;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/headStaffPop.js"></script>
<script>
	$(document).ready(function(){
		/* 오름차/내림차순 정렬 설정 */
		$('#idUp').click(function(){
			console.log('아이디 내림차순 정렬');
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#idDown').click(function(){
			console.log('아이디 오름차순 정렬');
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#nameUp').click(function(){
			console.log('이름 내림차순 정렬');
			$('#criteria').attr('value','head_staff_name');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#nameDown').click(function(){
			console.log('이름 오름차순 정렬');
			$('#criteria').attr('value','head_staff_name');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#levelUp').click(function(){
			console.log('거래처로 내림차순 정렬');
			$('#criteria').attr('value','head_staff_level');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#levelDown').click(function(){
			console.log('거래처로 오름차순 정렬');
			$('#criteria').attr('value','head_staff_level');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#DepUp').click(function(){
			console.log('거래처로 내림차순 정렬');
			$('#criteria').attr('value','head_staff_dep');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#DepDown').click(function(){
			console.log('거래처로 오름차순 정렬');
			$('#criteria').attr('value','head_staff_dep');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#joinUp').click(function(){
			console.log('가입일 오름차순 정렬');
			$('#criteria').attr('value','headStaffJoin');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#joinDown').click(function(){
			console.log('가입일 내림차순 정렬');
			$('#criteria').attr('value','headStaffJoin');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#resignUp').click(function(){
			console.log('퇴사일 오름차순 정렬');
			$('#criteria').attr('value','headStaffResign');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#resignDown').click(function(){
			console.log('퇴사일 내림차순 정렬');
			$('#criteria').attr('value','headStaffResign');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		
	});
</script>
<body>
	<form action="/viewHeadStaffList" id="HeadStaffSearchForm">
		<div> 	
			<!-- 검색조건 보내는 곳 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
			<input type="text" value="${ headStaffSearch.searchHeadStaffKey}"><br/><br/>
			
			<!-- 검색 조건 선택  -->
			<select name="searchHeadStaffKey">    
				<option value="">선택</option>   
				<option value="head_staff_id" <c:if test="${'head_staff_id' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>> 아이디</option>
				<option value="head_staff_name"<c:if test="${'head_staff_name' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>이름</option>
				<option value="head_staff_level" <c:if test="${'head_staff_level' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>직급</option>
				<option value="head_staff_dep" <c:if test="${'head_staff_dep' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>부서</option>
				<option value="head_staff_join" <c:if test="${'head_staff_join' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>등록한아이디</option>
			</select>
			
			<!-- 검색어랑 검색버튼 -->
			<input type="text" name="searchHeadStaffInfo" value="${headStaffSearch.searchHeadStaffInfo}">
			<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
		</div>
	</form>
	
<%-- 	<c:choose> --%>
	<!-- 퇴사자 리스트 보여주는 폼 -->    
<%-- 	<c:when test="${headStaff.resignIdentify == 'Y'"> --%>
	<c:if test="${headStaff.resignIdentify == 'Y' }">
	console.log("퇴사자 리스트 보여주는 폼" );
	<h1>퇴사자 리스트</h1>
		<table>
			<tr>
				<th><span>아이디</span>
					<span id="idUp">▲</span>
					<span id="idDown">▼</span>
				<th><span>이름</span>
					<span id="nameUp">▲</span>
					<span id="nameDown">▼</span>
					
				<th><span>직급(권한)</span>
					<span id="levelUp">▲</span>
					<span id="levelDown">▼</span>
					
				<th><span>부서</span>
					<span id="DepUp">▲</span>
					<span id="DepDown">▼</span>
	
				<th><span>입사일</span>
					<span id="joinUp">▲</span>
					<span id="joinDown">▼</span>
					
				<th><span>퇴사일</span>
					<span id="resignUp">▲</span>
					<span id="resignDown">▼</span>		
			</tr>
			
			<!-- 리스트  데이터 -->
			<c:forEach var="HeadStaff" items="${list}">
				<tr ondblclick="detailPop('${HeadStaff.headStaffId}')">
					<td>${HeadStaff.headStaffId }</td>
					<td><a href = "/headStaffDetail?headStaffId=${HeadStaff.headStaffId}">${HeadStaff.headStaffName }</a></td>
					<td>${HeadStaff.headStaffLevel }</td>
					<td>${HeadStaff.headStaffDep }</td>
					<td>${HeadStaff.headStaffJoin }</td> 
<%-- 					<c:if test="${HeadStaff.resignIdentify == 'Y' }"> --%>
					<td>${HeadStaff.headStaffResign }</td> 
<%-- 					</c:if>  --%>
				</tr>
			</c:forEach>
		</table>
		<div>		
			<a href="/viewHeadStaffList"><input id="modifyHeadStaff" type="button" value="현 직원 조회"></a>
		</div>
	</c:if> 	
	<c:if test="${headStaff.resignIdentify == 'N' }">
	console.log("현 직원 리스트 보여주는 폼" );
	
<%-- 	<c:otherwise> --%>
	<!-- 현 직원 리스트 보여주는 폼 -->
	<h1>본사직원 리스트</h1>
	<div>
		<table>
			<tr>
				<th><span>아이디</span>
					<span id="idUp">▲</span>
					<span id="idDown">▼</span>
				<th><span>이름</span>
					<span id="nameUp">▲</span>
					<span id="nameDown">▼</span>
					
				<th><span>직급(권한)</span>
					<span id="levelUp">▲</span>
					<span id="levelDown">▼</span>
					
				<th><span>부서</span>
					<span id="DepUp">▲</span>
					<span id="DepDown">▼</span>
	
				<th><span>입사일</span>
					<span id="joinUp">▲</span>
					<span id="joinDown">▼</span>
			</tr>
			
			<!-- 리스트 보여주는 화면 -->
			<c:forEach var="HeadStaff" items="${list}">
				<tr ondblclick="detailPop('${HeadStaff.headStaffId}')">
					<td>${HeadStaff.headStaffId }</td>
					<td><a href = "/headStaffDetail?headStaffId=${HeadStaff.headStaffId}">${HeadStaff.headStaffName }</a></td>
					<td>${HeadStaff.headStaffLevel }</td>
					<td>${HeadStaff.headStaffDep }</td>
					<td>${HeadStaff.headStaffJoin }</td> 
					
			<!--  	<c:if test="${HeadStaff.resignIdentify == 'Y' }">
						<td>${HeadStaff.headStaffResign }</td> 
					</c:if>
			-->		
				</tr>
			</c:forEach>
		</table>
		<div>
			<a href="/viewResignStaffList"><input id="modifyHeadStaff" type="button" value="퇴사자 조회"></a>
		</div>
	</div>
	</c:if>
		
<%-- 	</c:choose> --%>
	
	<!-- 직원등록, 메인화면, 퇴사자조회  버튼 -->
	<div>
		<a href="/addHeadStaff"><input type="button" value="직원 등록"></a>
		<a href="/"><input id="modifyHeadStaff" type="button" value="되돌아 가기"></a>
<!-- 		<a href="/addResignStaffList"><input id="modifyHeadStaff" type="button" value="퇴사 등록"></a> -->
	</div>
</body>
</html>