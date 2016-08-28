							<!-- 계약 상세 정보 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.btn {
		float: right;
		margin-top: 0px;
		padding-top: 0px;
	}
	#expireBtn {
		text-align: center;
	}
</style>
<script>
	$(document).ready(function(){
		//파일다운로드
		 $("a[name='file']").on("click", function(e){ //파일 이름
             e.preventDefault();
             $('#form').submit();
         });
	});
</script>
<form id="form" action="/downloadContractFile" method="post">
		<input type="hidden" name="contractCode" value="${contract.contractCode}"/>
</form>
<div id="page-wrapper">
	<div class="container-fluid">
		  <div class="row">
		  	<br/>
		  	<br/>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                       		계약 상세
                       		<div class="btn"><a href="/viewContractList.do">목록</a></div>
                       		<div class="btn"><a href="/modifyContract.do?contractCode=${contract.contractCode}">&nbsp&nbsp&nbsp수정</a></div>
                        </div>
                         <div class="panel-body">
							<address>
								<p><strong>계약코드 : ${contract.contractCode}</strong>
								<br>가맹일련번호 : ${contract.subCode}
								<br>계약자명 : ${contract.contractorName}
								<br>계약일자 : ${contract.contractActualDate}
							</address>
							<br>
							<address>
	                          	<p><strong>계약정보</strong>
	                            <br>가맹금: <fmt:formatNumber value="${contract.contractDeposit}" pattern="#,###"/>
	                            <br>이익배분율: ${contract.contractProfitPercent}
	                            <br>계약차수: ${contract.contractN}
	                            <br>계약상태: <c:if test="${contract.contractStatus eq '1'}">
												계약중
											</c:if>
											<c:if test="${contract.contractStatus eq '2'}">
												연기
											</c:if>
											<c:if test="${contract.contractStatus eq '3'}">
												파기
											</c:if>
											<c:if test="${contract.contractStatus eq '4'}">
												만료
											</c:if>
								<br>계약서 파일: <a href="#this" name="file">${contract.contractFileOriginalName}</a>
											(${contract.contractFileSize}kb)
							</address>
							<c:if test=" ${contract.contractExpiredDate ne null}">
								<address>
									<p>계약파기일: ${contract.contractExpiredDate}
									<br>계약파기내용: ${contract.contractExpireContent}
								</address>
							</c:if>
							<address>
								<p>계약직원: ${contract.headStaffId}
								<br>계약만료일: ${contract.contractExpiryDate}
							</address>
						</div>
                        <!-- /.panel-body -->
                    </div>
                    <c:if test="${contract.contractStatus eq '1'}">
                    	<a id="expireBtn" class="btn btn-default" href="/expireContract?contractCode=${contract.contractCode}">계약파기</a>
                    </c:if>
                    <!-- /.panel -->
                </div>
           </div>
       </div>
     </div>
   </body>
</html>