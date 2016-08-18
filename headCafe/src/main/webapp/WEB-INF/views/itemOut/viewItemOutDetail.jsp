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
		  	<br/><br/>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                       		출고 상세
                       		<div class="btn"><a href="/viewItemOutList.do">목록</a></div>
                        </div>
						<div class="panel-body">
							<p>출고 코드 : ${itemOut.headOutCode}
							<p>출고 그룹 : ${itemOut.headOutGroup}
							<p><strong>가맹코드 : ${itemOut.storeCode}</strong>
							<p>가맹발주번호: ${itemOut.ordersCode}
							<p>상품개별코드 : ${itemOut.specificItemCode}
							<p>상품코드: ${itemOut.specificItemCode}
							<br>
							<p>출고날짜: <fmt:parseDate value="${itemOut.headOutDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
										<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
							<p>담당 직원: ${itemOut.headStaffSender}
							<p>확인 직원: ${itemOut.headStaffCheck}
							<p><strong>배송상태: </strong>
								<c:choose>
									<c:when test="${itemOut.headOutStatus eq 1}">
										<th>가맹요청</th>
									</c:when>
									<c:when test="${itemOut.headOutStatus eq 2}">
										<th>배송준비중</th>
									</c:when>
									<c:when test="${itemOut.headOutStatus eq 3}">
										<th>배송완료</th>
									</c:when>
									<c:otherwise>
										<th>가맹 수령완료</th>
									</c:otherwise>
								</c:choose>
							</p>
						</div>
                    </div>
                </div>
           </div>
       </div>
     </div>
   </body>
</html>