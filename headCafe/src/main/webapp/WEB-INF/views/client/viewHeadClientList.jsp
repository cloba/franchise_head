							<!-- 거래처 리스트 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 검색과 정렬 유효성 검사하는 함수가 있는 js파일 -->
<script type="text/javascript" src="resources/js/validation.js"></script>
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
		text-align: right;
	}
	
</style>
<script>

$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	$('#headClientCodeUp').click(function(){
		console.log('거래처 코드 내림차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','DESC');
		$('#headClientForm').submit();
	});
	$('#headClientCodeDown').click(function(){
		console.log('거래처 코드 오름차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','ASC');
		$('#headClientForm').submit();
	});/////////////////////
	$('#headClientNameUp').click(function(){
		console.log('거래처 명 내림차순 정렬');
		$('#criteria').attr('value','head_client_name');
		$('#upDown').attr('value','DESC');
		$('#headClientForm').submit();
	});
	$('#headClientNameDown').click(function(){
		console.log('거래처 명 오름차순 정렬');
		$('#criteria').attr('value','head_client_name');
		$('#upDown').attr('value','ASC');
		$('#headClientForm').submit();
	});/////////////////////////////
	$('#headClientInChargeUp').click(function(){
		console.log('담당자 명 내림차순 정렬');
		$('#criteria').attr('value','head_client_in_charge');
		$('#upDown').attr('value','DESC');
		$('#headClientForm').submit();
	});
	$('#headClientInChargeDown').click(function(){
		console.log('담당자 명 오름차순 정렬');
		$('#criteria').attr('value','head_client_in_charge');
		$('#upDown').attr('value','ASC');
		$('#headClientForm').submit();
	});
	
	//검색 유효성
	$('#searchBtn').click(function(){
		if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
			alert('검색분류를 선택하고 검색어를 입력해주세요');
		}else{
			$('#headClientForm').submit();
		}
	});
	
});	
	
</script>
<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">거래처 관리</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="active"><a href="/viewHeadClientList.do">전체 목록 보기</a>
			</li>
		</ul>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<!-- 거래처 검색 -->
						<form action="/viewHeadClientList.do" id="headClientForm">
						<!-- 검색조건 보내는 곳 -->
						<input type="hidden" name="criteria" id="criteria" value="" /> 
						<input type="hidden" name="upDown" id="upDown" value="" />
						<div class="form-group">
						<!-- 검색 조건 선택  -->
						<select class="form-control" name="searchKey" id="searchKey">    
							<option value="">선택</option>   
							<option value="head_client_code" <c:if test="${'head_client_code' eq search.searchKey }">selected="selected"</c:if>>거래처 코드</option>
							<option value="head_client_name"<c:if test="${'head_client_name' eq search.searchKey }">selected="selected"</c:if>>거래처 명</option>
							<option value="head_client_in_charge" <c:if test="${'head_client_in_charge' eq search.searchKey }">selected="selected"</c:if>>담당자 명</option>
						</select>
						<!-- 검색어랑 검색버튼 -->
						<input type="text" class="form-control" name="searchItem" id="searchItem" value="${search.searchItem}">
					</div>
					<input type="button" id="searchBtn" name="searchBtn" value="search">
				</form>
			</div>
			<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="dataTable_wrapper fa col-lg-12">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>거래처코드
											<span id="headClientCodeUp" class="fa-sort-up"></span>
											<span id="headClientCodeDown" class="fa-sort-down"></span>
										</th>
										<th>거래처명
											<span id="headClientNameUp" class="fa-sort-up"></span>
											<span id="headClientNameDown" class="fa-sort-down"></span>
										</th>
										<th>담당자명
											<span id="headClientInChargeUp" class="fa-sort-up"></span>
											<span id="headClientInChargeDown" class="fa-sort-down"></span>
										</th>
									</tr>
								</thead>
								<tbody>			
									<c:forEach var="Client" items="${list}">
										<tr>
											<td><a href="viewHeadClientDetail.do?headClientCode=${ Client.headClientCode}">${Client.headClientCode }</a></td>
											<td>${Client.headClientName }</td>
											<td>${Client.headClientInCharge }</td>
										</tr>
									</c:forEach>
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
		<a id="addBtn" class="btn btn-default" href="/addHeadClient.do">신규등록</a>
	</div>
	<!-- /.container-fluid -->
</div>
	
	 
</body>
</html>