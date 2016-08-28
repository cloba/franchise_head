							<!-- 직원 상세 정보  화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.btn {
		float: right;
		margin-top: 0px;
		padding-top: 0px;
	}
	#resignBtn {
		text-align: center;
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
                       		직원 정보
                       		<div class="btn"><a href="/viewHeadStaffList.do">목록</a></div>
                       		<div class="btn"><a href="/modifyFormHeadStaff.do?headStaffId=${headStaff.headStaffId}">&nbsp&nbsp&nbsp수정</a></div>
                        </div>
                         <div class="panel-body">
							<address>
								<p><strong>아이디 : ${headStaff.headStaffId}</strong>
								<br>이름 : ${headStaff.headStaffName }
								<br>직급(권한) : ${headStaff.headStaffLevel }
								<br>부서 : ${headStaff.headStaffDep }
								<br>입사일 : ${headStaff.headStaffJoin }
								<c:if test="${HeadStaff.resignIdentify == 'Y' }"> 
									<br>퇴사일 : ${HeadStaff.headStaffResign }
								</c:if>
							</address>
							<br>
							<address>
	                          	<p><strong>개인정보</strong>
	                            <br>연락처: ${headStaff.headStaffPhoneFirst} - ${headStaff.headStaffPhoneSecond } - ${headStaff.headStaffPhoneThird}
	                            <br>우편번호: ${headStaff.headStaffPost}
	                            <br>도로명주소: ${headStaff.headStaffRoadAddr }
	                            <br>지번주소: ${headStaff.headStaffParcleAddr }
							</address>
							<address>
								<p>등록일자: <fmt:parseDate value="${headStaff.headStaffRegitDate }" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
											<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
								<br>등록직원: ${headStaff.headStaffRegitId }
							</address>
						</div>
                        <!-- /.panel-body -->
                    </div>
                    <c:if test="${headStaff.resignIdentify == 'N' }">
                   		<a id="resignBtn" class="btn btn-default" href="/addResignStaff.do?headStaffId=${headStaff.headStaffId}">퇴사등록</a>
                    </c:if>
                    <!-- /.panel -->
                </div>
           </div>
       </div>
     </div>
   </body>
</html>