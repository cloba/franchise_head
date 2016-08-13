<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>반품상품 디테일</h1>
	<div><label>반품 코드 : </label>${returns.returnsCode}</div><br/>	
	<div><label>가맹발주 번호 : </label>${returns.ordersCode}</div>
	<div><label>개별상품코드 : </label>${returns.specificItemCode}</div>
	<div><label>반품사유 : </label>${returns.returnsReason}</div>
	<div><label>반품가격 : </label>${returns.returnsPrice}</div>
	<div><label>가맹보고날짜 : </label>${returns.returnsReportDate}</div>
	<div><label>본사확인 : </label>
			<c:if test="${returns.returnsHeadCheck eq 'N'}">			   확인 안함			       </c:if>
			<c:if test="${returns.returnsHeadCheck eq 'Y'}">           확인 함                                    </c:if></div>
	<div>
			<c:if test="${returns.returnsHeadCheckDate ne null}"><label>본사확인날짜 : </label></c:if> 
			<c:if test="${returns.returnsHeadCheckDate ne null}">   ${returns.returnsHeadCheckDate}</c:if></div>
			
	
	<div><label>확인한 직원 아이디 : </label>${returns.headStaffId}</div>
	<div><label>재배송 요청 유무 :  </label>
			<c:if test="${returns.returnsReDelivery eq 'N'}">			    환불 요청(재배송 아님)			          </c:if>
			<c:if test="${returns.returnsReDelivery eq 'Y'}">              재배송 요청                                    </c:if></div>
	<div><label>반품 취소 여부 : </label>
			<c:if test="${returns.returnsCancel eq 'N'}">			   반품 진행 중			       </c:if>
			<c:if test="${returns.returnsCancel eq 'Y'}">              반품 취소                                 </c:if></div>

	<div><label>본사 확인 여부 : </label>${returns.returnsApproval}</div>
	<!-- 본사가 반품 첫 확인 했다는 버튼(물건 보고 승인 아님)   -->
	<div>
	<c:if test="${returns.returnsApproval=='N'}">
		<a href="/modifyReturnsApproval?returnsCode=${returns.returnsCode}&returnsApprovalIdenfity=Y">[승인]</a>
	</c:if>	
	<c:if test="${returns.returnsApproval=='Y'}">
		<a href="/modifyReturnsApproval?returnsCode=${returns.returnsCode}&returnsApprovalIdenfity=N">[승인 취소]</a>
	</c:if>	
		<a href="/viewReturnsList">[되돌아가기]</a>
	</div>
</body>
</html>