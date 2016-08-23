<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#joinBtn {
		background: hsl(50, 100%, 97%);
		display: block; height: auto; margin: 0 auto; 
	}
	
	.phone-group {
		display: inline;
	}
	.list {
		float: right;
		margin-top: 0px;
		padding-top: 0px;
	}
</style>
<script>
$(document).ready(function(){
	
	console.log('길이: '+$('.recipeOrder').length)
	var order = 0;
	var number = 0;
	var orderTemp = 0;
	$('#addRecipeBtn').click(function(){
			order = orderTemp+1;
			number++
			console.log('order:'+number)
		$('#recipeAdd').append('<div> 순서: '+number+'<input type="hidden" id="recipeOrder'+number+'" class="recipeOrder" name="recipeOrderArr" required="required" value="'+number+'" /> <br><p>레시피 내용: <input type="text" class="recipeContent" id="recipeAct'+number+'" name="recipeActArr" required="required" size="40" maxlength="35"/></div>');
	});                                                                                                       
	
	var recipeAct = 0;
	$('#addBtn').click(function(){
		for(var i=1; i<number+1; i++){
			console.log("check ==>"+$('#recipeAct'+i).val());
			
			if($('#recipeAct'+i).val() == ""){ 
				console.log("number::"+number);
				recipeAct++;
			}
		}
		
		if(recipeAct != 0){
			alert('레시피 내용을 입력하세요');
			recipeAct = 0;
		}else{
			$('#addForm').submit();
		}
		
	});
});
</script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">레시피 등록</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form action="/addRecipe.do" role="form" method="POST" id="addForm">
								<div class="form-group">
									<label><strong>메뉴명: ${recipeCommand.menuCode}</strong></label>
									<div class="list"><a href="/viewMenuDetail.do?menuCode=${recipeCommand.menuCode}">목록</a></div> 
								</div>
								<div class="form-group">
									<label>조리순서</label> 
									<div id="recipeAdd"></div>
								</div>
								<div>
									<input type="button" class="btn btn-default" id="addRecipeBtn" value="순서 추가"/>
									<input type="button" class="btn btn-default" id="addBtn" value="저장">
								</div>
								<div>
									<input type="hidden" name="headStaffId" value="${login.headStaffId}">
									<input type="hidden" name="menuCode" value="${recipeCommand.menuCode}">
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