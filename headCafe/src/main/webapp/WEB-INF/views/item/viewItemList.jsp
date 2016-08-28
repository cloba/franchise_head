							<!-- 상품 리스트 화면 -->
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
		
		$('#nameUp').click(function(){
			$('#criteria').val('h_item_name');
			$('#upDown').val('ASC');
			$('#itemList').submit();
		});
		$('#nameDown').click(function(){
			$('#criteria').val('h_item_name');
			$('#upDown').val('DESC');
			$('#itemList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('h_item_regit_date');
			$('#upDown').val('ASC');
			$('#itemList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('h_item_regit_date');
			$('#upDown').val('DESC');
			$('#itemList').submit();
		});
		
		$('#clientUp').click(function(){
			$('#criteria').val('head_client_code');
			$('#upDown').val('ASC');
			$('#itemList').submit();
		});
		$('#clientDown').click(function(){
			$('#criteria').val('head_client_code');
			$('#upDown').val('DESC');
			$('#itemList').submit();
		});
		
		//검색 유효성
		$('#searchBtn').click(function(){
			if( $('#regitDateStart').val() == "" && $('#regitDateEnd').val() == ""){
				if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
					alert('검색분류를 선택하고 검색어를 입력해주세요');
				}else if( $('#searchKey').val() != "" && $('#searchItem').val() != "" ){
					$('#itemList').submit();
				}
			}else if($('#regitDateStart').val() != "" && $('#regitDateEnd').val() == ""){
				alert('날짜를 정확히 선택해 주세요');
			}else if($('#regitDateStart').val() == "" && $('#regitDateEnd').val() != ""){
				alert('날짜를 정확히 선택해 주세요');
			}else{
				$('#itemList').submit();
			}
		});
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">상품목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewItemList.do">전체목록</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="itemList" action="/viewItemList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.status}"/>
								
								<div class="form-group">
								<label>등록일자</label>
								<input type="date" class="form-control" id="regitDateStart" name="regitDateStart" value="${itemSearch.regitDateStart}"/> ~
								<input type="date" class="form-control" id="regitDateEnd" name="regitDateEnd" value="${searitemSearchch.regitDateEnd}"/> 
								<br/><br/>
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="h_item_code" <c:if test="${search.searchKey eq 'h_item_code'}">selected="selected"</c:if>>상품코드</option>
									<option value="inte_code" <c:if test="${search.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품 통합코드</option>
									<option value="h_item_name" <c:if test="${search.searchKey eq 'h_item_name'}">selected="selected"</c:if>>상품명</option>
									<option value="head_client_code" <c:if test="${search.searchKey eq 'head_client_code'}">selected="selected"</c:if>>거래처 코드</option>
									<option value="head_staff_id" <c:if test="${search.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>등록직원 아이디</option>
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
											<th>상품명
												<span id="nameUp" class="fa-sort-up"></span>
												<span id="nameDown" class="fa-sort-down"></span>
											</th>
											<th>상품코드</th>
											<th>상품메뉴 통합코드</th>
											<th>상품 갯수</th>
											<th>박스/개별 여부</th>
											<th>매입가</th>
											<th>등록날짜
												<span id="dateUp" class="fa-sort-up"></span>
												<span id="dateDown" class="fa-sort-down"></span>
											</th>
											<th>등록직원 아이디</th>
											<th>
												거래처 코드
												<span id="clientUp" class="fa-sort-up"></span>
												<span id="clientDown" class="fa-sort-down"></span>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="itemList" items="${itemList}">
											<tr>
												<td><a href="/viewItemDetail.do?hItemCode=${itemList.hItemCode}">${itemList.hItemName}</a></td>
												<td>${itemList.hItemCode}</td>
												<td>${itemList.inteCode}</td>
												<td>${itemList.hItemQuantity}</td>
												<td>${itemList.hItemUnit}</td>
												<td><fmt:formatNumber value="${itemList.hItemPurchasePrice}" pattern="#,###"/></td>
												<td><fmt:parseDate value="${itemList.hItemRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
													<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></td>
												<td>${itemList.headStaffId}</td>
												<td>${itemList.headClientCode}</td>
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
           <a id="addBtn" class="btn btn-default" href="/headAddItem.do">신규등록</a>
		</div>
         <!-- /.container-fluid -->
     </div>
     </div>
</body>
</html>