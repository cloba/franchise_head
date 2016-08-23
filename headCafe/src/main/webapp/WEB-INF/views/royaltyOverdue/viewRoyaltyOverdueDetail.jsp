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
                       		연체 상세
                       		<div class="btn">
                       			<a href="/viewRoyaltyOverdueList.do">목록</a>
                       			<a href="/addRoyaltyPay.do?royaltyOverdueCode=${royaltyOverdue.royaltyOverdueCode}">연체납부</a>
                       		</div>
                        </div>
                         <div class="panel-body">
                            <p>연체코드 : ${royaltyOverdue.royaltyOverdueCode}
                            <p><strong>가맹점명 : ${royaltyOverdue.subName}</strong>
                            <br>
                            <address>
                                <br>계약코드 : ${royaltyOverdue.contractCode}
                                <br>지불상태: <c:if test="${royaltyOverdue.royaltyOverdueStatus == 'N'}">미납</c:if>
											<c:if test="${royaltyOverdue.royaltyOverdueStatus == 'Y'}">완납</c:if>
                            </address>
                            <address>
                            	<strong>남부금액: ${royaltyOverdue.royaltyOverduePaid}</strong>
                            	<br>납부일자: ${royaltyOverdue.royaltyOverduePayDate}
                            	<br>남은금액: ${royaltyOverdue.royaltyOverdueRest}
                            	<br>로얄티 연체 담당 직원: ${royaltyOverdue.royaltyOverdueHeadStaffId}
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