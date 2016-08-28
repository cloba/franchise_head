							<!-- 본사 메뉴 정보 수정  화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>
</style>
<style>
	#btn {
		float: right;
	}
	.post{
		display: inline;
	}
	
	.buttons{
		text-align: right;
	}
</style>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script>

	$(document).ready(function(){
		
		console.log('길이: '+$('.ingreName').length)
		
		$('#addIngreBtn').click(function(){
			
			if( $('.ingreName').length < 1 ){
				var orderTemp = 0;
			}else{
				var orderTemp = eval($(".ingreName:last").attr('id').replace("ingreName",""));
				var order = orderTemp+1;
				console.log('order: '+order);
				
			}
			
			$('#addIngreDiv').append('<div> 재료명: <input type="text" id="ingreName'+order+'" class="ingreName" name="hItemCodeArr" required="required" /> 사용량: <input type="text" name="ingreAmountArr" required="required"/> <p id="unit'+order+'"></p></div>');
			
			var id = 'ingreName'+order;
			var unit = 'unit'+order;
			
			$(function() {
				$('#'+id).autocomplete({
					source : function(request, response) {
						$.ajax({
							url : "/searchIngre.do",
							dataType : "json",
							data : {
								ingreName: $('#'+id).val()
							},
							success : function(json) {
								console.log('성공');
								response($.map(json, function(data){
									
									//재료에 따른 단위를 표시합니다
									$('#'+unit).text(data.hItemAmountUnit);
									return{
										label : data.hItemName,
										value : data.hItemCode
									};
								}));
							},
							error : function(json){
								alert("err" + json);
							}
						});
					},
				});
			});   

		});
		
	});
</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">메뉴 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					menu
					<span id="btn">
						<a href="/viewMenuDetail.do?menuCode=${menu.menuCode}">돌아가기</a>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form role="form" action="/headModifyMenu.do" method="POST">
								<div class="form-group">
									<label>메뉴명</label> 
									<input class="form-control" name="menuName" id="menuName" value="${menu.menuName }" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>소비자가격(원)</label> 
									<input class="form-control" name="menuSellingPrice" value="${menu.menuSellingPrice}" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' type="text"/>
								</div>
								<br><br>
								<div id="addIngreDiv"></div>
								<c:forEach var="ingreList" items="${ingreList}">
									<div class="form-group">
										<strong>재료정보</strong>
										<label>재료이름</label> 
										<input class="form-control" id="ingreName0" class="ingreName" name="hItemCodeArr" value="${ingreList.ingreName}" required="required"/>
									</div>
									<div class="form-group">
										<label>사용량</label> 
										<input class="form-control" name="ingreAmountArr" value="${ingreList.ingreAmount}" required="required"/>
										<p id="unit0"></p>
									</div>
								</c:forEach>
								<div class="buttons">
									<input type="button" id="addIngreBtn" class="btn btn-default" value="재료추가">
									<input type="submit" class="btn btn-default" value="저장">
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>