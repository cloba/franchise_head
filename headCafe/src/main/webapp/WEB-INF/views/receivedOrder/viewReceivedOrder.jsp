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
	#p {
		text-align: center;
	}
</style>
<script>
	$(document).ready(function(){
		
		$('#nameUp').click(function(){
			$('#criteria').val('received_order_sub_code');
			$('#upDown').val('ASC');
			$('#searchForm').submit();
		});
		$('#nameDown').click(function(){
			$('#criteria').val('received_order_sub_code');
			$('#upDown').val('DESC');
			$('#searchForm').submit();
		});
		
		/* 검색 버튼 눌렀을 때 유효성 검사 */
	 	$('#searchBtn').click(function(){
			console.log('버튼클릭');
			searchValid($('#menuList'));
		});
		
		$('#nameUp').click(function(){
			upDown('nameUp',$('#menuList'));
		});
		
		$('#nameDown').click(function(){
			upDown('nameDown',$('#menuList'));
		}); 
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">받은 주문</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewReceivedOrder.do">전체내역</a>
					</li>
					<li><a href="/viewReceivedOrder.do?status=Y">확인한 주문</a>
					</li>
					<li><a href="/viewReceivedOrder.do?status=N">미확인 주문</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 판매 내역 검색 -->
							<form id="searchForm" action="/viewReceivedOrder.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.status}"/>
								<div class="form-group">
								<c:if test="${search.status ne 'N'}">
									<label>확인 날짜</label>
									<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
									<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
									<br/><br/>
								</c:if>
								<label>키워드</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="received_order_code" <c:if test="${search.searchKey eq 'received_order_code'}">selected="selected"</c:if>>일련코드</option>
									<option value="received_order_sub_code" <c:if test="${search.searchKey eq 'received_order_sub_code'}">selected="selected"</c:if>>가맹코드</option>
								</select>
								<input type="text" class="form-control" id="searchItem" name="searchItem" value="${search.searchItem}"/>
								</div>
								<button class="btn btn-default" id="searchBtn">
									<i class="fa fa-search"></i>
								</button>
							</form>
							</div>
							<!-- /.panel-heading -->
	 						<div class="panel-body">
								<div class="dataTable_wrapper fa col-lg-12">
									<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
										<thead>
											<tr>
												<th>일련코드</th>
												<th>상품통합코드</th>
												<th>가맹코드
													<span id="nameUp" class="fa-sort-up"></span>
													<span id="nameDown" class="fa-sort-down"></span>
												</th>
												<th>주문수량</th>
												<th>주문그룹</th>
												<th>금액</th>
												<c:if test="${search.status ne 'N'}">
													<th>본사확인여부</th>
													<th>확인일자</th>
													<th>확인직원</th>
												</c:if>
												<th>확인</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list}">
												<tr>
													<td>${list.code}</td>
													<td>${list.item}</td>
													<td>${list.subCode}</td>
													<td>${list.quantity}</td>
													<td>${list.group}</td>
													<td>${list.amount}</td>
													<c:if test="${search.status ne 'N'}">
														<td>${list.check}</td>
														<td>${list.date}</td>
														<td>${list.staff}</td>
													</c:if>
													<c:if test="${list.check eq 'N'}">
														<td><a href="/confirmOrder.do?receivedOrderCode=${list.code}">확인</a></td>
													</c:if>
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