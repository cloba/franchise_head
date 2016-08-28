							<!-- 가맹 상세 정보 화면  -->
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
                       		가맹점 상세
                       		<div class="btn"><a href="/viewSubList.do">목록</a></div>
                       		<div class="btn"><a href="/modifySub.do?subCode=${sub.subCode}">&nbsp&nbsp&nbsp수정</a></div>
                        </div>
                        <div class="panel-body">
                          <p>가맹 코드 : ${sub.subCode}
                          <p><strong>가맹점명 : ${sub.subName}</strong>
                          <br>
                          <address>
                              <br>post : ${sub.subPost}
                              <br>${sub.subParcelAddr}
                              <br>${sub.subRoadAddr}
                              <br>
                              <abbr title="Phone">P: </abbr>${sub.subPhoneFirst}-${sub.subPhoneSecond}-${sub.subPhoneThird}
                          </address>
                          <address>
                              <strong>점주명 : ${sub.subOwner}</strong>
						<br>
                          </address>
                          <p>등록직원 : ${sub.headStaffId}
                          <p>등록일자 : <fmt:parseDate value="${sub.subRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
								<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
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