<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- 검색과 정렬 유효성 검사하는 함수가 있는 js파일 -->
<script type="text/javascript" src="resources/js/validation.js"></script>
<style>
	.nav nav-tabs:HOVER {
		
	}
	
	.form-control, .form-group {
		width: 250px;
		height: 31px;
		display: inline;
	}
	
	#p {
		text-align: center;
	}
	
</style>
<script>

	$(document).ready(function(){
		
		$('#codeUp').click(function(){
			$('#criteria').val('head_sell_code');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#codeDown').click(function(){
			$('#criteria').val('head_sell_code');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
		$('#groupUp').click(function(){
			$('#criteria').val('head_sell_group');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#groupDown').click(function(){
			$('#criteria').val('head_sell_group');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
		$('#dateUp').click(function(){
			$('#criteria').val('head_sell_date');
			$('#upDown').val('ASC');
			$('#sellList').submit();
		});
		$('#dateDown').click(function(){
			$('#criteria').val('head_sell_date');
			$('#upDown').val('DESC');
			$('#sellList').submit();
		});
		
	});

</script>
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">판매내역</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                 <div class="panel-body">
                 <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                     <li class="active"><a href="/viewSellList.do">전체내역</a>
                     </li>
                     <li><a href="/viewSellList.do?status=N">마감 전 내역</a>
                     </li>
                     <li><a href="/viewSellList.do?status=Y">마감 된 내역</a>
                     </li>
                 </ul> 
                
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          	<!-- 판매 내역 검색 -->
							<form name="sellList" id="sellList" action="/viewSellList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${search.status}"/>
								
								<div class="form-group">
									<label>판매일자</label>
									<input type="date" class="form-control" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
									<input type="date" class="form-control" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
									<br/><br/>
									<label>키워드검색</label>
									<select class="form-control" id="searchKey" name="searchKey">
										<option value="">::선택::</option>
										<option value="head_sell_code" <c:if test="${search.searchKey eq 'head_sell_code'}">selected="selected"</c:if>>판매코드</option>
										<option value="inte_code" <c:if test="${search.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품 통합코드</option>
										<option value="sub_code" <c:if test="${search.searchKey eq 'store_code'}">selected="selected"</c:if>>가맹일련번호</option>
									</select>
									<input type="text" class="form-control" id="searchItem" name="searchItem" value="${search.searchItem}"/>
								</div>
								<button class="btn btn-default" id="searchBtn">
									<i class="fa fa-search"></i>
								</button>
							</form>
                        </div>
                        <!-- /.panel-heading -->
                         <div class="panel-body">
                            <div class="dataTable_wrapper fa col-lg-12">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>선택</th>
                                            <th>판매코드
                                            	<span id="codeUp" class="fa-sort-up"></span>
												<span id="codeDown" class=" fa-sort-down"></span>
                                            </th>
                                            <th>상품메뉴 통합코드</th>
                                            <th>판매수량</th>
                                            <th>가맹일련번호</th>
                                            <th>판매그룹번호
                                            	<span id="groupUp" class="fa-sort-up"></span>
												<span id="groupDown" class=" fa-sort-down"></span>
                                            </th>
                                            <th>판매금액</th>
                                            <th>판매일자
                                            	<span id="dateUp" class="fa-sort-up"></span>
												<span id="dateDown" class=" fa-sort-down"></span>
                                            </th>
                                            <th>배송요청여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <form action="/requestDelivery.do" method="post">
										<c:forEach var="list" items="${sellList}">
											<input type="hidden" name="inteCode" value="${list.inteCode}"/>
											<input type="hidden" name="headSellQuantity" value="${list.headSellQuantity}"/>
											<tr>
												<td>
													<c:if test="${list.headSellDelivery eq 'N'}">
														<center><input type="checkbox" name="checkedOrders" value="${list.headSellCode}"/></center>
													</c:if>
												</td>
												<td>
													<a href="/viewSellDetail.do?headSellCode=${list.headSellCode}">${list.headSellCode}</a>
												</td>
												<td>${list.inteCode}</td>
												<td>${list.headSellQuantity}</td>
												<td>${list.subCode}</td>
												<td>${list.headSellGroup}</td>
												<td><fmt:formatNumber value="${list.headSellSellingPrice}" pattern="#,###"/></td>
												<td><fmt:parseDate value="${list.headSellDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
													<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" /></td>
												<td>${list.headSellDelivery}</td>
											</tr>
										</c:forEach>
										<p style="float:right"><button class="btn btn-primary">배송요청</button></p>
									</form>
                                 </tbody>
                               </table>
                           </div>
                       </div>
                       
                       <!-- /.panel-body -->
                   </div>
                   <!-- /.panel -->
               </div>
               <!-- /.col-lg-12 -->
           </div>
		</div>
         <!-- /.container-fluid -->
     </div>
</body>
</html>