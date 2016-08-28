							<!-- 배송 상세 정보 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>
	.btn {
		float: right;
		margin-top: 0px;
		padding-top: 0px;
	}
</style>

<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<br /> <br />
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						배송 상세
						<div class="btn">
							<a href="/viewDeliveryList.do">목록</a>
						</div>
					</div>
					<div class="panel-body">
						<p>배송 코드 : ${delivery.deliveryCode}
						<p>
							<strong>가맹수령여부 : ${delivery.deliveryReceive}</strong> 
							<br>가맹주문번호: ${delivery.receivedOrderCode} 
							<br>배송일자: 
								<fmt:parseDate value="${delivery.deliveryDate}"	pattern="yyyy-MM-dd HH:mm:ss" var="date" />
								<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
						<address>
							<br>상태 : 
								<c:if test="${delivery.deliveryStatus eq 1}">
									배송준비중
								</c:if>
								<c:if test="${delivery.deliveryStatus eq 2}">
									배송중
								</c:if>
								<c:if test="${delivery.deliveryStatus eq 3}">
									배송완료
								</c:if>
						</address>
						<p>확인직원아이디 : ${delivery.headStaffId}
						<p>
							확인일자 :
								<fmt:parseDate value="${delivery.deliveryConfirmDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date" />
								<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
						<p>반송해당여부 : ${delivery.deliveryReturn}
						<p>배송담당자: ${delivery.deliveryPerson}
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
		</div>
	</div>
</div>
</body>
</html>