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
<h1>상품 수정</h1>
	<form id="modifyForm" action="/headModifyItem" method="post">
		<div> 
		상품명: <input type="text" id="hItemName" name="hItemName" value="${item.hItemName}" required="required"/> 
		</div>
		<div> 
		상품코드: <input type="text" id="hItemCode" name="hItemCode" value="${item.hItemCode}" readonly="readonly"/> 
		</div>
		<div> 
		통합코드: <input type="text" value="${item.inteCode}" readonly="readonly"/> 
		</div>
		<div> 
		아이템 갯수: <input type="text" name="hItemQuantity" value="${item.hItemQuantity}" required="required"/> 
		</div>
		<c:if test="${item.hItemUnit eq 'BOX'}">
			<div> 
			단위: <input type="radio" name="hItemUnit" value="BOX" checked="checked"/> 박스
				<input type="radio" name="hItemUnit" value="EX"/> 개별
			</div>
		</c:if>
		<c:if test="${item.hItemUnit eq 'EX'}">
			<div> 
			단위: <input type="radio" name="hItemUnit" value="BOX"/> 박스
				<input type="radio" name="hItemUnit" value="EX" checked="checked"/> 개별
			</div>
		</c:if>
		<div> 
		매입금액: <input type="text" name="hItemPurchasePrice" value="${item.hItemPurchasePrice}" required="required"/> 
		</div>
		<div> 
		이익율: <input type="text" name="hItemMarginPercent" value="${item.hItemMarginPercent*100}" required="required"/>%
		</div>
		<div> 
		가맹에 파는 금액: <input type="text" value="${item.hItemSellingPrice}" readonly="readonly"/>
		</div>
		<div> 
		소비자 금액: <input type="text" name="hItemRetailPrice" value="${item.hItemRetailPrice}" required="required"/> 
		</div>
		<div> 
		매입처: <input type="text" name="headClientCode" value="${item.headClientCode}" required="required"/> 
		</div>
		<button>저장</button>
		<!-- <input type="button" id="modifyBtn" value="저장" /> -->
	</form>
</body>
</html>