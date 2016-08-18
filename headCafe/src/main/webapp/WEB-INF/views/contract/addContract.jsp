<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title> 등록화면</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<h1>계약 신규 등록</h1>
	<form name="addForm" action="/addContract" method="post" enctype="multipart/form-data">
		<div> 
		가맹일련번호: <input type="text" name="subCode" required="required"/> 
		</div>
		<div> 
		계약자명: <input type="text" name="contractorName" required="required"/> 
		</div>
		<div> 
		계약일자: <input type="date" name="contractActualDate" required="required"/> 
		</div>
		<div> 
		계약만료일: <input type="date" name="contractExpiryDate" required="required"/> 
		</div>
		<div> 
		가맹금: <input type="text" name="contractDeposit" required="required"/> 
		</div>
		<div> 
		이익배분율: <input type="number" name="contractProfitPercent" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' /> 
		</div>
		<div> 
		로열티 지급기(일)생략: <input type="text" name="royaltyDeadline" required="required" onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;" style='IME-MODE:disabled;' maxlength=2 /> 
		</div>
		<div> 
		계약서첨부파일: <input type="file" name="file" required="required"/> 
		</div>
		<div> 
		계약차수: <input type="number" name="contractN" required="required" min="1"/> 
		</div>
		<button>등록</button>
	</form>
</body>
</html>