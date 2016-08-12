<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
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
		$('#headClientPhoneSecond').blur(function(){
			if($('#headClientPhoneSecond').val().length ==''){
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
		$('#modifyBtn').click(function(){
			if ($('#hItemCode').val() == ""){
				alert("상품코드를 입력해주세요.");
			}else if ($('#specificItemCode').val() == ""){
				alert("개별상품 코드를 입력 해주세요.");	
			}else if ($('#headDumpReason').val() == ""){
				alert("폐기사유를 입력 해주세요.");
			}else {
				$('#modifyHeadDumpForm').submit();
			}
		});
	});
</script>
<body>
<h1>반품상품 수정 폼</h1>

<form action="/modifyHeadDump" method="POST" id="modifyHeadDumpForm">
		<div>
			<label>판매 불가 상품 코드</label> 
			<input type="text" name="headDumpCode" value="${headDump.headDumpCode }" readonly="readonly">
		</div>
		<div>
			<label>상품코드: </label>
			<input type="text" name="hItemCode" id="hItemCode" value="${headDump.hItemCode }">
			<span id="hItemCodeHelper"></span>
		</div>
		
		<div>
			<label>개별상품 코드: </label>
			<input type="text" name="specificItemCode" id="specificItemCode"  value="${headDump.specificItemCode }">
			<span id="specificItemCodeHelper"></span>
		</div>
		<div>
			<label>폐기 사유: </label>  
			<input type="text" name="headDumpReason" id="headDumpReason" value="${headDump.headDumpReason }">
			<span id="headDumpReasonHelper"></span>
		</div>
		<div>
			<input type="button" value="수정" id="modifyBtn">
		</div>
	</form>
</body>
</html>