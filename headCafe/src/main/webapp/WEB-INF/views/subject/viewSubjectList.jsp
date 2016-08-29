							<!-- 계정 과목 리스트 화면  -->
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
		//검색 유효성
		$('#searchBtn').click(function(){
			console.log("클릭");
			if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
				alert('검색분류를 선택하고 검색어를 입력해주세요');
			}else{
				$('#subjectList').submit();
			}
		});
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">계정과목 목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewSubjectList.do">전체목록</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 검색 -->
							<form id="subjectList" action="/viewSubjectList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${subjectSearch.status}"/>
								
								<div class="form-group">
									<label>키워드검색</label>
									<select class="form-control" id="searchKey" name="searchKey">
										<option value="">::선택::</option>
										<option value="subject_code" <c:if test="${subjectSearch.searchKey eq 'subject_code'}">selected="selected"</c:if>>계정과목코드</option>
										<option value="subject_name" <c:if test="${subjectSearch.searchKey eq 'subject_name'}">selected="selected"</c:if>>계정과목명</option>
									</select>
									<!-- 검색어와 검색버튼 -->
									<input type="text" class="form-control" id="searchItem" name="searchItem" value="${subjectSearch.searchItem}"/>
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
											<th>계정과목코드</th>
											<th>계정과목명</th>
											<th>상세</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach var="subjectList" items="${subjectList}">
										<tr>
											<td>${subjectList.subjectCode }</td>
											<td>${subjectList.subjectName }</td>
											<td>${subjectList.subjectContent }</td>
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
           
           <a id="addBtn" class="btn btn-default" href="/addSubject.do">신규등록</a>
		</div>
         <!-- /.container-fluid -->
     </div>
     </div>
</body>
</html>