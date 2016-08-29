							<!-- 출고 상품 리스트 화면 -->
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
		
		$('#codeUp').click(function(){
			$('#criteria').val('head_out_code');
			$('#upDown').val('ASC');
			$('#outList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('head_out_code');
			$('#upDown').val('DESC');
			$('#outList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('head_out_date');
			$('#upDown').val('ASC');
			$('#outList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('head_out_date');
			$('#upDown').val('DESC');
			$('#outList').submit();
		});
		
		//검색 유효성
		$('#searchBtn').click(function(){
			if( $('#regitDateStart').val() == "" && $('#regitDateEnd').val() == ""){
				if(  ($('#searchKey').val() == "" || $('#searchItem').val() == "")&& ($('#status').val()=="")){
					alert('검색분류를 선택하고 검색어를 입력해주세요');
				}else if( ($('#searchKey').val() != "" && $('#searchItem').val() !="")||($('#status').val() !="" )){
					console.log('submit');
					$('#outList').submit();
				}
			}else if($('#regitDateStart').val() != "" && $('#regitDateEnd').val() == ""){
				alert('날짜를 정확히 선택해 주세요');
			}else if($('#regitDateStart').val() == "" && $('#regitDateEnd').val() != ""){
				alert('날짜를 정확히 선택해 주세요');
			}else{
				$('#outList').submit();
			}
		});
	});
</script>

<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">출고내역</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="panel-body">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="/viewItemOutList.do">전체내역</a></li>
			</ul>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="outList" action="/viewItemOutList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value="" /> 
								<input type="hidden" name="upDown" id="upDown" value="" />
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" value="${search.status}" />

								<div class="form-group">
									<label>출고날짜</label> 
										<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}" /> ~ 
										<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}" /> <br />
									<br /> 
									<label>키워드</label> 
										<select class="form-control" id="searchKey" name="searchKey">
										<option value="">::선택::</option>
										<option value="head_out_code"
											<c:if test="${search.searchKey eq 'head_out_code'}">selected="selected"</c:if>>본사출고코드</option>
										<option value="store_code"
											<c:if test="${search.searchKey eq 'store_code'}">selected="selected"</c:if>>가맹일련번호</option>
										<option value="specific_item_code"
											<c:if test="${search.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>상품개별코드</option>
									</select> 
									<label>배송상태</label> 
									<select class="form-control" id="status" name="status">
										<option value="">::배송상태 검색::</option>
										<option value="1"
											<c:if test="${search.status eq '1'}">selected="selected"</c:if>>가맹요청중</option>
										<option value="2"
											<c:if test="${search.status eq '2'}">selected="selected"</c:if>>배송준비중</option>
										<option value="3"
											<c:if test="${search.status eq '3'}">selected="selected"</c:if>>배송완료</option>
										<option value="4"
											<c:if test="${search.status eq '4'}">selected="selected"</c:if>>가맹확인완료</option>
									</select> 
									<input type="text" class="form-control" id="searchItem" name="searchItem" value="${search.searchItem}" />
								</div>
								<input type="button" class="btn btn-default" id="searchBtn" value="search"> 
								
							</form>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper fa col-lg-12">
								<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<thead>
										<tr>
											<th>출고코드 <span id="codeUp" class="fa-sort-up"></span> 
														<span id="codeDown" class="fa-sort-down"></span>
											</th>
											<th>가맹일련번호</th>
											<th>상품개별코드</th>
											<th>출고날짜 <span id="dateUp" class="fa-sort-up"></span> 
														<span id="dateDown" class="fa-sort-down"></span>
											</th>
											<th>배송상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="outList" items="${outList}">
											<tr>
												<td><a href="/viewItemOutDetail.do?headOutCode=${outList.headOutCode}">${outList.headOutCode}</a></td>
												<td>${outList.storeCode}</td>
												<td>${outList.specificItemCode}</td>
												<td><fmt:parseDate value="${outList.headOutDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date" /> 
													<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
												</td>
												<c:choose>
													<c:when test="${outList.headOutStatus eq 1}">
														<td>가맹요청</td>
													</c:when>
													<c:when test="${outList.headOutStatus eq 2}">
														<td>배송준비중</td>
													</c:when>
													<c:when test="${outList.headOutStatus eq 3}">
														<td>배송완료</td>
													</c:when>
													<c:otherwise>
														<td>가맹 수령완료</td>
													</c:otherwise>
												</c:choose>
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
</div>
</body>
</html>