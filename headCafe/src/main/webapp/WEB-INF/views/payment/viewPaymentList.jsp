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
		
		$('#codeUp').click(function(){
			$('#criteria').val('pay_method_code');
			$('#upDown').val('ASC');
			$('#paymentList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('pay_method_code');
			$('#upDown').val('DESC');
			$('#paymentList').submit();
		});
		
		$('#statusUp').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('ASC');
			$('#paymentList').submit();
		});
		$('#statusDown').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('DESC');
			$('#paymentList').submit();
		});
		
		//검색 유효성
		$('#searchBtn').click(function(){
			if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
				alert('검색분류를 선택하고 검색어를 입력해주세요');
			}else{
				$('#paymentList').submit();
			}
		});
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">결제방식 목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewPaymentList.do">전체목록</a>
					</li>
					<li><a href="/viewPaymentList.do?status=N">미적용 목록</a>
					</li>
					<li><a href="/viewPaymentList.do?status=Y">적용 목록</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="paymentList" action="/viewPaymentList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.status}"/>
								
								<div class="form-group">
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="pay_method_code" <c:if test="${search.searchKey eq 'pay_method_code'}">selected="selected"</c:if>>결제방식 코드</option>
									<option value="pay_method" <c:if test="${search.searchKey eq 'pay_method'}">selected="selected"</c:if>>결제 방식</option>
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
											<th>결제방식 코드
												<span id="codeUp" class="fa-sort-up"></span>
												<span id="codeDown" class="fa-sort-down"></span>
											</th>
											<th>결제방식</th>
											<th>수익</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${paymentList}">
											<tr>
												<td><a href="/viewPaymentDetail.do?payMethodCode=${list.payMethodCode}">${list.payMethodCode}</a></td>
												<td>${list.payMethod}</td>
												<td>${list.profitPercent}%</td>
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
           <a id="addBtn" class="btn btn-default" href="/addPaymentForm.do">신규등록</a>
		</div>
         <!-- /.container-fluid -->
     </div>
     </div>
</body>
</html>