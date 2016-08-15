<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>�ξ�Ƽ ������</h1>

	<div>
		<label>�ο�Ƽ���� �ڵ� : </label>
		<input type="text" name="royaltyCode" value="${royalty.royaltyCode}" readonly="readonly">
	</div><br/>	
	
	<div>
		<label>���� �� ���� : </label>
		<input type="text" name="subName" value="${royalty.subName}" readonly="readonly">
	</div>

	<div>
		<label>����ڵ� : </label>
		<input type="text" name="contractCode" value="${royalty.contractCode}" readonly="readonly">
	</div>

	<div>
		<label>�ش�� : </label>
		<input type="text" name="royaltyMonth" value="${royalty.royaltyMonth}" readonly="readonly">
	</div>
		
	<div>
		<label>���ʹ�ǥ�ڵ� : </label>
		<input type="text" name="subCode" value="${royalty.subCode}" readonly="readonly">	
	</div>
		
	<div>
		<label>�ο�Ƽ ���� ���� : </label>
		<input type="text" name="royaltyDeadline" value="${royalty.royaltyDeadline}" readonly="readonly">	
	</div>
	
	<div>
		<label>�ο�Ƽ ���� ���� : </label>
		<input type="text" name="royaltyPaid" value="${royalty.royaltyPaid}" readonly="readonly">
	</div>
	
	<div>
		<label>�ش� �� ���� �Ǹ� �ݾ� : </label>
		<input type="text" name="subPracticalSellPriceMonth" value="${royalty.subPracticalSellPriceMonth}" readonly="readonly">	
	</div>
	
	<div>
		<label>�ش� �� ���� ���� �ݾ� : </label>
		<input type="text" name="subSellProfitMonth" value="${royalty.subSellProfitMonth}" readonly="readonly">
	</div>
	
	<div>
		<label>�ش� �� �� ���Ϳ� ���Ѻ��� �ξ�Ƽ : </label>
		<input type="text" name="headSellProfitBySubMonth" value="${royalty.headSellProfitBySubMonth}" readonly="readonly">
	</div>

	<div>
		<label>�ش���� ���� ������ �ݾ� : </label>
		<input type="text" name="royaltyActualAmount" value="${royalty.royaltyActualAmount}" readonly="readonly">
	</div>

	<div>
		<label>���� ���� ��¥ : </label>
		<c:if test="${royalty.royaltyPayActualDate eq null}">	������			</c:if>
		<c:if test="${royalty.royaltyPayActualDate ne null}">						
			<input type="text" name="royaltyPayActualDate" value="${royalty.royaltyPayActualDate}">	
		</c:if>
	</div><br>
	
	<!-- ���� �ξ�Ƽ ���ޱ����� �Ѿ�� �ξ�Ƽ ��ü���� ���� �ؾ� �ϹǷ� ���⼭�� �ξ�Ƽ ������ ���ϰ� ����. -->
	<div>
		<c:if test="${royalty.royaltyOverdueIdentify eq 'Y'}">
			 [�ξ�Ƽ ��ü�� �Ѿ���Ƿ�, �ξ�Ƽ ���� ���� �Ұ�]
	 	</c:if>
		<c:if test="${royalty.royaltyOverdueIdentify eq 'N'}">
			<a href="/modifyRoyaltyPay.do?royaltyCode=${royalty.royaltyCode}">[�ξ�Ƽ ���� ����]</a>
		</c:if>
	</div>
	
</body>
</html>