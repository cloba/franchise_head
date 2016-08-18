<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script type="text/javascript" src="resources/js/addressAPI.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	#btn {
		float: right;
	}

	/* .phoneSelect{

		width: 10%;
		float: left;
		}
	.phoneLine{
		float:left;
		width:5%;
		
	}
	.phone{
		width: 100%;
	} */
	
	.post{
		display: inline;
	}
	
	.buttons{
		text-align: right;
	}
</style>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">가맹 정보 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					Sub information 
					<span id="btn">
						<a href="/viewSubList.do">돌아가기</a>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form id="modifyForm" role="form" action="/modifySub.do" method="POST">
								<div class="form-group">
									<label>가맹점코드</label> 
									<input class="form-control" name="subCode" id="subCode" value="${sub.subCode}" readonly="readonly"/>
								</div>
								<div class="form-group">
									<label>가맹점명</label> 
									<input class="form-control" name="subName" id="subName" value="${sub.subName}" required="required"/>
								</div>
								<div class="form-group">
									<label>점주명</label> 
									<input class="form-control" name="subOwner" id="subOwner" value="${sub.subOwner}" required="required"/>
								</div>
								<div class="form-group">
									<label>전화</label> 
									<input class="form-control" name="subPhoneFirst" id="subPhoneFirst" value="${sub.subPhoneFirst}" required="required"/> - 
									<input class="form-control" name="subPhoneSecond" id="subPhoneSecond" value="${sub.subPhoneSecond}" required="required"/> - 
									<input class="form-control" name="subPhoneThird" id="subPhoneThird" value="${sub.subPhoneThird}" required="required"/>
								</div>
								<div class="form-group">
									<label>우편번호</label> 
									<div class="post">
										<input type="text" class="form-control" id="sample4_postcode" name="subPost" style="width: 300px" readonly="readonly" value="${sub.subPost}" /> 
										<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-default" value="우편번호 찾기" />
									</div>
								</div>
								<div class="form-group">
									<label>도로명 주소</label> 
									<input class="form-control" id="sample4_roadAddress" name="subRoadAddr" style="width: 300px" readonly="readonly" value="${sub.subRoadAddr}" />
								</div>
								<div class="form-group">
									<label>지번 주소</label> 
									<input class="form-control" id="sample4_jibunAddress" name="subParcelAddr" style="width: 300px" value="${sub.subParcelAddr}" readonly="readonly" />
								</div>
								<div class="buttons">
									<input type="submit" id="modifyFormBtn" class="btn btn-default" value="저장">
								</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>