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
                       		가맹비 상세
                       		 <!-- 만약 로얄티 지급기일을 넘어가면 로얄티 연체에서 관리 해야 하므로 여기서는 로얄티 기입을 못하게 막음. -->
							<div class="btn">
								<c:if test="${royalty.royaltyOverdueIdentify eq 'Y'}">
									 연체로 넘어간 내역입니다
							 	</c:if>
								<c:if test="${royalty.royaltyOverdueIdentify eq 'N'}">
									<div class="btn"><a href="/modifyRoyaltyPay.do?royaltyCode=${royalty.royaltyCode}">로얄티 지불 기입</a></div>
								</c:if>
							</div>
                        </div>
                         <div class="panel-body">
                            <p>일련코드 : ${royalty.royaltyCode}
                            <p><strong>가맹점명 : ${royalty.subName} (${royalty.subCode})</strong>
                            <address>
                                <br>해당월 : ${royalty.royaltyMonth}
                                <br>판매금액 : ${royalty.subPracticalSellPriceMonth}월
                                <br>가맹 이익 금액: ${royalty.subSellProfitMonth}
                                <br>본사에 납부할 금액: ${royalty.headSellProfitBySubMonth}
                                <br>상태: <c:if test="${royalty.royaltyPaid == 'N'}">미납</c:if>
										<c:if test="${royalty.royaltyPaid == 'Y'}">완납</c:if>
								<br>실 납부금액: ${royalty.royaltyActualAmount}
								<br>실 납부날짜: <c:if test="${royalty.royaltyPayActualDate eq null}">미지급</c:if>
											<c:if test="${royalty.royaltyPayActualDate ne null}">${royalty.royaltyPayActualDate}</c:if>
                            </address>
                            <address>
                            	<strong>로열티 납부기일: ${royalty.royaltyDeadline}</strong>
                            	<br>납부여부: ${royalty.royaltyPaid}
                            	<br>담당직원: ${royalty.royaltyHeadStaffId}
                            </address>
                           </div>
                          <!-- /.panel-body -->
                    </div>
                    <div class="btn"><a href="/viewRoyaltyList.do">목록</a></div>
                    <!-- /.panel -->
                </div>
           </div>
       </div>
     </div>
   </body>
</html>