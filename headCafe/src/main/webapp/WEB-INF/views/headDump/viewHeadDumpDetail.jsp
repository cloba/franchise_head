<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>HeadDumpDetail</h1>
	<div><label>판매불가 상품코드: </label>${headDump.headDumpCode}</div>
	<div><label>상품코드: </label>${headDump.hItemCode}</div>
	<div><label>개별상품 코드: </label>${headDump.specificItemCode}</div>
	<div><label>폐기 사유: </label>${headDump.headDumpReason}</div>
	<div><label>본사 직원 아이디: </label>${headDump.headStaffId}</div>
	<div><label>폐기 일자: </label>${headDump.headDumpDate}</div>
	
	<div>
		<a href="/modifyHeadDump?headDumpCode=${headDump.headDumpCode}">[수정]</a>	
		<a href="viewHeadDumpList">[되돌아가기]</a>
	</div>	
</body>
</html>