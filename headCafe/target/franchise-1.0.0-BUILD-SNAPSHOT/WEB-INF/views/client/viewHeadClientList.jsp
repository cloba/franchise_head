<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

$(document).ready(function(){
	/* 오름차/내림차순 정렬 설정 */
	$('#headClientCodeUp').click(function(){
		console.log('거래처 코드 내림차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','DESC');
		$('#HeadClientForm').submit();
	});
	$('#headClientCodeDown').click(function(){
		console.log('거래처 코드 오름차순 정렬');
		$('#criteria').attr('value','head_client_code');
		$('#upDown').attr('value','ASC');
		$('#HeadClientForm').submit();
	});/////////////////////
	$('#headClientNameUp').click(function(){
		console.log('거래처 명 내림차순 정렬');
		$('#criteria').attr('value','head_client_name');
		$('#upDown').attr('value','DESC');
		$('#HeadClientForm').submit();
	});
	$('#headClientNameDown').click(function(){
		console.log('거래처 명 오름차순 정렬');
		$('#criteria').attr('value','head_client_name');
		$('#upDown').attr('value','ASC');
		$('#HeadClientForm').submit();
	});/////////////////////////////
	$('#headClientInChargeUp').click(function(){
		console.log('담당자 명 내림차순 정렬');
		$('#criteria').attr('value','head_client_in_charge');
		$('#upDown').attr('value','DESC');
		$('#HeadClientForm').submit();
	});
	$('#headClientInChargeDown').click(function(){
		console.log('담당자 명 오름차순 정렬');
		$('#criteria').attr('value','head_client_in_charge');
		$('#upDown').attr('value','ASC');
		$('#HeadClientForm').submit();
	});
	
});	
	
</script>
</head>
<body>
	<form action="/viewHeadClientList" id="HeadClientForm">
		<div> 	
			<!-- 검색조건 보내는 곳 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
			<input type="text" value="${search.searchKey}"><br/><br/>
			
			<!-- 검색 조건 선택  -->
			<select name="searchKey">    
				<option value="">선택</option>   
				<option value="head_client_code" <c:if test="${'head_client_code' eq search.searchKey }">selected="selected"</c:if>>거래처 코드</option>
				<option value="head_client_name"<c:if test="${'head_client_name' eq search.searchKey }">selected="selected"</c:if>>거래처 명</option>
				<option value="head_client_in_charge" <c:if test="${'head_client_in_charge' eq search.searchKey }">selected="selected"</c:if>>담당자 명</option>
			</select>
			
			<!-- 검색어랑 검색버튼 -->
			<input type="text" name="searchItem" value="${search.searchItem}">
			<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="검색">
		</div>
	</form>


	<h1>재고 리스트</h1>
	
	<div>
		<label>거래처 코드
			<span id="headClientCodeUp">▲</span>
			<span id="headClientCodeDown">▼</span></label>
		<label>거래처 명
			<span id="headClientNameUp">▲</span>
			<span id="headClientNameDown">▼</span></label>
		<label>담당자 명
			<span id="headClientInChargeUp">▲</span>
			<span id="headClientInChargeDown">▼</span></label>
	</div>
	


 	<c:forEach var="Client" items="${list}">
	 	<div>
		 	<label>${Client.headClientCode }</label>
		 	<label><a href="viewHeadClientDetail?headClientCode=${ Client.headClientCode}">${Client.headClientName }</a></label>
		 	<label>${Client.headClientInCharge }</label>
	 	</div>
	 </c:forEach>
</body>
</html>