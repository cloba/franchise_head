							<!-- 거래처 디테일 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#btn {
		float: right;
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
                       		거래처 상세정보
                       		<div id="btn"><a href="/modifyClient.do?headClientCode=${client.headClientCode}">수정</a></div>
                        </div>
                        <div class="panel-body">
                            <p>거래처 코드 : ${client.headClientCode}
                            <p><strong>거래처명 : ${client.headClientName}</strong>
                            <br>
                            <address>
                                <br>post : ${client.headClientPost }
                                <br>${client.headClientParcleAddr }
                                <br>${client.headClientRoadAddr }
                                <br>
                                <abbr title="Phone">P: </abbr>${client.headClientPhoneFirst} - ${client.headClientPhoneSecond } - ${client.headClientPhoneThird }
                            </address>
                            <address>
                                <strong>계약상태 : </strong>
                                <c:if test="${client.headClientContract eq '1'}">계약	 체결 중</c:if>
								<c:if test="${client.headClientContract eq '2'}">계약 중지</c:if>
								<c:if test="${client.headClientContract eq '3'}">계약	 만료</c:if>
								<c:if test="${client.headClientContract eq '4'}">계약	 파기</c:if>
								<br>
								<p>등록직원 : ${client.headStaffId }
								<p>등록날짜 : ${client.headClientRegitDate }
                            </address>
                            <p>담당자 : ${client.headClientInCharge}
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