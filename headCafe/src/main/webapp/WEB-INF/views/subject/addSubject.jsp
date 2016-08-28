							<!-- 계정 과목 등록 화면  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.btns{
		 margin-left: 300px;
	}
</style>
<script type="text/javascript" src="/resources/js/comma.js"></script>
<script>
	$(document).ready(function(){
		//폼 유효성
		$('#addBtn').click(function(){
			if ($('#subjectName').val()==""){
				alert("계정과목 명을 입력하세요.");
			}else if ($('#subjectContent').val()==""){
				alert("상세내용을 입력 해주세요.");
			}else {
				$('#addForm').submit();
			}
		});
	});
</script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">계정과목 등록</h1>
		</div>
	</div>
	<form action="/addSubject.do" role="form" method="POST" id="addForm">
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
								<div class="form-group">
									<label>계정과목명</label> 
									<input class="form-control" name="subjectName" required="required" id="subjectName" />
								</div>
								<div class="form-group">
									<label>상세내용</label> 
									<input class="form-control" name="subjectContent" id="subjectContent" />
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<a class="btn btn-default" href="/viewItemList.do">돌아가기</a>
				<input type="button" id="addBtn" class="btn btn-default" value="등록">
			</div>
			</form>
		</div>
	</body>
</html>