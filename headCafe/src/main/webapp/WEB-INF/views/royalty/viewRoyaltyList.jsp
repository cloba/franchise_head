<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	$('#royaltyCodeUp').click(function(){
		console.log('로열티지불 코드 내림차순 정렬');
		$('#criteria').attr('value','royalty_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#royaltyCodeDown').click(function(){
		console.log('로열티지불 코드 오름차순 정렬');
		$('#criteria').attr('value','royalty_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#contractCodeUp').click(function(){
		console.log('계약코드 내림차순 정렬');
		$('#criteria').attr('value','contract_code');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#contractCodeDown').click(function(){
		console.log('계약코드 오름차순 정렬');
		$('#criteria').attr('value','contract_code');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#royaltyMonthUp').click(function(){
		console.log('해당 월 내림차순 정렬');
		$('#criteria').attr('value','royalty_month');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#royaltyMonthDown').click(function(){
		console.log('해당 월 오름차순 정렬');
		$('#criteria').attr('value','royalty_month');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
	$('#subNameUp').click(function(){
		console.log('점포명 내림차순 정렬');
		$('#criteria').attr('value','sub_name');
		$('#upDown').attr('value','DESC');
		$('#royaltyForm').submit();
	});
	$('#subNameDown').click(function(){
		console.log('점포명 오름차순 정렬');
		$('#criteria').attr('value','sub_name');
		$('#upDown').attr('value','ASC');
		$('#royaltyForm').submit();
	});
});	
</script>

<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">가맹비 관리</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<ul class="nav nav-tabs">
			<li class="active"><a href="/viewRoyaltyList.do">전체 목록 보기</a>
			</li>
		</ul>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<!--검색 -->
						<form id="royaltyForm" action="/viewRoyaltyList.do" method="post">
							<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
							<input type="hidden" name="criteria" id="criteria" value=""/>
							<input type="hidden" name="upDown" id="upDown" value=""/>
							<input type="hidden" value="${search.searchKey}"><br/><br/>
							
							<div class="form-group">
							<!-- 검색 조건 선택  -->
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="royalty_code" <c:if test="${'royalty_code' eq search.searchKey }">selected="selected"</c:if>>로열티지불 코드</option>
									<option value="contract_code"<c:if test="${'contract_code' eq search.searchKey }">selected="selected"</c:if>>계약코드</option>
									<option value="royalty_month" <c:if test="${'royalty_month' eq search.searchKey }">selected="selected"</c:if>>해당 월</option>
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
											<span id="royaltyCodeUp" class="fa-sort-up"></span>
											<span id="royaltyCodeDown" class="fa-sort-down"></span>
										</th>
										<th>가맹점명
											<span id="subNameUp" class="fa-sort-up"></span>
											<span id="subNameDown" class="fa-sort-down"></span>
										</th>
										<th>해당 월
											<span id="royaltyMonthUp" class="fa-sort-up"></span>
											<span id="royaltyMonthDown" class="fa-sort-down"></span>
										</th>
										<th>월 본사 로얄티
											<span id="headSellProfitBySubMonthUp" class="fa-sort-up"></span>
											<span id="headSellProfitBySubMonthDown" class="fa-sort-down"></span>
										</th>
										<th>실제 납부 날짜
											<span id="royaltyPayActualDateUp" class="fa-sort-up"></span>
											<span id="royaltyPayActualDateDown" class="fa-sort-down"></span>
										</th>
										<th>실제 납부 금액
											<span id="royaltyActualAmountUp" class="fa-sort-up"></span>
											<span id="royaltyActualAmountDown" class="fa-sort-down"></span>
										</th>
										</th>
									</tr>
								</thead>
								<tbody>			
									<c:forEach var="Royalty" items="${royaltyList}">
										<tr>
											<th><a href="/viewRoyaltyDetail.do?royaltyCode=${Royalty.royaltyCode}">${Royalty.royaltyCode}</a></th>
											<th>${Royalty.subName}</th>
											<th>${Royalty.royaltyMonth}월</th>
											<th>${Royalty.headSellProfitBySubMonth}</th>
											<th><c:if test="${Royalty.royaltyPayActualDate eq null}">미지급							</c:if>
												<c:if test="${Royalty.royaltyPayActualDate ne null}">${Royalty.royaltyPayActualDate}</c:if>
											</th>
											<th>${Royalty.royaltyActualAmount}</th>
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