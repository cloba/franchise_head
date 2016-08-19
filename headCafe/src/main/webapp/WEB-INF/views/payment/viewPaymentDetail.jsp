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
                       		>결제방식 상세
                       		<div class="btn"><a href="/viewPaymentList.do">목록</a></div>
                       		<c:if test="${payment.profitStatus eq 'Y'}">
                       			<div class="btn"><a href="/invalidPayment.do?payMethodCode=${payment.payMethodCode}">&nbsp&nbsp&nbsp미적용 변경</a></div>
                       		</c:if>
                        </div>
                         <div class="panel-body">
							<address>
								<p><strong>결제방식 : ${payment.payMethod}</strong>
								<br>결제방식코드 : ${payment.payMethodCode}
								<br>카드수수료 : ${payment.profitPercent}
								<br>적용상태 : ${payment.profitStatus}
							</address>
							<br>
							<address>
								<br>등록직원 : ${payment.headStaffId}
								<br>등록일자 : <fmt:parseDate value="${payment.profitRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
											<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
							</address>
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