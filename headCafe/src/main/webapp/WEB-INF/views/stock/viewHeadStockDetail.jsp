<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
                       		재고상세
                       		<div class="btn"><a href="/viweHeadStockList.do">목록</a></div>
                       	</div>
                        <div class="panel-body">
							<p><strong>개별상품코드 : ${stock.specificItemCode }</strong>
							<p>상품코드 : ${stock.hItemCode }
							<br>
							<p>매입일자: ${stock.headBuyDate }
							<p>등록일자: ${stock.headStockRegitDate }
							<p>등록직원: ${stock.headStaffId }
							<br><br>
							<p>유통기한: <c:if test="${stock.headStockInExpiryDate != null}">
											${stock.headStockInExpiryDate }
										</c:if>
										<c:if test="${stock.headStockInExpiryDate == null}">
											유통기한 없음
										</c:if>
							<p>입고일자: <fmt:parseDate value="${stock.headStockInDate }" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
										<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
							<p>출고여부: ${stock.headStockItemOut }
							<p>반품해당여부: ${stock.headStockReturn }
							<p>판매불가상품여부: ${stock.headDumpWhether }
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