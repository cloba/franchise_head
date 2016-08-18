<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
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
			if ($('#hItemCode').val() == ""){
				alert("상품코드를 입력해주세요.");
			}else if ($('#specificItemCode').val() == ""){
				alert("개별상품 코드를 입력 해주세요.");	
			}else if ($('#headDumpReason').val() == ""){
				alert("폐기사유를 입력 해주세요.");
			}else {
				$('#joinForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<form action="/addHeadDump.do" method="POST" id="joinForm">
		<div>
			<label>상품코드: </label>
			<input type="text" name="hItemCode" id="hItemCode">
			<span id="hItemCodeHelper"></span>
		</div>
		
		<div>
			<label>개별상품 코드: </label>
			<input type="text" name="specificItemCode" id="specificItemCode">
			<span id="specificItemCodeHelper"></span>
		</div>
		<div>
			<label>폐기 사유: </label>  
			<input type="text" name="headDumpReason" id="headDumpReason">
			<span id="headDumpReasonHelper"></span>
		</div>
		<div>
			<input type="button" value="등록" id="headDumpBtn">
		</div>
	</form>
</body>
</html>