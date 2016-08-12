<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		//파일다운로드
		 $("a[name='file']").on("click", function(e){ //파일 이름
             e.preventDefault();
             $('#form').submit();
         });
	});
</script>
<style>
	body{
	 width: 1000px;
	 margin: 0 auto;
	}
</style>
</head>
<body>
<h1>계약 상세</h1>
	<form id="form" action="/downloadContractFile" method="post">
		<input type="hidden" name="contractCode" value="${contract.contractCode}"/>
	</form>
	<table border="1">
		<tr>
			<th>계약코드</th>
			<th>가맹일련번호</th>
			<th>계약자명(점주)</th>
			<th>계약일자</th>
			<th>계약직원아이디</th>
			<th>계약만료일</th>
			<th>가맹금</th>
			<th>이익배분율</th>
			<th>계약서 첨부파일</th>
			<th>계약차수</th>
			<th>계약상태</th>
			<th>계약파기일</th>
			<th>계약파기내용</th>
		</tr>
		<tr>
			<th>${contract.contractCode}</th>
			<th>${contract.subCode}</th>
			<th>${contract.contractorName}</th>
			<th>${contract.contractActualDate}
				<%-- <fmt:parseDate value="${contract.contractActualDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /> --%>
			</th>
			<th>${contract.headStaffId}</th>
			<th>${contract.contractExpiryDate}
				<%-- <fmt:parseDate value="${contract.contractExpiryDate}" pattern="yyyy-MM-dd" var="date"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="both" value=" ${contract.contractExpiryDate}" />  --%>
			</th>
			<th>${contract.contractDeposit}</th>
			<th>${contract.contractProfitPercent}</th>
			<th>
				<a href="#this" name="file">${contract.contractFileOriginalName}</a>
				(${contract.contractFileSize}kb)
			</th>
			<th>${contract.contractN}</th>
			<c:if test="${contract.contractStatus eq '1'}">
				<th>계약중</th>
			</c:if>
			<c:if test="${contract.contractStatus eq '2'}">
				<th>연기</th>
			</c:if>
			<c:if test="${contract.contractStatus eq '3'}">
				<th>파기</th>
			</c:if>
			<c:if test="${contract.contractStatus eq '4'}">
				<th>만료</th>
			</c:if>
			<th>${contract.contractExpiredDate}</th>
			<th>${contract.contractExpireContent}</th>
		</tr>
	</table>
	<c:if test="${contract.contractStatus eq '1'}">
		<a href="/expireContract?contractCode=${contract.contractCode}">[계약파기]</a>
	</c:if>
	<a href="/modifyContract?contractCode=${contract.contractCode}">[수정]</a>
	<a href="/viewContractList">[돌아가기]</a>
</body>
</html>