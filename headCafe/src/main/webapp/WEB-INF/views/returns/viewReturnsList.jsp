							<!-- 반품 상품 리스트 화면  -->
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
	#addBtn {
		float: right;
	}
	
</style>
<script>
$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	$('#returnsCodeUp').click(function(){
		$('#criteria').attr('value','returns_code');
		$('#upDown').attr('value','DESC');
		$('#returnsForm').submit();
	});
	$('#returnsCodeDown').click(function(){
		$('#criteria').attr('value','returns_code');
		$('#upDown').attr('value','ASC');
		$('#returnsForm').submit();
	});
	$('#ordersCodeUp').click(function(){
		$('#criteria').attr('value','orders_code');
		$('#upDown').attr('value','DESC');
		$('#returnsForm').submit();
	});
	$('#ordersCodeDown').click(function(){
		$('#criteria').attr('value','orders_code');
		$('#upDown').attr('value','ASC');
		$('#returnsForm').submit();
	});
	$('#specificItemCodeUp').click(function(){
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','DESC');
		$('#returnsForm').submit();
	});
	$('#specificItemCodeDown').click(function(){
		$('#criteria').attr('value','specific_item_code');
		$('#upDown').attr('value','ASC');
		$('#returnsForm').submit();
	});
	$('#returnsPriceUp').click(function(){
		$('#criteria').attr('value','returns_price');
		$('#upDown').attr('value','DESC');
		$('#returnsForm').submit();
	});
	$('#returnsPriceDown').click(function(){
		$('#criteria').attr('value','returns_price');
		$('#upDown').attr('value','ASC');
		$('#returnsForm').submit();
	});
	$('#returnsReDeliveryUp').click(function(){
		$('#criteria').attr('value','returns_re_delivery');
		$('#upDown').attr('value','DESC');
		$('#returnsForm').submit();
	});
	$('#returnsReDeliveryDown').click(function(){
		$('#criteria').attr('value','returns_re_delivery');
		$('#upDown').attr('value','ASC');
		$('#returnsForm').submit();
	});
	
	//검색 유효성
	$('#searchBtn').click(function(){
		if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
			alert('검색분류를 선택하고 검색어를 입력해주세요');
		}else{
			$('#returnsForm').submit();
		}
	});
});	
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">반품상품 목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewReturnsList.do">전체목록</a></li>
					<li><a href="/viewReturnsList.do?status=N">미확인 목록</a></li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="returnsForm" action="/viewReturnsList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.status}"/>
								
								<div class="form-group">
								<label>키워드검색</label>
								<select class="form-control" name="searchKey">
									<option value="">::선택::</option>
									<option value="returns_code" <c:if test="${'returns_code' eq search.searchKey }">selected="selected"</c:if>>반품 코드</option>
									<option value="orders_code"<c:if test="${'orders_code' eq search.searchKey }">selected="selected"</c:if>>가맹발주 번호</option>
									<option value="specific_item_code" <c:if test="${'specific_item_code' eq search.searchKey }">selected="selected"</c:if>>개별상품코드</option>
									<option value="returns_price" <c:if test="${'returns_price' eq search.searchKey }">selected="selected"</c:if>>반품가격</option>
									<option value="returns_re_delivery" <c:if test="${'returns_re_delivery' eq search.searchKey }">selected="selected"</c:if>>재배송 요청 여부</option>
								</select>
									<!-- 검색어와 검색버튼 -->
									<input type="text" class="form-control" id="searchItem" name="searchItem" value="${search.searchItem}"/>
									</div>
									<input type="button" class="btn btn-default" id="searchBtn" value="search"/>
								</form>
							</div>
							<!-- /.panel-heading -->
	 						<div class="panel-body">
								<div class="dataTable_wrapper fa col-lg-12">
									<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
										<thead>
											<tr>
												<th>반품코드
													<span id="returnsCodeUp" class="fa-sort-up"></span>
													<span id="returnsCodeDown" class="fa-sort-down"></span>
												</th>
												<th>가맹주문번호
													<span id="ordersCodeUp" class="fa-sort-up"></span>
													<span id="ordersCodeDown" class="fa-sort-down"></span>
												</th>
												<th>개별상품코드
													<span id="specificItemCodeUp" class="fa-sort-up"></span>
													<span id="specificItemCodeDown" class="fa-sort-down"></span>
												</th>
												<th>반품사유</th>
												<th>금액
													<span id="returnsReasonUp" class="fa-sort-up"></span>
													<span id="returnsReasonDown" class="fa-sort-down"></span>
												</th>
												<th>재배송요청
													<span id="returnsReDeliveryUp" class="fa-sort-up"></span>
													<span id="returnsReDeliveryDown" class="fa-sort-down"></span>
												</th>
											</tr>
									</thead>
									<tbody>
										<c:forEach var="Returns" items="${returnsList}">
											<tr>
												<td><a href="/viewReturnsDetail.do?returnsCode=${Returns.returnsCode}"> ${Returns.returnsCode}</a></td>
												<td>${Returns.ordersCode}</td>
												<td>${Returns.specificItemCode}</td>
												<td><a href="/viewReturnsDetail.do?returnsCode=${Returns.returnsCode}">반품사유</a></td>
												<td><fmt:formatNumber value="${Returns.returnsPrice}" pattern="#,###"/>원</td>
												<td><c:if test="${Returns.returnsReDelivery eq 'N'}">해당없음 </c:if>
													<c:if test="${Returns.returnsReDelivery eq 'Y'}">재배송요청 </c:if></td>
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
     </div>
</body>
</html>