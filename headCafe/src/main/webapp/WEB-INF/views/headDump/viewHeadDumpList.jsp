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
	$('#headDumpCodeUp').click(function(){
		$('#criteria').attr('value','head_dump_code');
		$('#upDown').attr('value','DESC');
		$('#headDumpForm').submit();
	});
	$('#headDumpCodeDown').click(function(){
		$('#criteria').attr('value','head_dump_code');
		$('#upDown').attr('value','ASC');
		$('#headDumpForm').submit();
	});//
	$('#hItemCodeUp').click(function(){
		$('#criteria').attr('value','h_item_code');
		$('#upDown').attr('value','DESC');
		$('#headDumpForm').submit();
	});
	$('#hItemCodeDown').click(function(){
		$('#criteria').attr('value','h_item_code');
		$('#upDown').attr('value','ASC');
		$('#headDumpForm').submit();
	});//
	$('#specificItemCodeUp').click(function(){
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','DESC');
		$('#headDumpForm').submit();
	});
	$('#specificItemCodeDown').click(function(){
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','ASC');
		$('#headDumpForm').submit();
	});//
	$('#headStaffIdUp').click(function(){
		$('#criteria').attr('value','head_staff_id');
		$('#upDown').attr('value','DESC');
		$('#headDumpForm').submit();
	});
	$('#headStaffIdDown').click(function(){
		$('#criteria').attr('value','head_staff_id');
		$('#upDown').attr('value','ASC');
		$('#headDumpForm').submit();
	});
	$('#headDumpDateUp').click(function(){
		$('#criteria').attr('value','head_dump_date');
		$('#upDown').attr('value','DESC');
		$('#headDumpForm').submit();
	});
	$('#headDumpDateDown').click(function(){
		$('#criteria').attr('value','head_dump_date');
		$('#upDown').attr('value','ASC');
		$('#headDumpForm').submit();
	});

});	
	
</script>
<body>
<h1>판매 불가 상품 리스트</h1>

<form id="headDumpForm" action="/viewHeadDumpList" >
	<div> 	
		<!-- 검색조건 보내는 곳 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
		
		<input type="text" value="${search.searchKey}"><br/><br/>
		
		
		
		<!-- 검색 조건 선택  -->
		<select name="searchKey">    
			<option value="">선택</option>   
			<option value="head_dump_code" <c:if test="${'head_dump_code' eq search.searchKey }">selected="selected"</c:if>>판매불가 상품코드</option>
			<option value="h_item_code"<c:if test="${'h_item_code' eq search.searchKey }">selected="selected"</c:if>>상품코드</option>
			<option value="specific_item_code" <c:if test="${'specific_item_code' eq search.searchKey }">selected="selected"</c:if>>개별상품 코드</option>
			<option value="head_staff_id" <c:if test="${'head_staff_id' eq search.searchKey }">selected="selected"</c:if>>본사 직원 아이디</option>
			<option value="head_dump_date" <c:if test="${'head_dump_date' eq search.searchKey }">selected="selected"</c:if>>폐기 일자</option>
		</select>
		
		<!-- 검색어랑 검색버튼 -->
		<input type="text" name="searchItem" value="${search.searchItem}">
		<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
	</div>
</form>

	<!-- 판매 불가 상품 컬럼  -->
	<div>  
		<label>판매불가 상품코드
			<span id="headDumpCodeUp">▲</span>
			<span id="headDumpCodeDown">▼/</span></label>	
		<label>상품코드
			<span id="hItemCodeUp">▲</span>
			<span id="hItemCodeDown">▼/</span></label>				
		<label>개별상품 코드/
			<span id="specificItemCodeUp">▲</span>
			<span id="specificItemCodeDown">▼</span></label>	
		<label>폐기 사유/
			<span id="headDumpReasonUp"></span>
			<span id="headDumpReasonDown"></span></label>		
		<label>폐기 일자/
			<span id="headDumpDateUp">▲</span>
			<span id="headDumpDateDown">▼</span></label>		
		<label>본사 직원 아이디/
			<span id="headStaffIdUp">▲</span>
			<span id="headStaffIdDown">▼</span></label>	
	</div>

	
		<!-- 판매 불가 상품 실제 보여주는 정보 -->
		<c:forEach var="headDump" items="${headDumpList}">
			<div>
				<label>${headDump.headDumpCode}																						</label>
				<label><a href="/viewHeadDumpDetail?headDumpCode=${headDump.headDumpCode}">${headDump.hItemCode}</a>				</label>
			    <label>${headDump.specificItemCode}																					</label>	
			    <label>${headDump.headDumpReason}																					</label>																	x
				<label>${headDump.headDumpDate}																						</label>
				<label>${headDump.headStaffId}	                                                                                    </label>
				
			</div>
		</c:forEach>

	<a href="/addHeadDump">[판매불가 상품 등록]</a>
</body>
</html>