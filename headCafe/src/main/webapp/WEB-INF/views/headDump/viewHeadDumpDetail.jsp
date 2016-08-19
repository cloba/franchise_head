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
                       		상세보기
                       		<div class="btn"><a href="/viewHeadDumpList.do">목록</a></div>
                       		<div class="btn"><a href="/modifyHeadDump.do?headDumpCode=${headDump.headDumpCode}">&nbsp&nbsp&nbsp수정</a></div>
                        </div>
                        <div class="panel-body">
							<address>
								<p><strong>판매불가코드 : ${headDump.headDumpCode}</strong>
								<br>상품코드 : ${headDump.hItemCode}
								<br>개별상품코드 : ${headDump.specificItemCode}
							</address>
							<br>
							<address>
	                          	<p><strong>폐기사유: ${headDump.headDumpReason}</strong>
	                            <br>폐기직원: ${headDump.headStaffId}
	                            <br>폐기일자: 
		                            <fmt:parseDate value="${headDump.headDumpDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
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
                        
                