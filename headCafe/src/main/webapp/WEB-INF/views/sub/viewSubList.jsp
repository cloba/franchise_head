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
		
		$('#subCodeUp').click(function(){
			$('#criteria').val('sub_code');
			$('#upDown').val('ASC');
			$('#subList').submit();
		});
		$('#subCodeDown').click(function(){
			$('#criteria').val('sub_code');
			$('#upDown').val('DESC');
			$('#subList').submit();
		});
		
		$('#regitDateUp').click(function(){
			$('#criteria').val('sub_regit_date');
			$('#upDown').val('ASC');
			$('#subList').submit();
		});
		$('#regitDateDown').click(function(){
			$('#criteria').val('sub_regit_date');
			$('#upDown').val('DESC');
			$('#subList').submit();
		});
		
	});

</script>
<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">가맹점 관리</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<ul class="nav nav-tabs">
			<li class="active"><a href="/viewSubList.do">전체 목록 보기</a>
			</li>
		</ul>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<!-- 거래처 검색 -->
						<form name="subList" id="subList" action="/viewSubList.do" method="post">
							<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
							<input type="hidden" name="criteria" id="criteria" value=""/>
							<input type="hidden" name="upDown" id="upDown" value=""/>
							
							<div class="form-group">
								<label>등록날짜</label>
								<input type="date" class="form-control" id="regitDateStart" name="regitDateStart" value="${subSearch.regitDateStart}"/> ~
								<input type="date" class="form-control" id="regitDateEnd" name="regitDateEnd" value="${subSearch.regitDateEnd}"/> 
								<br/><br/>
								
								<!-- 검색 조건 선택  -->
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="sub_code" <c:if test="${subSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹대표코드</option>
									<option value="sub_name" <c:if test="${subSearch.searchKey eq 'sub_name'}">selected="selected"</c:if>>가맹점명</option>
									<option value="sub_parcle_addr" <c:if test="${subSearch.searchKey eq 'sub_parcle_addr'}">selected="selected"</c:if>>지번주소</option>
									<option value="sub_road_addr" <c:if test="${subSearch.searchKey eq 'sub_road_addr'}">selected="selected"</c:if>>도로명주소</option>
								</select>
								<!-- 검색어 입력과 검색 버튼 -->
								<input type="text" class="form-control" id="searchItem" name="searchItem" value="${subSearch.searchItem}"/>
							</div>
							<button class="btn btn-default"><i class="fa fa-search"></i></button>
						</form>
					</div>
						<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="dataTable_wrapper fa col-lg-12">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>가맹대표코드
											<span id="subCodeUp" class="fa-sort-up"></span>
											<span id="subCodeDown" class="fa-sort-down"></span>
										</th>
										<th>등록직원</th>
										<th>등록날짜
											<span id="regitDateUp" class="fa-sort-up"></span>
											<span id="regitDateDown" class="fa-sort-down"></span>
										</th>
										<th>가맹점명</th>
										<th>주소</th>
									</tr>
								</thead>
								<tbody>			
									<c:forEach var="subList" items="${subList}">
										<tr>
											<th><a href="/viewSubDetail.do?subCode=${subList.subCode}">${subList.subCode}</a></th>
											<th>${subList.headStaffId }</th>
											<th><fmt:parseDate value="${subList.subRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
												<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
											</th>
											<th>${subList.subName }</th>
											<th>${subList.subRoadAddr }</th>
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
	<a class="btn btn-default" href="/addSub.do">신규등록</a>
	</div>
	<!-- /.container-fluid -->
</div>
</body>
</html>