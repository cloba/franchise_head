<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript"> 

	$(document).ready(function(){
		var target = $('#status').val();
		console.log(target);
		if( target == 1 ){
			$('#option1').attr('selected','selected');
		}else if( target == 2 ){
			$('#option2').attr('selected','selected');
		}else if( target == 3 ){
			$('#option3').attr('selected','selected');
		}else if( target == 4 ){
			$('#option4').attr('selected','selected');
		};
	});
	
</script>
<h1>계약 수정</h1>
	<form id="modifyForm" action="/modifyContract" method="POST">
		<div> 
		계약코드: <input type="text" name="contractCode" value="${contract.contractCode}" readonly="readonly"/> 
		</div>
		<div> 
		가맹일련번호: <input type="text" id="subCode" name="subCode" value="${contract.subCode}" readonly="readonly"/> 
		</div>
		<div> 
		계약상태: 
			<select id="contractStatus" name="contractStatus">
				<option id="option1" value="1">계약중</option>
				<option id="option2" value="2">계약연기</option>
				<option id="option3" value="3">계약파기</option>
				<option id="option4" value="4">계약만료</option>
			</select>
		</div>
		<div> 
		계약서 첨부파일: ${contract.contractFileOriginalName}<input type="file" name="file" required="required"/> 
		</div>
		<input type="submit" value="수정"/>
	</form>
</body>
</html>