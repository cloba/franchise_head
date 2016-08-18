<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                       		판매 상세
                       		<div class="btn"><a href="/viewSellList.do">목록</a></div>
                        </div>
                        <div class="panel-body">
							<p>판매 코드 : ${sell.headSellCode}
							<p>상품메뉴 통합코드 : ${sell.inteCode}
							<p>가맹번호 : ${sell.subCode}
							<br>
							<p>판매수량 : ${sell.headSellQuantity}
							<p>판매그룹번호: ${sell.headSellGroup}
							<p>판매일자: <fmt:parseDate value="${sell.headSellDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
							<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
							<br>
							<p>매입한 가격: ${sell.headSellPurchasePrice}
							<p>판매한 가격: ${sell.headSellSellingPrice}
							<p>본사이익금액: <fmt:formatNumber value="${sell.headSellProfitHead}" pattern="#,###"/>
							<p>수금여부: ${sell.headSellDistr}
							<br>
							<p>마감유무: ${sell.headSellFinal}
							<p>담당직원: ${sell.headSellFinalStaff}
							<p>마감일자: <fmt:parseDate value="${sell.headSellFinalDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
							<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
							<br>
							<p>등록직원: ${sell.headSellFinal}
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
						
			