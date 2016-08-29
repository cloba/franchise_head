							<!-- 본사 메뉴 리스트  화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.nav nav-tabs:HOVER {
	}
	.form-control, .form-group {
		width: 250px;
		height: 31px;
		display: inline;
	}
	p {
		text-align: center;
	}
</style>
<script>

	$(document).ready(function(){
		
		$('#nameUp').click(function(){
			$('#criteria').val('menu_name');
			$('#upDown').val('ASC');
			$('#menuList').submit();
		});
		$('#nameDown').click(function(){
			$('#criteria').val('menu_name');
			$('#upDown').val('DESC');
			$('#menuList').submit();
		});
		
		$('#statusUp').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('ASC');
			$('#menuList').submit();
		});
		$('#statusDown').click(function(){
			$('#criteria').val('menu_status');
			$('#upDown').val('DESC');
			$('#menuList').submit();
		});
		
		//검색 유효성
		$('#searchBtn').click(function(){
			if(  $('#searchKey').val() == "" || $('#searchItem').val() == "" ){
				alert('검색분류를 선택하고 검색어를 입력해주세요');
			}else{
				$('#menuList').submit();
			}
		});
		
	});
</script>
<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">메뉴 목록</h1>
				</div>
				<!-- /.col-lg-12 -->
				</div>
				<div class="panel-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="/viewMenuList.do">전체메뉴</a>
					</li>
					<li><a href="/viewMenuList.do?status=Y">적용메뉴</a>
					</li>
					<li><a href="/viewMenuList.do?status=N">미적용메뉴</a>
					</li>
				</ul> 
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- 판매 내역 검색 -->
							<form id="menuList" action="/viewMenuList.do" method="post">
								<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
								<input type="hidden" name="criteria" id="criteria" value=""/>
								<input type="hidden" name="upDown" id="upDown" value=""/>
								<!-- 적용/미적용 조건 적용을 위한 input 태그 -->
								<input type="hidden" name="status" value="${menuSearch.status}"/>
								
								<div class="form-group">
									<label>키워드</label>
									<select class="form-control" id="searchKey" name="searchKey">
										<option value="">::선택::</option>
										<option value="menu_code" <c:if test="${menuSearch.searchKey eq 'menu_code'}">selected="selected"</c:if>>메뉴코드</option>
										<option value="inte_code" <c:if test="${menuSearch.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품메뉴 통합코드</option>
										<option value="menu_name" <c:if test="${menuSearch.searchKey eq 'menu_name'}">selected="selected"</c:if>>메뉴이름</option>
									</select>
									<input type="text" class="form-control" id="searchItem" name="searchItem" value="${menuSearch.searchItem}"/>
								</div>
								<input type="button" class="btn btn-default" id="searchBtn" value="search">
							</form>
							</div>
							<!-- /.panel-heading -->
	 						<div class="panel-body">
								<div class="dataTable_wrapper fa col-lg-12">
									<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
										<thead>
											<tr>
												<th>메뉴명
													<span id="nameUp" class="fa-sort-up"></span>
													<span id="nameDown" class="fa-sort-down"></span>
												</th>
												<th>메뉴코드</th>
												<th>상품메뉴 통합코드</th>
												<th>적용상태
													<span id="statusUp" class="fa-sort-up"></span>
													<span id="statusDown" class="fa-sort-down"></span>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="menuList" items="${menuList}">
												<tr>
													<td><a href="/viewMenuDetail.do?menuCode=${menuList.menuCode}">${menuList.menuName}</a></td>
													<td>${menuList.menuCode}</td>
													<td>${menuList.inteCode}</td>
													<td>${menuList.menuStatus}</td>
												</tr>
											</c:forEach>
										</tbody>
	                               </table>
	                           </div>
	                       </div>
	                       <p><a id="more" href="#">더보기&nbsp;&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></a></p>
                       <!-- /.panel-body -->
	                   </div>
	                   <!-- /.panel -->
	               </div>
               <!-- /.col-lg-12 -->
	           </div>
	           <a class="btn btn-default" href="/headAddMenu.do">신규등록</a>
			</div>
	         <!-- /.container-fluid -->
	     </div>
     </div>
</body>
</html>