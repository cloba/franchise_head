<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	
$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	$('#royaltyOvrdueCodeUp').click(function(){
		console.log('로열티 지급예정 코드 내림차순 정렬');
		$('#criteria').attr('value','royalty_overdue_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyOverdueForm').submit();
	});
	$('#royaltyOvrdueCodeDown').click(function(){
		console.log('로열티 지급예정 코드 오름차순 정렬');
		$('#criteria').attr('value','royalty_overdue_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyOverdueForm').submit();
	});
	$('#royaltyOverdueStatusUp').click(function(){
		console.log('계약코드 내림차순 정렬');
		$('#criteria').attr('value','royalty_overdue_status');
		$('#upDown').attr('value','DESC');
		$('#royaltyOverdueForm').submit();
	});
	$('#royaltyOverdueStatusDown').click(function(){
		console.log('계약코드 오름차순 정렬');
		$('#criteria').attr('value','royalty_overdue_status');
		$('#upDown').attr('value','ASC');
		$('#royaltyOverdueForm').submit();
	});
	$('#royaltyOverduePayDateUp').click(function(){
		console.log('해당 월 내림차순 정렬');
		$('#criteria').attr('value','royalty_overdue_pay_date');
		$('#upDown').attr('value','DESC');
		$('#royaltyOverdueForm').submit();
	});
	$('#royaltyOverduePayDateDown').click(function(){
		console.log('해당 월 오름차순 정렬');
		$('#criteria').attr('value','royalty_overdue_pay_date');
		$('#upDown').attr('value','ASC');
		$('#royaltyOverdueForm').submit();
	});
	$('#subNameUp').click(function(){
		console.log('해당 월 내림차순 정렬');
		$('#criteria').attr('value','sub_name');
		$('#upDown').attr('value','DESC');
		$('#royaltyOverdueForm').submit();
	});
	$('#subNameDown').click(function(){
		console.log('해당 월 오름차순 정렬');
		$('#criteria').attr('value','sub_name');
		$('#upDown').attr('value','ASC');
		$('#royaltyOverdueForm').submit();
	});

});	
	
</script>
<body>
<h1>전 가맹 로얄티  리스트</h1>

<form id="royaltyOverdueForm" action="/viewRoyaltyOverdueList" >
	<div> 	
		<!-- 검색조건 보내는 곳 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<input type="text" value="${search.searchKey}"><br/><br/>
		
		
		
		<!-- 검색 조건 선택  -->
		<select name="searchKey">    
			<option value="">선택</option>   
			<option value="royalty_overdue_code" <c:if test="${'royalty_overdue_code' eq search.searchKey }">selected="selected"</c:if>>로열티 지급예정 코드</option>
			<option value="royalty_overdue_status"<c:if test="${'royalty_overdue_status' eq search.searchKey }">selected="selected"</c:if>>지불 상태</option>
			<option value="royalty_overdue_pay_date" <c:if test="${'royalty_overdue_pay_date' eq search.searchKey }">selected="selected"</c:if>>납부 일자</option>
			<option value="sub_name" <c:if test="${'sub_name' eq search.searchKey }">selected="selected"</c:if>>점포 명</option>
		</select>
		
		<!-- 검색어랑 검색버튼 -->
		<input type="text" name="searchItem" value="${search.searchItem}">
		<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
	</div>
</form>

	<!-- 로얄티 상단 메뉴 -->
	<div>  
		<label>로열티 지급예정 코드
			<span id="royaltyOvrdueCodeUp">▲</span>
			<span id="royaltyOvrdueCodeDown">▼/</span></label>	
		<label>점포 명
			<span id="subNameUp">▲</span>
			<span id="subNameDown">▼/</span></label>				
		<label>지불 상태/
			<span id="royaltyOverdueStatusUp">▲</span>
			<span id="royaltyOverdueStatusDown">▼</span></label>	
		<label>월 원금/
			<span id="royaltyTotalOverduePayUp"></span>
			<span id="royaltyTotalOverduePayDown"></span></label>		
		<label>납부 금액/
			<span id="royaltyOverduePaidUp"></span>
			<span id="royaltyOverduePaidDown"></span></label>	
		<label>납부 일자/
			<span id="royaltyOverduePayDateUp">▲</span>
			<span id="royaltyOverduePayDateDown">▼</span></label>	
		<label>남은 금액
			<span id="royaltyOverdueRestUp"></span>
			<span id="royaltyOverdueRestDown"></span></label>	
	</div>

	
		<!-- 로얄티 실제 보여주는 정보 -->
		<c:forEach var="royaltyOverdue" items="${royaltyOverduelist}">
			<div>
				<label>${royaltyOverdue.royaltyOverdueCode}																						</label>
				<label><a href="/viewRoyaltyOverdueDetail?royaltyOvrdueCode=${royaltyOverdue.royaltyOverdueCode}">${royaltyOverdue.subName}</a>	</label>
			    <label>${royaltyOverdue.royaltyOverdueStatus}																					</label> 
				<label>${royaltyOverdue.royaltyTotalOverduePay}																					</label>
				<label>${royaltyOverdue.royaltyOverduePaid}																						</label>
				<label>
					<c:if test="${royaltyOverdue.royaltyOverduePayDate eq null}">미납										</c:if>
					<c:if test="${royaltyOverdue.royaltyOverduePayDate ne null}">${royaltyOverdue.royaltyOverduePayDate}</c:if>					</label>
				<label>${royaltyOverdue.royaltyOverdueRest}																						</label>
			</div>
		</c:forEach>


</body>
</html>