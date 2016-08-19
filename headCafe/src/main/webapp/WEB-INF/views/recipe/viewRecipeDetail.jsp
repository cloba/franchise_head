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
                       		레시피 상세
                       		<div class="btn"><a href="/viewMenuList.do">목록</a></div>
                        </div>
                         <div class="panel-body">
                          <p><strong>메뉴이름 : ${recipe.menuCode }</strong>
                          <br>
                          <address>
	                          <c:forEach var="Recipe" items="${list}">  
		                              <br>${Recipe.recipeOrder}  ${Recipe.recipeAct}
		                      </c:forEach>
	                      </address>
						<br>
                          <p>등록직원 : ${recipe.headStaffId}
                          <p>등록일자 : <fmt:parseDate value="${recipe.recipeRegitDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
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