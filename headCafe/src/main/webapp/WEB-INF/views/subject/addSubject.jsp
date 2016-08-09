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
<!-- subject에 계정과목을 등록하는 페이지입니다 -->
<h1>계정과목 등록</h1>
	<form name="addForm" action="/addSubject" method="post">
		<div> 
		계정과목명: <input type="text" name="subjectName" required="required"/> 
		</div>
		<div> 
		상세내용: <textarea name="subjectContent"></textarea>
		</div>
		<button>등록</button>
	</form>
</body>
</html>