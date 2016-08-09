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
<h1>결제방식 등록</h1>
	<form name="addForm" action="/addPayment" method="post">
		<div> 
		결제방식: <input type="text" name="payMethod" required="required"/> 
		</div>
		<div> 
		수수료: <input type="text" name="profitPercent" required="required"/> 
		</div>
		<button>등록</button>
	</form>
</body>
</html>