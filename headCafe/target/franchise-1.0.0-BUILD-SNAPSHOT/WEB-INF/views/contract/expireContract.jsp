<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계약파기사유</h1>
<form action="/expireContract" method="post">
	계약번호: ${code}
	<input type="hidden" name="contractCode" value="${code}"/>
	<textarea name="contractExpireContent" rows="10" cols="30"></textarea>
	<button>확인</button>
</form>

</body>
</html>