							<!-- 판매 불가 상품 입력 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<style>
	#joinBtn {
		background: hsl(50, 100%, 97%);
		display: block; height: auto; margin: 0 auto; 
	}
	.btns{
		 margin-left: 300px;
	}
</style>
<script>
	$(document).ready(function(){
		//상품코드 유효성
		$('#hItemCode').blur(function(){
			if($('#hItemCode').val().length ==''){
				if( $('#nameHelper').hide()){
					$('#nameHelper').show();
				}
				$('#nameHelper').css('color','red');
				$('#nameHelper').text('상품코드를 입력해주세요.');
			}else{
				$('#nameHelper').hide();
			}
			
		});
		
		//개별상품코드 유효성
		$('#specificItemCode').blur(function(){
			if($('#specificItemCode').val().length ==''){
				if( $('#specificItemCodeHelper').hide()){
					$('#specificItemCodeHelper').show();
				}
				$('#specificItemCodeHelper').css('color','red');
				$('#specificItemCodeHelper').text('개별상품 코드를 입력해주세요.');
			}else{
				$('#specificItemCodeHelper').hide();
			}
			
		});
		//폐기사유 유효성
		$('#headDumpReason').blur(function(){
			if($('#headDumpReason').val().length ==''){
				if( $('#headDumpReasonHelper').hide()){
					$('#headDumpReasonHelper').show();
				}
				$('#headDumpReasonHelper').css('color','red');
				$('#headDumpReasonHelper').text('폐기사유를 입력해주세요.');
			}else{
				$('#headDumpReasonHelper').hide();
			}
			
		});
		
		// 폼 제출
		$('#headDumpBtn').click(function(){
			if ($('#specificItemCode').val() == ""){ 
				alert("개별상품 코드를 입력 해주세요.");  
			}else if ($('#hItemCode').val() == ""){  
				alert(" 상품코드를 입력해주세요.");	 
			}else if ($('#headDumpReason').val() == ""){
				alert("폐기사유를 입력 해주세요.");
			}else {
				$('#joinForm').submit();
			}
		});
		
		//개별상품코드 유효성
		$('#specificItemCodeIdentifyBtn').click(function(){
		
			$.ajax({
            	type      : "POST",
             	url      : "/specificHItemCodeCheck.do",
            	data      : { specificItemCode   : $('#specificItemCode').val() },
             	dataType   : "JSON",
             	success   : function(json) {
                	console.log(json.hItemCode);
                	alert(json.hItemCode);
                	$('#hItemCode').attr('value','');
                	$('#hItemCode').attr('value',json.hItemCode);
                   /* $('#loginForm').attr('action',"/LoginController");
                   $('#loginForm').attr('method',"post");
                   $('#loginForm').submit();
                   alert('개별상품 코드가 맞지 않습니다.'); */
                	//$('#specificItemCode').val('');
                },
                error : function(json){
                	$('#hItemCode').attr('value','');
                //	$('#specificItemCodeHelper').innerHTML=''
                	$('#specificItemCodeHelper').css('color','red');
                	$('#specificItemCodeHelper').show();
                	$('#specificItemCodeHelper').text("개별상품코드를 정확히 쓰세요");
                //	$('#specificItemCodeHelper').val('원하는 값');
                //	$('#upDown').attr('value', 'DESC');



                	console.log(json);
                }
       		});
		});
	});
</script>
</head>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">신규등록</h1>
		</div>
	</div>
	<form action="/addHeadDump.do" role="form" method="POST" id="joinForm">
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label>개별상품코드</label> 
								<input class="form-control" name="specificItemCode" id="specificItemCode" required="required" /> <input type="button" id="specificItemCodeIdentifyBtn" value="개별상품코드 확인" style="margin-top: 10px;"><br>
								<span id="specificItemCodeHelper"></span>
							</div>
							<div class="form-group">
								<label>상품코드</label> 
								<input class="form-control" name="hItemCode" id="hItemCode" required="required" readonly="readonly"/> 
								<span id="hItemCodeHelper"></span>
							</div>
							<div class="form-group">
								<label>폐기사유</label> 
								<input class="form-control" name="headDumpReason" id="headDumpReason" required="required" />
								<span id="headDumpReasonHelper"></span>
							</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btns">
				<input type="hidden" name="headStaffId" value="${login.headStaffId}">
				<a class="btn btn-default" href="/viewHeadDumpList.do">돌아가기</a>
				<input type="button" id="headDumpBtn" class="btn btn-default" value="등록">
			</div>
			</form>
		</div>
	</body>
</html>