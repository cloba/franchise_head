<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이템 등록화면</title>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- 상품 더블 클릭시 수정 페이지가 open 되는 함수가 있는 js파일 -->
<script type="text/javascript" src="resources/js/itemListPop.js"></script>
<!-- head_item에 아이템을 등록하는 페이지입니다 -->
<h1>아이템 등록</h1>
	<form name="addForm" action="/headAddItem" method="post">
		<div> 
		상품명: <input type="text" name="hItemName" required="required" /> 
		</div>
		<div> 
		아이템 갯수: <input type="text" name="hItemQuantity" required="required"/> 
		</div>
		<div> 
		단위: <input type="radio" name="hItemUnit" value="BOX" required="required"/> 박스
			<input type="radio" name="hItemUnit" value="EX"/> 개별
		</div>
		<div> 
		매입금액: <input type="text" name="hItemPurchasePrice" required="required"/> 
		</div>
		<div> 
		이익율: <input type="text" name="hItemMarginPercent" required="required" /> %
		</div>
		<div> 
		소비자 금액: <input type="text" name="hItemRetailPrice" required="required" /> 
		</div>
		<div> 
		매입처: <input type="text" name="headClientCode" required="required" /> 
		</div>
		<input type="submit" onclick="sendTxt()" value="저장">
	</form>
</body>
</html>