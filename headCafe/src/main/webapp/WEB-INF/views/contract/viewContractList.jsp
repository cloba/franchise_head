							<!-- 계약 리스트 화면 -->
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
		
		$('#conCodeUp').click(function(){
			$('#criteria').val('contract_code');
			$('#upDown').val('ASC');
			$('#contractList').submit();
		});
		$('#conCodeDown').click(function(){
			$('#criteria').val('contract_code');
			$('#upDown').val('DESC');
			$('#contractList').submit();
		});
		
		$('#conDateUp').click(function(){
			$('#criteria').val('contract_actual_date');
			$('#upDown').val('ASC');
			$('#contractList').submit();
		});
		$('#conDateDown').click(function(){
			$('#criteria').val('contract_actual_date');
			$('#upDown').val('DESC');
			$('#contractList').submit();
		});
		
		$('#searchBtn').click(function(){
			if( $('#regitDateStart').val() == "" && $('#regitDateEnd').val() == ""){
				if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
					alert('검색분류를 선택하고 검색어를 입력해주세요');
				}else if( $('#searchKey').val() != "" && $('#searchItem').val() != "" ){
					$('#contractList').submit();
				}
			}else if($('#regitDateStart').val() != "" && $('#regitDateEnd').val() == ""){
				alert('날짜를 정확히 선택해 주세요');
			}else if($('#regitDateStart').val() == "" && $('#regitDateEnd').val() != ""){
				alert('날짜를 정확히 선택해 주세요');
			}else{
				$('#contractList').submit();
			}
		});
	});

</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">계약목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewContractList.do">전체목록</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="contractList" action="/viewContractList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								
								<div class="form-group">
								<label>계약일자</label>
								<input type="date" class="form-control" id="regitDateStart" name="regitDateStart" value="${conSearch.regitDateStart}"/> ~
								<input type="date" class="form-control" id="regitDateEnd" name="regitDateEnd" value="${conSearch.regitDateEnd}"/> 
								<br/><br/>
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="contract_code" <c:if test="${conSearch.searchKey eq 'contract_code'}">selected="selected"</c:if>>계약코드</option>
									<option value="store_code" <c:if test="${conSearch.searchKey eq 'store_code'}">selected="selected"</c:if>>가맹대표코드</option>
									<option value="contractor_name" <c:if test="${conSearch.searchKey eq 'contractor_name'}">selected="selected"</c:if>>가맹점주 이름</option>
								</select>
								<!-- 계약상태 선택 -->
								<select class="form-control id="status" name="status">
									<option value="">::계약상태 검색::</option>
									<option value="1" <c:if test="${conSearch.status eq '1'}">selected="selected"</c:if>>유효한 계약</option>
									<option value="2" <c:if test="${conSearch.status eq 'N'}">selected="selected"</c:if>>연기된 계약</option>
									<option value="3" <c:if test="${conSearch.status eq 'N'}">selected="selected"</c:if>>파기된 계약</option>
									<option value="4" <c:if test="${conSearch.status eq 'N'}">selected="selected"</c:if>>만료된 계약</option>
								</select>
								<!-- 검색어와 검색버튼 -->
								<input type="text" class="form-control" id="searchItem" name="searchItem" value="${conSearch.searchItem}"/>
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
											<th>계약코드
												<span id="conCodeUp" class="fa-sort-up"></span>
												<span id="conCodeDown" class="fa-sort-down"></span>
											</th>
											<th>가맹일련번호</th>
											<th>계약날짜
												<span id="conDateUp" class="fa-sort-up"></span>
												<span id="conDateDown" class="fa-sort-down"></span>
											</th>
											<th>점주이름</th>
											<th>계약상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="contractList" items="${contractList}">
											<tr>
												<td><a href="/viewContractDetail.do?contractCode=${contractList.contractCode }">${contractList.contractCode }</a></td>
												<td>${contractList.subCode }</td>
												<td>${contractList.contractActualDate}</td>
												<td>${contractList.contractorName }</td>
												<c:if test="${contractList.contractStatus eq '1'}">
													<td>계약중</td>
												</c:if>
												<c:if test="${contractList.contractStatus eq '2'}">
													<td>연기</td>
												</c:if>
												<c:if test="${contractList.contractStatus eq '3'}">
													<td>파기</td>
												</c:if>
												<c:if test="${contractList.contractStatus eq '4'}">
													<td>만료</td>
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
           <a id="addBtn" class="btn btn-default" href="/addContractForm.do">신규등록</a>
		</div>
         <!-- /.container-fluid -->
     </div>
     </div>
</body>
</html>