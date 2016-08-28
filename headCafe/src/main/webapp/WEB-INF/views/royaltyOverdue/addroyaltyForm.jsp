							<!-- 연체된 로얄티 납부 입력 화면  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

$(document).ready(function(){
	$('#addBtn').click(function(){
		if ($('#royaltyOverdueAddPaid').val() == ""){
			alert("추가납부 금액을 입력해주세요.");
		}else if ($('#royaltyOverdueAddPayDate').val() == ""){
			alert("추가 납부일자를 입력해주세요.");	
		}else {
			$('#addForm').submit();
		}
	});
});	
</script>    
<h1>로얄티 연체 납부</h1>
<form action="/addRoyaltyPay.do" method="POST" id="addForm">
<div id="page-wrapper">
	<div class="container-fluid">
		  <div class="row">
		  	<br/>
		  	<br/>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                       		연체 납부
                       		<div class="btn"><a href="/viewRoyaltyOverdueList.do">목록</a></div>
                        </div>
                         <div class="panel-body">
                            <p>연체코드 : <input type="text" name="royaltyOverdueCode" value="${royaltyOverdue.royaltyOverdueCode}" style="border: 0px;">
                            <p><strong>가맹점명 : ${royaltyOverdue.subName}</strong>
                            <br>
                            <address>
                                <br>계약코드 : ${royaltyOverdue.contractCode}
                                <br>지불상태: <c:if test="${royaltyOverdue.royaltyOverdueStatus == 'N'}">미납</c:if>
											<c:if test="${royaltyOverdue.royaltyOverdueStatus == 'Y'}">완납</c:if>
                            </address>
                            <address>
                            	<strong>남부금액: <input type="text" name="royaltyOverduePaid" value="${royaltyOverdue.royaltyOverduePaid}" style="border: 0px;"></strong>
                            	<br>납부일자: ${royaltyOverdue.royaltyOverduePayDate}
                            	<br>남은금액: <input type="text" name="royaltyOverdueRest" value="${royaltyOverdue.royaltyOverdueRest}" style="border: 0px;">
                            	<br>추가 납부일자: <input type="date" name="royaltyOverdueAddPayDate" value="">
                            	<br>추가 납부금액: <input type="text" name="royaltyOverdueAddPaid" value="">
                            </address>
                            <input type="hidden" name="royaltyOverdueHeadStaffId" value="${login.headStaffId}">
                            <div class="btn"><input type="button" id="addBtn" value="금액 추가"></div>
                           </div>
                           
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
           </div>
       </div>
     </div>
</form>
</body>
</html>