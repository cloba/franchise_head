<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		/* 오름차/내림차순 정렬 설정 */
		$('#specificItemUp').click(function(){
			console.log('개별상품코드 내림차순 정렬');
			$('#criteria').attr('value','specific_item_code');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffStockForm').submit();
		});
		$('#specificItemDown').click(function(){
			console.log('개별상품코드 오름차순 정렬');
			$('#criteria').attr('value','specific_item_code');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffStockForm').submit();
		});
		$('#itemUp').click(function(){
			console.log('이름 내림차순 정렬');
			$('#criteria').attr('value','h_item_code');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffStockForm').submit();
		});
		$('#itemDown').click(function(){
			console.log('이름 오름차순 정렬');
			$('#criteria').attr('value','h_item_code');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffStockForm').submit();
		});
		$('#inDateUp').click(function(){
			console.log('거래처로 내림차순 정렬');
			$('#criteria').attr('value','head_stock_in_date');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffStockForm').submit();
		});
		$('#inDateDown').click(function(){
			console.log('거래처로 오름차순 정렬');
			$('#criteria').attr('value','head_stock_in_date');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffStockForm').submit();
		});
		$('#itemOutUp').click(function(){
			console.log('거래처로 내림차순 정렬');
			$('#criteria').attr('value','head_stock_item_out');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffStockForm').submit();
		});
		$('#itemOutDown').click(function(){
			console.log('거래처로 오름차순 정렬');
			$('#criteria').attr('value','head_stock_item_out');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffStockForm').submit();
		});
		
		//검색 유효성
		$('#searchheadStaffBtn').click(function(){
			if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
				alert('검색분류를 선택하고 검색어를 입력해주세요');
			}else{
				$('#HeadStaffStockForm').submit();
			}
		});
});	
</script>
</head>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">재고목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viweHeadStockList.do">전체내역</a>
					</li>
				</ul>
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 판매 내역 검색 -->
							<form id="HeadStaffStockForm" action="/viweHeadStockList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.searchKey}"/>
								
								<div class="form-group">
								<label>키워드</label>
									<select class="form-control" id="searchKey" name="searchKey">
										<option value="">::선택::</option>
										<option value="specific_item_code" <c:if test="${'specific_item_code' eq search.searchKey }">selected="selected"</c:if>>개별상품코드</option>
										<option value="h_item_code"<c:if test="${'h_item_code' eq search.searchKey }">selected="selected"</c:if>>상품코드</option>
										<option value="head_stock_in_date" <c:if test="${'head_stock_in_date' eq search.searchKey }">selected="selected"</c:if>>입고일자</option>
										<option value="head_stock_item_out" <c:if test="${'head_stock_item_out' eq search.searchKey }">selected="selected"</c:if>>출고일자</option>
									</select>
									<input type="text" class="form-control" id="searchItem" name="searchItem" value="${search.searchItem}"/>
									</div>
									<input type="button" class="btn btn-default" id="searchheadStaffBtn" value="search" >
								</form>
							</div>
							<!-- /.panel-heading -->
	 						<div class="panel-body">
								<div class="dataTable_wrapper fa col-lg-12">
									<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
										<thead>
											<tr>
												<th>개별상품코드
													<span id="specificItemUp" class="fa-sort-up"></span>
													<span id="specificItemDown" class="fa-sort-down"></span>
												</th>
												<th>상품코드
													<span id="itemUp" class="fa-sort-up"></span>
													<span id="itemDown" class="fa-sort-down"></span>
												</th>
												<th>입고날짜
													<span id="inDateUp" class="fa-sort-up"></span>
													<span id="inDateDown" class="fa-sort-down"></span>
												</th>
												<th>출고여부
													<span id="itemOutUp" class="fa-sort-up"></span>
													<span id="itemOutDown" class="fa-sort-down"></span>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="Stock" items="${list}">
												<tr>
													<td><a href="viewHeadStrockDetail.do?specificItemCode=${ Stock.specificItemCode}">${Stock.specificItemCode }</a></td>
													<td>${Stock.hItemCode }</td>
													<td>${Stock.headStockInDate}</td>
													<td>${Stock.headStockItemOut}</td>
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