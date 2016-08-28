							<!-- 본사 메뉴 상세 정보  화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>
	.btn {
		float: right;
		margin-top: 0px;
		padding-top: 0px;
	}
	.select {
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
                       		메뉴 상세
                       		<div class="btn"><a href="/viewMenuList.do">목록</a></div>
                       		<div class="btn"><a href="/headModifyMenu.do?menuCode=${menu.menuCode}">&nbsp&nbsp&nbsp수정</a></div>
                        </div>
                         <div class="panel-body">
							<p>메뉴 코드 : ${menu.menuCode}
							<p>통합 코드 : ${menu.inteCode}
							<p><strong>메뉴명 : ${menu.menuName}</strong>
							<br>
							<p>재료구입가 : <fmt:formatNumber value="${menu.menuIngrePrice}" pattern="#,###"/>
							<p>소비자가격 : <fmt:formatNumber value="${menu.menuSellingPrice}" pattern="#,###"/>
							<br>
							<p>등록날짜: <fmt:parseDate value="${menu.menuRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
							<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
							<p>등록직원: ${menu.headStaffId}
							<br>
							<p>적용상태: ${menu.menuStatus}
							<p>적용만료일: <c:choose>
											<c:when test="${menu.menuStatus ne 'Y'}">
												${menu.menuExpiredDate}
											</c:when>
											<c:otherwise>
												비대상
											</c:otherwise>
										</c:choose>
							<br>
							<p><strong>필요한 재료량과 가격</strong>
							<c:forEach var="ingreList" items="${ingreList}">
								<p>메뉴코드 : ${ingreList.menuCode}
								<p>상품코드 : ${ingreList.hItemCode}
								<p>재료 : ${ingreList.ingreName}
								<p>사용량 : ${ingreList.ingreAmount}
								<p>가격 : ${ingreList.ingreMoney}
								<br>
								<p>등록직원 : ${ingreList.headStaffId}
								<p>등록일자 : <fmt:parseDate value="${ingreList.ingreRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
											<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${date}" />
							</c:forEach>
                       </div>
                        <!-- /.panel-body -->
                    </div>
                    <div class="select">
						<c:if test="${menu.recipeIdentify != 0}">
							<a href="/viewRecipeDetail.do?menuCode=${menu.menuCode}">레시피보기</a>
						</c:if>
						<c:if test="${menu.recipeIdentify == 0}">
							<a href="/addRecipe.do?menuCode=${menu.menuCode}">레시피 등록</a>
						</c:if>
					</div>
                    <!-- /.panel -->
                </div>
			</div>
       </div>
     </div>
   </body>
</html>