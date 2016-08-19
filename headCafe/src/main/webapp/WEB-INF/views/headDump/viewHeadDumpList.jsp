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
	$(document).ready(function() {
		/* 오름차/내림차순 정렬 설정 */
		$('#headDumpCodeUp').click(function() {
			$('#criteria').attr('value', 'head_dump_code');
			$('#upDown').attr('value', 'DESC');
			$('#headDumpForm').submit();
		});
		$('#headDumpCodeDown').click(function() {
			$('#criteria').attr('value', 'head_dump_code');
			$('#upDown').attr('value', 'ASC');
			$('#headDumpForm').submit();
		});//
		$('#hItemCodeUp').click(function() {
			$('#criteria').attr('value', 'h_item_code');
			$('#upDown').attr('value', 'DESC');
			$('#headDumpForm').submit();
		});
		$('#hItemCodeDown').click(function() {
			$('#criteria').attr('value', 'h_item_code');
			$('#upDown').attr('value', 'ASC');
			$('#headDumpForm').submit();
		});//
		$('#specificItemCodeUp').click(function() {
			$('#criteria').attr('value', 'specific_item_code');
			$('#upDown').attr('value', 'DESC');
			$('#headDumpForm').submit();
		});
		$('#specificItemCodeDown').click(function() {
			$('#criteria').attr('value', 'specific_item_code');
			$('#upDown').attr('value', 'ASC');
			$('#headDumpForm').submit();
		});//
		$('#headStaffIdUp').click(function() {
			$('#criteria').attr('value', 'head_staff_id');
			$('#upDown').attr('value', 'DESC');
			$('#headDumpForm').submit();
		});
		$('#headStaffIdDown').click(function() {
			$('#criteria').attr('value', 'head_staff_id');
			$('#upDown').attr('value', 'ASC');
			$('#headDumpForm').submit();
		});
		$('#headDumpDateUp').click(function() {
			$('#criteria').attr('value', 'head_dump_date');
			$('#upDown').attr('value', 'DESC');
			$('#headDumpForm').submit();
		});
		$('#headDumpDateDown').click(function() {
			$('#criteria').attr('value', 'head_dump_date');
			$('#upDown').attr('value', 'ASC');
			$('#headDumpForm').submit();
		});
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">판매불가 상품목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewHeadDumpList.do">전체목록</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="headDumpForm" action="/viewHeadDumpList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.status}"/>
								
								<div class="form-group">
								<label>키워드</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="head_dump_code"
										<c:if test="${'head_dump_code' eq search.searchKey }">selected="selected"</c:if>>판매불가
										상품코드</option>
									<option value="h_item_code"
										<c:if test="${'h_item_code' eq search.searchKey }">selected="selected"</c:if>>상품코드</option>
									<option value="specific_item_code"
										<c:if test="${'specific_item_code' eq search.searchKey }">selected="selected"</c:if>>개별상품
										코드</option>
									<option value="head_staff_id"
										<c:if test="${'head_staff_id' eq search.searchKey }">selected="selected"</c:if>>본사
										직원 아이디</option>
									<option value="head_dump_date"
										<c:if test="${'head_dump_date' eq search.searchKey }">selected="selected"</c:if>>폐기
										일자</option>
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
												<th>판매불가코드
													<span id="headDumpCodeUp" class="fa-sort-up"></span>
													<span id="headDumpCodeDown" class="fa-sort-down"></span>
												</th>
												<th>상품코드
													<span id="hItemCodeUp" class="fa-sort-up"></span>
													<span id="hItemCodeDown" class="fa-sort-down"></span>
												</th>
												<th>개별상품코드
													<span id="specificItemCodeUp" class="fa-sort-up"></span>
													<span id="specificItemCodeDown" class="fa-sort-down"></span>
												</th>
												<th>폐기사유</th>
												<th>폐기일자
													<span id="headDumpDateUp" class="fa-sort-up"></span>
													<span id="headDumpDateDown" class="fa-sort-down"></span>
												</th>
												<th>확인직원</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="headDump" items="${headDumpList}">
												<tr>
													<td><a href="/viewHeadDumpDetail.do?headDumpCode=${headDump.headDumpCode}">${headDump.headDumpCode}</a></td>
													<td>${headDump.hItemCode}</td>
													<td>${headDump.specificItemCode}</td>
													<td>${headDump.headDumpReason}</td>
													<td><fmt:parseDate value="${headDump.headDumpDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
														<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></td>
													<td>${headDump.headStaffId}</td>
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
           <a id="addBtn" class="btn btn-default" href="/addHeadDump.do">신규등록</a>
		</div>
         <!-- /.container-fluid -->
     </div>
     </div>
</body>
</html>