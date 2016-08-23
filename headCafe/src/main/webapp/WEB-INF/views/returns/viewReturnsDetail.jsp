<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		  	<br/>
		  	<br/>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                       		반품 상세
                       		<div class="btn"><a href="/viewReturnsList.do">목록</a></div>
                       		<div class="btn"><c:if test="${returns.returnsApproval=='N'}">
												<a href="/modifyReturnsApproval.do?returnsCode=${returns.returnsCode}&returnsApprovalIdenfity=Y&returnsGroupCode=${returns.returnsGroupCode}&headStaffId=${login.headStaffId}">승인하기</a>
											</c:if></div>
                        </div>
                         <div class="panel-body">
							<address>
								<p><strong>반품코드 : ${returns.returnsCode}</strong>
								<br>개별상품코드 : ${returns.specificItemCode}
								<br>가맹주문번호 : ${returns.ordersCode}
								<br>주문받은 코드 : ${returns.receivedOrderCode}
							</address>
							<br>
							<address>
	                          	<p><strong>반품정보</strong>
	                            <br>반품사유: ${returns.returnsReason}
	                            <br>반품그룹코드: ${returns.returnsGroupCode}
	                            <br>금액: <fmt:formatNumber value="${returns.returnsPrice}" pattern="#,###"/>
							</address>
							<address>
								<p>가맹 보고일자: <fmt:parseDate value="${returns.returnsReportDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
											<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
								<br>본사 확인: <c:if test="${returns.returnsHeadCheck eq 'N'}">확인하지 않음</c:if>
												<c:if test="${returns.returnsHeadCheck eq 'Y'}">확인완료 </c:if>
								<c:if test="${returns.returnsHeadCheckDate ne null}">
									<br>확인일자: ${returns.returnsHeadCheckDate}
									<br>확인직원: ${returns.headStaffId}
								</c:if>
							</address>
							<address>
	                          	<p><strong>기타</strong>
	                            <br>재배송 요청여부: <c:if test="${returns.returnsReDelivery eq 'N'}">환불만 요청됨</c:if>
												<c:if test="${returns.returnsReDelivery eq 'Y'}">재배송 요청됨</c:if>
							</address>
							<p><strong>상태: <c:if test="${returns.returnsCancel eq 'N'}">반품 진행 중</c:if>
													<c:if test="${returns.returnsCancel eq 'Y'}">반품 취소 </c:if>
								</strong>
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
								