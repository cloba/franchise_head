							<!-- 직원 리스트 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.nav nav-tabs:HOVER {
	}
	.form-control, .form-group {
		width: 250px;
		height: 31px;
		display: inline;
	}
	p {
		text-align: center;
	}
	#addBtn {
		float: right;
	}
</style>
<script>
	$(document).ready(function(){
		/* 오름차/내림차순 정렬 설정 */
		$('#idUp').click(function(){
			console.log('아이디 내림차순 정렬');
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#idDown').click(function(){
			console.log('아이디 오름차순 정렬');
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#nameUp').click(function(){
			console.log('이름 내림차순 정렬');
			$('#criteria').attr('value','head_staff_name');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#nameDown').click(function(){
			console.log('이름 오름차순 정렬');
			$('#criteria').attr('value','head_staff_name');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#levelUp').click(function(){
			console.log('거래처로 내림차순 정렬');
			$('#criteria').attr('value','head_staff_level');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#levelDown').click(function(){
			console.log('거래처로 오름차순 정렬');
			$('#criteria').attr('value','head_staff_level');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#DepUp').click(function(){
			console.log('거래처로 내림차순 정렬');
			$('#criteria').attr('value','head_staff_dep');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#DepDown').click(function(){
			console.log('거래처로 오름차순 정렬');
			$('#criteria').attr('value','head_staff_dep');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#joinUp').click(function(){
			console.log('가입일 오름차순 정렬');
			$('#criteria').attr('value','head_staff_join');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#joinDown').click(function(){
			console.log('가입일 내림차순 정렬');
			$('#criteria').attr('value','head_staff_join');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#resignUp').click(function(){
			console.log('퇴사일 오름차순 정렬');
			$('#criteria').attr('value','head_staff_resign');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#resignDown').click(function(){
			console.log('퇴사일 내림차순 정렬');
			$('#criteria').attr('value','head_staff_resign');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		
		//검색 유효성
		$('#searchheadStaffBtn').click(function(){
			if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
				alert('검색분류를 선택하고 검색어를 입력해주세요');
			}else{
				$('#HeadStaffSearchForm').submit();
			}
		});
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">직원 목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewHeadStaffList.do">전체목록</a>
					</li>
					<li><a href="/viewResignStaffList.do">퇴사자</a>
					</li>
					<li><a href="/viewHeadStaffList.do">현 직원</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="HeadStaffSearchForm" action="/viewHeadStaffList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 --> 
								<input type="hidden" name="status" value="${search.searchKey}"/>
								
								<div class="form-group">
								<label>키워드검색</label>
								<select class="form-control" id="searchKey" name="searchKey">
									<option value="">::선택::</option>
									<option value="head_staff_id" <c:if test="${'head_staff_id' eq search.searchKey }">selected="selected"</c:if>> 아이디</option>
									<option value="head_staff_name"<c:if test="${'head_staff_name' eq search.searchKey }">selected="selected"</c:if>>이름</option>
									<option value="head_staff_level" <c:if test="${'head_staff_level' eq search.searchKey }">selected="selected"</c:if>>직급</option>
									<option value="head_staff_dep" <c:if test="${'head_staff_dep' eq search.searchKey }">selected="selected"</c:if>>부서</option>
									<option value="head_staff_join" <c:if test="${'head_staff_join' eq search.searchKey }">selected="selected"</c:if>>등록한아이디</option>
								</select>
								<!-- 검색어와 검색버튼 -->
								<input type="text" class="form-control" id="searchItem" name="searchItem" value="${search.searchItem}"/>
								</div>
								<input type="button" class="btn btn-default" id="searchheadStaffBtn" name="searchheadStaffBtn" value="search"/>
							</form>
						</div>
						<!-- /.panel-heading -->
 						<div class="panel-body">
							<div class="dataTable_wrapper fa col-lg-12">
								<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<thead>
										<tr>
											<th>아이디
												<span id="idUp" class="fa-sort-up"></span>
												<span id="idDown" class="fa-sort-down"></span>
											</th>
											<th>이름
												<span id="nameUp" class="fa-sort-up"></span>
												<span id="nameDown" class="fa-sort-down"></span>
											</th>
											<th>직급(권한)
												<span id="levelUp" class="fa-sort-up"></span>
												<span id="levelDown" class="fa-sort-down"></span>
											</th>
											<th>부서
												<span id="DepUp" class="fa-sort-up"></span>
												<span id="DepDown" class="fa-sort-down"></span>
											</th>
											<th>입사일
												<span id="joinUp" class="fa-sort-up"></span>
												<span id="joinDown" class="fa-sort-down"></span>
											</th>
											<c:if test="${headStaff.resignIdentify == 'Y' }">
												<th>퇴사일
													<span id="resignUp" class="fa-sort-up"></span>
													<span id="resignDown" class="fa-sort-down"></span>
												</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="HeadStaff" items="${list}">
											<tr>
												<td><a href="/headStaffDetail.do?headStaffId=${HeadStaff.headStaffId}">${HeadStaff.headStaffId}</a></td>
												<td>${HeadStaff.headStaffName}</td>
												<td>${HeadStaff.headStaffLevel}</td>
												<td>${HeadStaff.headStaffDep}</td>
												<td>${HeadStaff.headStaffJoin}</td>
												<c:if test="${headStaff.resignIdentify == 'Y' }">
													<td>${HeadStaff.headStaffResign}</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
                               </table>
                           </div>
                       </div>
                       <p><a id="more" href="#">더보기&nbsp;&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></a></p>
                       <!-- /.panel-body -->
                   </div>
                   <!-- /.panel -->
               </div>
               <!-- /.col-lg-12 -->
           </div>
           <a id="addBtn" class="btn btn-default" href="/addHeadStaff.do">신규등록</a>
		</div>
         <!-- /.container-fluid -->
     </div>
     </div>
</body>
</html>	