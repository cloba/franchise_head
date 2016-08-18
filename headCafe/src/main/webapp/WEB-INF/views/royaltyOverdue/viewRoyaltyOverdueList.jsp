<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.form-control, .form-group {
		width: 250px;
		height: 31px;
		display: inline;
	}
	
	#p {
		text-align: center;
	}
	
</style>
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
<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">연체 관리</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<ul class="nav nav-tabs">
			<li class="active"><a href="/viewRoyaltyOverdueList.do">전체 목록 보기</a>
			</li>
		</ul>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<!-- 거래처 검색 -->
						<form id="royaltyOverdueForm" action="/viewRoyaltyOverdueList.do" method="post">
							<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
							<input type="hidden" name="criteria" id="criteria" value=""/>
							<input type="hidden" name="upDown" id="upDown" value=""/>
							<input type="hidden" value="${search.searchKey}">
							
							<div class="form-group">
							<!-- 검색 조건 선택  -->
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="royalty_overdue_code" <c:if test="${'royalty_overdue_code' eq search.searchKey }">selected="selected"</c:if>>로열티 지급예정 코드</option>
									<option value="royalty_overdue_status"<c:if test="${'royalty_overdue_status' eq search.searchKey }">selected="selected"</c:if>>지불 상태</option>
									<option value="royalty_overdue_pay_date" <c:if test="${'royalty_overdue_pay_date' eq search.searchKey }">selected="selected"</c:if>>납부 일자</option>
									<option value="sub_name" <c:if test="${'sub_name' eq search.searchKey }">selected="selected"</c:if>>점포 명</option>
								</select>
								<!-- 검색어 입력과 검색 버튼 -->
								<input type="text" class="form-control" id="searchItem" name="searchItem" value="${subSearch.searchItem}"/>
								</div>
							<button class="btn btn-default"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="dataTable_wrapper fa col-lg-12">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>일련코드
											<span id="royaltyOvrdueCodeUp" class="fa-sort-up"></span>
											<span id="royaltyOvrdueCodeDown" class="fa-sort-down"></span>
										</th>
										<th>가맹점명
											<span id="subNameUp" class="fa-sort-up"></span>
											<span id="subNameDown" class="fa-sort-down"></span>
										</th>
										<th>지불상태
											<span id="royaltyOverdueStatusUp" class="fa-sort-up"></span>
											<span id="royaltyOverdueStatusDown" class="fa-sort-down"></span>
										</th>
										<th>월 원금
											<span id="royaltyTotalOverduePayUp" class="fa-sort-up"></span>
											<span id="royaltyTotalOverduePayDown" class="fa-sort-down"></span>
										</th>
										<th>납부 금액
											<span id="royaltyOverduePaidUp" class="fa-sort-up"></span>
											<span id="royaltyOverduePaidDown" class="fa-sort-down"></span>
										</th>
										<th>납부 일자
											<span id="royaltyOverduePayDateUp" class="fa-sort-up"></span>
											<span id="royaltyOverduePayDateDown" class="fa-sort-down"></span>
										</th>
										<th>남은 금액
											<span id="royaltyOverdueRestUp" class="fa-sort-up"></span>
											<span id="royaltyOverdueRestDown" class="fa-sort-down"></span>
										</th>
									</tr>
								</thead>
								<tbody>			
									<c:forEach var="royaltyOverdue" items="${royaltyOverduelist}">
										<tr>
											<th><a href="/viewRoyaltyOverdueDetail.do?royaltyOverdueCode=${royaltyOverdue.royaltyOverdueCode}">${royaltyOverdue.royaltyOverdueCode}</a></th>
											<th>${royaltyOverdue.subName}</th>
											<th>${royaltyOverdue.royaltyOverdueStatus}</th>
											<th>${royaltyOverdue.royaltyTotalOverduePay}</th>
											<th>${royaltyOverdue.royaltyOverduePaid}</th>
											<th>
												<c:if test="${royaltyOverdue.royaltyOverduePayDate eq null}">미납										</c:if>
												<c:if test="${royaltyOverdue.royaltyOverduePayDate ne null}">${royaltyOverdue.royaltyOverduePayDate}</c:if>	
											</th>
											<th>${royaltyOverdue.royaltyOverdueRest}	</th>
										</tr>
									</c:forEach>
								</tbody>
								</table>
							</div>
						</div>
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