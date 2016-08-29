							<!-- 본사 판매 리스트 화면  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.nav nav-tabs:HOVER {
	}
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
		
		$('#codeUp').click(function(){
			$('#criteria').val('head_sell_code');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('head_sell_code');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
		$('#groupUp').click(function(){
			$('#criteria').val('head_sell_group');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#groupDown').click(function(){
			$('#criteria').val('head_sell_group');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('head_sell_date');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('head_sell_date');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
		//배송요청 유효성
		$('#DeliveyRequestBtn').click(function(){
			if(($('input[name=checkedOrders]:checkbox:checked').length <1)){
				alert('선택하세요');
				console.log($('input[name=checkedOrders]:checkbox:checked').length);
			}else{
				console.log($('input[name=checkedOrders]:checkbox:checked').length);
				$('#requestDeliveryForm').submit();
			}
		});
		
		//검색 유효성
		$('#searchBtn').click(function(){
			if( $('#regitDateStart').val() == "" && $('#regitDateEnd').val() == ""){
				if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
					alert('검색분류를 선택하고 검색어를 입력해주세요');
				}else if( $('#searchKey').val() != "" && $('#searchItem').val() != "" ){
					$('#sellList').submit();
				}
			}else if($('#regitDateStart').val() != "" && $('#regitDateEnd').val() == ""){
				alert('날짜를 정확히 선택해 주세요');
			}else if($('#regitDateStart').val() == "" && $('#regitDateEnd').val() != ""){
				alert('날짜를 정확히 선택해 주세요');
			}else{
				$('#sellList').submit();
			}
		});
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">판매내역</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewSellList.do">전체내역</a>
					</li>
					<li><a href="/viewSellList.do?status=N">배송요청완료 내역</a>
					</li>
					<li><a href="/viewSellList.do?status=Y">배송 전 내역</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 판매 내역 검색 -->
							<form id="sellList" action="/viewSellList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.status}"/>

								<div class="form-group">
									<label>판매일자</label>
									<input type="date" class="form-control" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
									<input type="date" class="form-control" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
									<br/><br/>
									<label>키워드검색</label>
									<select class="form-control" id="searchKey" name="searchKey">
										<option value="">::선택::</option>
										<option value="head_sell_code" <c:if test="${search.searchKey eq 'head_sell_code'}">selected="selected"</c:if>>판매코드</option>
										<option value="inte_code" <c:if test="${search.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품 통합코드</option>
										<option value="sub_code" <c:if test="${search.searchKey eq 'store_code'}">selected="selected"</c:if>>가맹일련번호</option>
									</select>
									<input type="text" class="form-control" id="searchItem" name="searchItem" value="${search.searchItem}"/>
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
											<th>선택</th>
											<th>판매코드
												<span id="codeUp" class="fa-sort-up"></span>
												<span id="codeDown" class="fa-sort-down"></span>
											</th>
											<th>상품메뉴 통합코드</th>
											<th>판매수량</th>
											<th>가맹일련번호</th>
											<th>판매그룹번호
												<span id="groupUp" class="fa-sort-up"></span>
												<span id="groupDown" class="fa-sort-down"></span>
											</th>
											<th>판매금액</th>
											<th>판매일자
												<span id="dateUp" class="fa-sort-up"></span>
												<span id="dateDown" class="fa-sort-down"></span>
											</th>
											<th>배송요청여부</th>
										</tr>
									</thead>
									<tbody>
									<form action="/requestDelivery.do" method="post" id="requestDeliveryForm">
										<c:forEach var="list" items="${sellList}">
											<input type="hidden" name="inteCode" value="${list.inteCode}"/>
											<input type="hidden" name="headSellQuantity" value="${list.headSellQuantity}"/>
											
											<tr>
												<td>
													<c:if test="${list.headSellDelivery eq 'N'}">
														<center><input type="checkbox" id="checkedOrders" name="checkedOrders" value="${list.headSellCode}"/></center>
													</c:if>
												</td>
												<td>
													<a href="/viewSellDetail.do?headSellCode=${list.headSellCode}">${list.headSellCode}</a>
												</td>
												<td>${list.inteCode}</td>
												<td>${list.headSellQuantity}</td>
												<td>${list.subCode}</td>
												<td>${list.headSellGroup}</td>
												<td><fmt:formatNumber value="${list.headSellSellingPrice}" pattern="#,###"/></td>
												<td><fmt:parseDate value="${list.headSellDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
													<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></td>
												<td>${list.headSellDelivery}</td>
											</tr>
										</c:forEach>
										<input type="hidden" name="headStaffId" value="${login.headStaffId}">
 										<p style="float:right"><input type="button" id="DeliveyRequestBtn" name="DeliveyRequestBtn" class="btn btn-primary" value="배송요청"> 
									</form>
                                 </tbody>
                               </table>
                           </div>
                       </div>
							<ul class="pager">
								<li><a href="/viewSellList.do?startPage=1">Previous</a></li>
								<li><a href="/viewSellList.do?pageLimit=30">Next</a></li>
							</ul>
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