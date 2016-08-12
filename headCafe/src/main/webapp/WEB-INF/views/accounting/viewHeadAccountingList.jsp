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
	
	// 본사 통합회계 전표번호 내림차순 정렬
	$('#headAccountCodeUp').click(function(){
		console.log('본사 통합회계 전표번호내림차순 정렬');
		$('#criteria').attr('value','head_account_code');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	// 본사 통합회계 전표번호 오름순 정렬
	$('#headAccountCodeDown').click(function(){
		console.log('본사 통합회계 전표번호 오름차순 정렬');
		$('#criteria').attr('value','head_account_code');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
	// 계정과목 내림차순 정렬
	$('#subjectCodeUp').click(function(){
		console.log('계정과목 코드 내림차순 정렬');
		$('#criteria').attr('value','subject_code');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	// 계정과목 오름차순 정렬
	$('#subjectCodeDown').click(function(){
		console.log('계정과목 코드 오름차순 정렬');
		$('#criteria').attr('value','subject_code');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
	// 본사 거래처 내림차순 정렬
	$('#headClientCodeUp').click(function(){
		console.log('본사 거래처 내림차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	// 본사 거래처 오름차순 정렬
	$('#headClientCodeDown').click(function(){
		console.log('본사 거래처 오름차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
	// 출금/입금 내림차순 정렬
	$('#headAccountFlowUp').click(function(){
		console.log('출금/입금 내림차순 정렬');
		$('#criteria').attr('value','head_account_flow');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	// 출금/입금 오름차순 정렬
	$('#headAccountFlowDown').click(function(){
		console.log('출금/입금 오름차순 정렬');
		$('#criteria').attr('value','head_account_flow');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
	// 통합 출/입금 관련 그룹코드 내림차순 정렬
	$('#headAccountGroupCodeUp').click(function(){
		console.log('통합 출/입금 관련 그룹 코드 내림차순 정렬');
		$('#criteria').attr('value','head_account_group_code');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	// 통합 출/입금 관련 그룹코드 오름차순 정렬
	$('#headAccountGroupCodeDown').click(function(){
		console.log('통합 출/입금 관련 그룹 코드 오름차순 정렬');
		$('#criteria').attr('value','head_account_group_code');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
	// 테이블명 내림차순 정렬
	$('#headAccountTableUp').click(function(){
		console.log('해당 테이블명 내림차순 정렬');
		$('#criteria').attr('value','head_account_table');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	// 테이블명 오름차순 정렬
	$('#headAccountTableDown').click(function(){
		console.log('해당 테이블명 오름차순 정렬');
		$('#criteria').attr('value','head_account_table');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
	// 합계 내림차순정렬
	$('#headAccountSumUp').click(function(){
		console.log('합계 내림차순 정렬');
		$('#criteria').attr('value','head_account_sum');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	// 합계 오름차순정렬
	$('#headAccountSumDown').click(function(){
		console.log('합계 오름차순 정렬');
		$('#criteria').attr('value','head_account_sum');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
 	// 직원요청일자  오름/내림 차순
	$('#headAccountRequestDateUp').click(function(){
		console.log('직원 요청일자 내림차순 정렬');
		$('#criteria').attr('value','head_account_request_date');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	$('#headAccountRequestDateDown').click(function(){
		console.log('직원 요청일자 오름차순 정렬');
		$('#criteria').attr('value','head_account_request_date');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	}); 
	
	
	/*   요청 직원 아이디 오름/내림차순
	$('#headStaffIdRequestUp').click(function(){
		console.log('요청 직원 아이디 내림차순 정렬');
		$('#criteria').attr('value','head_staff_id_request');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	$('#headStaffIdRequestDown').click(function(){
		console.log('요청 직원 아이디 오름차순 정렬');
		$('#criteria').attr('value','head_staff_id_request');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	*/
	
	/* 상세내역 오름/내림차순
	$('#headAccountDetailUp').click(function(){
		console.log('상세내역 내림차순 정렬');
		$('#criteria').attr('value','head_account_detail');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	$('#headAccountDetailDown').click(function(){
		console.log('상세내역 오름차순 정렬');
		$('#criteria').attr('value','head_account_detail');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	
	*/
	$('#requestCheckDateUp').click(function(){
		console.log('직원요청 확인일자 내림차순 정렬');
		$('#criteria').attr('value','request_check_date');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	
	$('#requestCheckDateDown').click(function(){
		console.log('직원요청 확인일자 오름차순 정렬');
		$('#criteria').attr('value','request_check_date');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	/*  확인직원 아이디 오름/내림차순 
	$('#headStaffIdConfirmUp').click(function(){
		console.log('확인 직원 아이디 내림차순 정렬');
		$('#criteria').attr('value','head_staff_id_confirm');
		$('#upDown').attr('value','DESC');
		$('#HeadAccountingForm').submit();
	});
	$('#headStaffIdConfirmDown').click(function(){
		console.log('확인 직원 아이디 오름차순 정렬');
		$('#criteria').attr('value','head_staff_id_confirm');
		$('#upDown').attr('value','ASC');
		$('#HeadAccountingForm').submit();
	});
	*/
	
	
});	
	
</script>
</head>
<body>
<h1>통합회계리스트</h1>
<form action="/viewHeadAccountingList" id="HeadAccountingForm">
		<div> 	
			<!-- 검색조건 보내는 곳 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
			<input type="text" value="${search.searchKey}"><br/><br/>
			
			<!-- 검색 조건 선택  -->
			<select name="searchKey">    
				<option value="">선택</option>   
				<option value="head_account_code" <c:if test="${'head_account_code' eq search.searchKey }">selected="selected"</c:if>>본사 통합회계 전표번호</option>
				<option value="subject_code"<c:if test="${'subject_code' eq search.searchKey }">selected="selected"</c:if>>계정과목 코드</option>
				<option value="head_client_code" <c:if test="${'head_client_code' eq search.searchKey }">selected="selected"</c:if>>본사 거래처</option>
				<option value="head_account_flow" <c:if test="${'head_account_flow' eq search.searchKey }">selected="selected"</c:if>>출금/입금</option>
				<option value="head_account_group_code" <c:if test="${'head_account_group_code' eq search.searchKey }">selected="selected"</c:if>>통합 출/입금 관련 그룹 코드</option>
				<option value="head_account_table" <c:if test="${'head_account_table' eq search.searchKey }">selected="selected"</c:if>>해당 테이블명</option>
				<option value="head_account_sum" <c:if test="${'head_account_sum' eq search.searchKey }">selected="selected"</c:if>>합계</option>
				<option value="head_account_request_date" <c:if test="${'head_account_request_date' eq search.searchKey }">selected="selected"</c:if>>직원 요청일자</option>
				<option value="head_staff_id_request" <c:if test="${'head_staff_id_request' eq search.searchKey }">selected="selected"</c:if>>요청 직원 아이디</option>
				<option value="head_account_detail" <c:if test="${'head_account_detail' eq search.searchKey }">selected="selected"</c:if>>상세내역</option>
				<option value="request_check_date" <c:if test="${'request_check_date' eq search.searchKey }">selected="selected"</c:if>>직원요청 확인일자</option>
				<option value="head_staff_id_confirm" <c:if test="${'head_staff_id_confirm' eq search.searchKey }">selected="selected"</c:if>>확인 직원 아이디</option>	
			</select>
			
			<!-- 검색어랑 검색버튼 -->
			<input type="text" name="searchItem" value="${search.searchItem}">
			<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
		</div>
	</form>


<div style="overflow:scroll; width:1300px; height:550px; padding:10px;">	
	<div>
		<label>본사 통합회계 전표번호
			<span id="headAccountCodeUp">▲</span>
			<span id="headAccountCodeDown">▼</span></label>
		<label>계정과목 코드
			<span id="subjectCodeUp">▲</span>
			<span id="subjectCodeDown">▼</span></label>
		<label>본사 거래처
			<span id="headClientCodeUp">▲</span>
			<span id="headClientCodeDown">▼</span></label>
		<label>출금/입금
			<span id="headAccountFlowUp">▲</span>
			<span id="headAccountFlowDown">▼</span></label>	
		<label>>통합 출/입금 관련 그룹 코드
			<span id="headAccountGroupCodeUp">▲</span>
			<span id="headAccountGroupCodeDown">▼</span></label>
		<label>해당 테이블명
			<span id="headAccountTableUp">▲</span>
			<span id="headAccountTableDown">▼</span></label>
		<label>합계
			<span id="headAccountSumUp">▲</span>
			<span id="headAccountSumDown">▼</span></label>
		<label>직원 요청일자
			<span id="headAccountRequestDateUp">▲</span>
			<span id="headAccountRequestDateDown">▼</span></label>
		<label>요청 직원 아이디
			<span id="headStaffIdRequestUp"></span>
			<span id="headStaffIdRequestDown"></span></label>
		<label>상세내역
			<span id="headAccountDetailUp"></span>
			<span id="headAccountDetailDown"></span></label>
		<label>직원요청 확인일자
			<span id="requestCheckDateUp">▲</span>
			<span id="requestCheckDateDown">▼</span></label>	
		<label>확인 직원 아이디
			<span id="headStaffIdConfirmUp"></span>
			<span id="headStaffIdConfirmDown"></span></label>							
	</div>
	

	

 	<c:forEach var="Accounting" items="${list}">
	 	<div>
		 	<label>${Accounting.headAccountCode }</label>
		 	<label><a href="viewHeadClientDetail?headClientCode=${ Client.headClientCode}">${Client.subjectCode }</a></label>
		 	<label>${Accounting.headClientCode }</label>
		 	<label>${Accounting.headAccountFlow }</label>
		 	<label>${Accounting.headAccountGroupCode }</label>
		 	<label>${Accounting.headAccountTable }</label>
		 	<label>${Accounting.headAccountSum }</label>
		 	<label>${Accounting.headAccountRequestDate }</label>
		 	<label>${Accounting.headStaffIdRequest }</label>
		 	<label>${Accounting.headAccountDetail }</label>
		 	<label>${Accounting.headStaffIdConfirm }</label> 	
	 	</div>
	 </c:forEach>
</div>	 
</body>
</html>