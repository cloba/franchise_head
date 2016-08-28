							<!-- 상품 상세 정보 화면 -->
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
                       		상품 상세
                       		<div class="btn"><a href="/viewItemList.do">목록</a></div>
                       		<div class="btn"><a href="/headModifyItem.do?hItemCode=${item.hItemCode}">&nbsp&nbsp&nbsp수정</a></div>
                        </div>
                         <div class="panel-body">
							<address>
								<p><strong>상품명 : ${item.hItemName}</strong>
								<br>상품코드 : ${item.hItemCode}
								<br>통합코드 : ${item.inteCode}
							</address>
							<br>
							<address>
	                          	<p><strong>상품정보</strong>
	                            <br>개수: ${item.hItemQuantity}
	                            <br>단위: ${item.hItemUnit}
	                            <br>매입가: <fmt:formatNumber value="${item.hItemPurchasePrice}" pattern="#,###"/>
	                            <br>이익률: ${item.hItemMarginPercent*100}%
	                            <br>이익금액: <fmt:formatNumber value="${item.hItemHeadProfit}" pattern="#,###"/>
	                            <br>판매가격: <fmt:formatNumber value="${item.hItemSellingPrice}" pattern="#,###"/>
	                            <br>소비자가격: <fmt:formatNumber value="${item.hItemRetailPrice}" pattern="#,###"/>
							</address>
							<address>
								<p>등록일자: <fmt:parseDate value="${item.hItemRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
											<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
								<br>등록직원: ${item.headStaffId}
								<br>거래처코드: ${item.headClientCode}
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