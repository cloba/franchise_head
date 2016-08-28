							<!-- 배송 리스트 화면 -->
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
	
	.deliveryStatus {
		float: right;
		display: inline;
	}
	
</style>
<script>

	$(document).ready(function(){
		
		$('#codeUp').click(function(){
			$('#criteria').val('delivery_code');
			$('#upDown').val('ASC');
			$('#delList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('delivery_code');
			$('#upDown').val('DESC');
			$('#delList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('delivery_date');
			$('#upDown').val('ASC');
			$('#delList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('delivery_date');
			$('#upDown').val('DESC');
			$('#delList').submit();
		});
		
		$('#returnUp').click(function(){
			$('#criteria').val('delivery_return');
			$('#upDown').val('ASC');
			$('#delList').submit();
		});
		$('#returnDown').click(function(){
			$('#criteria').val('delivery_return');
			$('#upDown').val('DESC');
			$('#delList').submit();
		});
		
		$('#changeBtn').click(function(){
			
			if(($('input[name=checked]:checkbox:checked').length <1)){
				alert('체크박스를 선택하세요');
				console.log($('input[name=checked]:checkbox:checked').length);	
			
			}else if($('#deliveryStatus option:selected').val()=='setSelect'){
				alert('옵션을 선택하세요');
				console.log($('#deliveryStatus option:selected').val());
				
			}else{
				$('#updateStatus').submit();
			}
		});
		
		$('#searchBtn').click(function(){
			if( $('#regitDateStart').val() == "" && $('#regitDateEnd').val() == ""){
				if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
					alert('검색분류를 선택하고 검색어를 입력해주세요');
				}else if( $('#searchKey').val() != "" && $('#searchItem').val() != "" ){
					$('#delList').submit();
				}
			}else if($('#regitDateStart').val() != "" && $('#regitDateEnd').val() == ""){
				alert('날짜를 정확히 선택해 주세요');
			}else if($('#regitDateStart').val() == "" && $('#regitDateEnd').val() != ""){
				alert('날짜를 정확히 선택해 주세요');
			}else{
				$('#delList').submit();
			}
		});
	});

</script>
<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">배송목록</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<ul class="nav nav-tabs">
			<li class="active"><a href="/viewDeliveryList.do">전체 목록 보기</a>
			</li>
		</ul>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<!--검색 -->
						<form id="delList" action="/viewDeliveryList.do" method="post">
							<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
							<input type="hidden" name="criteria" id="criteria" value=""/>
							<input type="hidden" name="upDown" id="upDown" value=""/>
							<input type="hidden" value="${search.searchKey}">
							
							배송 날짜: 
							<input type="date" class="form-control" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
							<input type="date" class="form-control" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
							<br/><br/>
							
							<div class="form-group">
							<!-- 검색 조건 선택  -->
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="delivery_code" <c:if test="${search.searchKey eq 'delivery_code'}">selected="selected"</c:if>>배송코드</option>
									<option value="received_order_code" <c:if test="${search.searchKey eq 'received_order_code'}">selected="selected"</c:if>>가맹발주번호</option>
								</select>
								<select class="form-control" id="status" name="status">
									<option value="">::수령여부 검색::</option>
									<option value="N" <c:if test="${search.status eq '1'}">selected="selected"</c:if>>가맹수령전</option>
									<option value="Y" <c:if test="${search.status eq '2'}">selected="selected"</c:if>>가맹수령함</option>
								</select>
								<!-- 검색어 입력과 검색 버튼 -->
								<input type="text" class="form-control" id="searchItem" name="searchItem" value="${subSearch.searchItem}"/>
							</div>
							<button id="searchBtn" class="btn btn-default"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="dataTable_wrapper fa col-lg-12">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>선택</th>
										<th>배송코드
											<span id="codeUp" class="fa-sort-up"></span>
											<span id="codeDown" class="fa-sort-down"></span>
										</th>
										<th>가맹주문번호</th>
										<th>배송날짜
											<span id="dateUp" class="fa-sort-up"></span>
											<span id="dateDown" class="fa-sort-down"></span>
										</th>
										<th>가맹수령여부</th>
										<th>반송해당여부
											<span id="returnUp" class="fa-sort-up"></span>
											<span id="returnDown" class="fa-sort-down"></span>
										</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>		
									<form action="/updateStatus.do" method="post" id="updateStatus">	
										<c:forEach var="list" items="${deliveryList}">
											<tr>
												<td>
													<center><input type="checkbox" class="checkDeleveryCode" name="checked" value="${list.deliveryCode}"/></center>
												</td>
												<td><a href="/viewDeliveryDetail.do?deliveryCode=${list.deliveryCode}">${list.deliveryCode}</a></td>
												<td>${list.receivedOrderCode}</th>
												<td><fmt:parseDate value="${list.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
													<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></td>
												<td>${list.deliveryReceive}</td>
												<td>${list.deliveryReturn}</td>
												<c:if test="${list.deliveryStatus eq 1}">
													<td>배송준비중</td>
												</c:if>
												<c:if test="${list.deliveryStatus eq 2}">
													<td>배송중</td>
												</c:if>
												<c:if test="${list.deliveryStatus eq 3}">
													<td>배송완료</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="deliveryStatus">	
									<select class="form-control" id="statusDelivery" name="deliveryStatus">
										<option value="setSelect">:::배송상태 변경:::</option>
										<option value="2">배송중</option>
										<option value="3">가맹이 받음</option>
									</select>
									<input type="button" id="changeBtn" class="btn btn-primary" value="변경">
								</div>
								<div>
									<input type="hidden" name="headStaffId" value="${login.headStaffId}" >
								</div>
								</form>
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