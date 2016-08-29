<!-- 회계 리스트 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.nav nav-tabs:HOVER {
	}
	.form-control, .form-group {
		width: 250px;
		height: 31px;
		display: inline;
	}
	p {
		text-align: center;
	}
	
</style>
<script>
$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	
	// 본사 통합회계 전표번호 내림차순 정렬
	$('#headAccountCodeUp').click(function(){
		console.log('본사 통합회계 전표번호내림차순 정렬');
		$('#criteria').attr('value','head_account_code');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	// 본사 통합회계 전표번호 오름순 정렬
	$('#headAccountCodeDown').click(function(){
		console.log('본사 통합회계 전표번호 오름차순 정렬');
		$('#criteria').attr('value','head_account_code');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
	// 계정과목 내림차순 정렬
	$('#subjectCodeUp').click(function(){
		console.log('계정과목 코드 내림차순 정렬');
		$('#criteria').attr('value','subject_code');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	// 계정과목 오름차순 정렬
	$('#subjectCodeDown').click(function(){
		console.log('계정과목 코드 오름차순 정렬');
		$('#criteria').attr('value','subject_code');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
	// 본사 거래처 내림차순 정렬
	$('#headClientCodeUp').click(function(){
		console.log('본사 거래처 내림차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	// 본사 거래처 오름차순 정렬
	$('#headClientCodeDown').click(function(){
		console.log('본사 거래처 오름차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
	// 출금/입금 내림차순 정렬
	$('#headAccountFlowUp').click(function(){
		console.log('출금/입금 내림차순 정렬');
		$('#criteria').attr('value','head_account_flow');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	// 출금/입금 오름차순 정렬
	$('#headAccountFlowDown').click(function(){
		console.log('출금/입금 오름차순 정렬');
		$('#criteria').attr('value','head_account_flow');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
	// 통합 출/입금 관련 그룹코드 내림차순 정렬
	$('#headAccountGroupCodeUp').click(function(){
		console.log('통합 출/입금 관련 그룹 코드 내림차순 정렬');
		$('#criteria').attr('value','head_account_group_code');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	// 통합 출/입금 관련 그룹코드 오름차순 정렬
	$('#headAccountGroupCodeDown').click(function(){
		console.log('통합 출/입금 관련 그룹 코드 오름차순 정렬');
		$('#criteria').attr('value','head_account_group_code');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
	// 테이블명 내림차순 정렬
	$('#headAccountTableUp').click(function(){
		console.log('해당 테이블명 내림차순 정렬');
		$('#criteria').attr('value','head_account_table');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	// 테이블명 오름차순 정렬
	$('#headAccountTableDown').click(function(){
		console.log('해당 테이블명 오름차순 정렬');
		$('#criteria').attr('value','head_account_table');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
	// 합계 내림차순정렬
	$('#headAccountSumUp').click(function(){
		console.log('합계 내림차순 정렬');
		$('#criteria').attr('value','head_account_sum');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	// 합계 오름차순정렬
	$('#headAccountSumDown').click(function(){
		console.log('합계 오름차순 정렬');
		$('#criteria').attr('value','head_account_sum');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
 	// 직원요청일자  오름/내림 차순
	$('#headAccountRequestDateUp').click(function(){
		console.log('직원 요청일자 내림차순 정렬');
		$('#criteria').attr('value','head_account_request_date');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	$('#headAccountRequestDateDown').click(function(){
		console.log('직원 요청일자 오름차순 정렬');
		$('#criteria').attr('value','head_account_request_date');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	}); 
	
	$('#requestCheckDateUp').click(function(){
		console.log('직원요청 확인일자 내림차순 정렬');
		$('#criteria').attr('value','request_check_date');
		$('#upDown').attr('value','DESC');
		$('#headAccountingForm').submit();
	});
	
	$('#requestCheckDateDown').click(function(){
		console.log('직원요청 확인일자 오름차순 정렬');
		$('#criteria').attr('value','request_check_date');
		$('#upDown').attr('value','ASC');
		$('#headAccountingForm').submit();
	});
	
	//검색 유효성
	$('#searchBtn').click(function(){
		if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
			alert('검색분류를 선택하고 검색어를 입력해주세요');
		}else{
			$('#headAccountingForm').submit();
		}
	});
	
});	
	
</script>

<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">통합회계리스트</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="active"><a href="/viewHeadAccountingList.do">전체내역</a>
			</li>
		</ul>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<!-- 회계 검색 -->
						<form action="/viewHeadAccountingList.do" id="headAccountingForm">
							<!-- 검색조건 보내는 곳 -->
							<input type="hidden" name="criteria" id="criteria" value="" /> 
							<input type="hidden" name="upDown" id="upDown" value="" />

							<div class="form-group">
								<!-- 검색 조건 선택  -->
								<select class="form-control" name="searchKey" id="searchKey">
									<option value="">선택</option>
									<option value="head_account_code"
										<c:if test="${'head_account_code' eq search.searchKey }">selected="selected"</c:if>>본사
										통합회계 전표번호</option>
									<option value="subject_code"
										<c:if test="${'subject_code' eq search.searchKey }">selected="selected"</c:if>>계정과목
										코드</option>
									<option value="head_client_code"
										<c:if test="${'head_client_code' eq search.searchKey }">selected="selected"</c:if>>본사
										거래처</option>
									<option value="head_account_flow"
										<c:if test="${'head_account_flow' eq search.searchKey }">selected="selected"</c:if>>출금/입금</option>
									<option value="head_account_group_code"
										<c:if test="${'head_account_group_code' eq search.searchKey }">selected="selected"</c:if>>통합
										출/입금 관련 그룹 코드</option>
									<option value="head_account_table"
										<c:if test="${'head_account_table' eq search.searchKey }">selected="selected"</c:if>>해당
										테이블명</option>
									<option value="head_account_sum"
										<c:if test="${'head_account_sum' eq search.searchKey }">selected="selected"</c:if>>합계</option>
									<option value="head_account_request_date"
										<c:if test="${'head_account_request_date' eq search.searchKey }">selected="selected"</c:if>>직원
										요청일자</option>
									<option value="head_staff_id_request"
										<c:if test="${'head_staff_id_request' eq search.searchKey }">selected="selected"</c:if>>요청
										직원 아이디</option>
									<option value="head_account_detail"
										<c:if test="${'head_account_detail' eq search.searchKey }">selected="selected"</c:if>>상세내역</option>
									<option value="request_check_date"
										<c:if test="${'request_check_date' eq search.searchKey }">selected="selected"</c:if>>직원요청
										확인일자</option>
									<option value="head_staff_id_confirm"
										<c:if test="${'head_staff_id_confirm' eq search.searchKey }">selected="selected"</c:if>>확인
										직원 아이디</option>
								</select>

								<!-- 검색어랑 검색버튼 -->
								<input type="text" class="form-control" name="searchItem" id="searchItem"
									value="${search.searchItem}">
							</div>
							<input type="button" class="btn btn-default" id="searchBtn" value="search" >
							<!-- <input type="button" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색"> -->
						</form>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="dataTable_wrapper fa col-lg-12">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th><small>통합회계 전표번호</small> <span id="headAccountCodeUp"
											class="fa-sort-up"></span> <span id="headAccountCodeDown"
											class=" fa-sort-down"></span></th>
										<th><small>계정과목 코드</small> <span id="subjectCodeUp"
											class="fa-sort-up"></span> <span id="subjectCodeDown"
											class=" fa-sort-down"></span></th>
										<th><small>본사 거래처</small> <span id="headClientCodeUp"
											class="fa-sort-up"></span> <span id="headClientCodeDown"
											class=" fa-sort-down"></span></th>
										<th><small>출금/입금</small></th>
										<th><small>그룹 코드</small> <span
											id="headAccountGroupCodeUp" class="fa-sort-up"></span> <span
											id="headAccountGroupCodeDown" class=" fa-sort-down"></span></th>
										<th><small>해당테이블</small> <span id="headAccountTableUp"
											class="fa-sort-up"></span> <span id="headAccountTableDown"
											class=" fa-sort-down"></span></th>
										<th>합계 <span id="headAccountSumUp" class="fa-sort-up"></span>
											<span id="headAccountSumDown" class=" fa-sort-down"></span>
										</th>
										<th>직원 요청일자 <span id="headAccountRequestDateUp"
											class="fa-sort-up"></span> <span
											id="headAccountRequestDateDown" class=" fa-sort-down"></span>
										</th>
										<th>요청 직원 아이디 <span id="headStaffIdRequestUp"></span> <span
											id="headStaffIdRequestDown"></span>
										</th>
										<th>상세내역</th>
										<th>확인일자 <span id="requestCheckDateUp" class="fa-sort-up"></span>
											<span id="requestCheckDateDown" class=" fa-sort-down"></span>
										</th>
										<th>확인 직원 아이디 <span id="headStaffIdConfirmUp"></span> <span
											id="headStaffIdConfirmDown"></span>
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="Accounting" items="${list}">
										<tr>
											<td>${Accounting.headAccountCode }</td>
											<td>${Accounting.subjectCode }</td>
											<td><a
												href="viewHeadClientDetail.do?headClientCode=${ Accounting.headClientCode}">${Accounting.headClientCode }</a></td>
											<td>${Accounting.headAccountFlow }</td>
											<td>${Accounting.headAccountGroupCode }</td>
											<td>${Accounting.headAccountTable }</td>
											<td>${Accounting.headAccountSum }</td>
											<td><fmt:parseDate
													value="${Accounting.headAccountRequestDate}"
													pattern="yyyy-MM-dd HH:mm:ss" var="date" /> <fmt:formatDate
													pattern="yyyy-MM-dd" type="both" value="${date}" /></td>
											<td>${Accounting.headStaffIdRequest }</td>
											<td>${Accounting.headAccountDetail }</td>
											<td><fmt:parseDate
													value="${Accounting.requestCheckDate }"
													pattern="yyyy-MM-dd HH:mm:ss" var="date" /> <fmt:formatDate
													pattern="yyyy-MM-dd" type="both" value="${date}" /></td>
											<td>${Accounting.headStaffIdConfirm }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<p><a id="more" href="#">더보기&nbsp;&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></a></p>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- /.container-fluid -->
</div>
</body>
</html>