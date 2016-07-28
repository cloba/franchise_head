<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
tabel , td, th, tr{
	border: 1px solid;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/headStaffPop.js"></script>
<script>
	$(document).ready(function(){
		/* ������/�������� ���� ���� */
		$('#idUp').click(function(){
			console.log('���̵� �������� ����');
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#idDown').click(function(){
			console.log('���̵� �������� ����');
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#nameUp').click(function(){
			console.log('�̸� �������� ����');
			$('#criteria').attr('value','head_staff_name');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#nameDown').click(function(){
			console.log('�̸� �������� ����');
			$('#criteria').attr('value','head_staff_name');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#levelUp').click(function(){
			console.log('�ŷ�ó�� �������� ����');
			$('#criteria').attr('value','head_staff_level');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#levelDown').click(function(){
			console.log('�ŷ�ó�� �������� ����');
			$('#criteria').attr('value','head_staff_level');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#DepUp').click(function(){
			console.log('�ŷ�ó�� �������� ����');
			$('#criteria').attr('value','head_staff_dep');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		$('#DepDown').click(function(){
			console.log('�ŷ�ó�� �������� ����');
			$('#criteria').attr('value','head_staff_dep');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#joinUp').click(function(){
			console.log('������ �������� ����');
			$('#criteria').attr('value','headStaffJoin');
			$('#upDown').attr('value','ASC');
			$('#HeadStaffSearchForm').submit();
		});
		
		$('#joinDown').click(function(){
			console.log('������ �������̤��� ����');
			$('#criteria').attr('value','headStaffJoin');
			$('#upDown').attr('value','DESC');
			$('#HeadStaffSearchForm').submit();
		});
		
	});
</script>
<body>
<h1>�������� ����Ʈ</h1>
<div>
	<form action="/viewHeadStaffList" id="HeadStaffSearchForm">
		<div> 	
			<!-- �˻����� ������ �� -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
			<input type="text" value="${ headStaffSearch.searchHeadStaffKey}"><br/><br/>
			
			<!-- �˻� ���� ����  -->
			<select name="searchHeadStaffKey">    
				<option value="">����</option>   
				<option value="head_staff_id" <c:if test="${'head_staff_id' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>> ���̵�</option>
				<option value="head_staff_name"<c:if test="${'head_staff_name' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>�̸�</option>
				<option value="head_staff_level" <c:if test="${'head_staff_level' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>����</option>
				<option value="head_staff_dep" <c:if test="${'head_staff_dep' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>�μ�</option>
				<option value="head_staff_join" <c:if test="${'head_staff_join' eq headStaffSearch.searchHeadStaffKey }">selected="selected"</c:if>>����Ѿ��̵�</option>
			</select>
			
			<!-- �˻���� �˻���ư -->
			<input type="text" name="searchHeadStaffInfo" value="${headStaffSearch.searchHeadStaffInfo}">
			<input type="submit" id="searchheadStaffBtn" name="searchheadStaffBtn" value="�˻�">

		</div>
	</form>
	<table>
		<tr>
			<th><span>���̵�</span>
				<span id="idUp">��</span>
				<span id="idDown">��</span>
<!-- 			<th>��й�ȣ</th> -->
			<th><span>�̸�</span>
				<span id="nameUp">��</span>
				<span id="nameDown">��</span>
				
			<th><span>����(����)</span>
				<span id="levelUp">��</span>
				<span id="levelDown">��</span>
				
			<th><span>�μ�</span>
				<span id="DepUp">��</span>
				<span id="DepDown">��</span>

			<th><span>�Ի���</span>
				<span id="joinUp">��</span>
				<span id="joinDown">��</span>
<!-- 			<th>�����</th> -->
<!-- 			<th>�����</th> -->
		</tr>
		
		<!-- ����Ʈ �����ִ� ȭ�� -->
		<c:forEach var="HeadStaff" items="${list}">
			<tr ondblclick="detailPop('${HeadStaff.headStaffId}')">
				<td>${HeadStaff.headStaffId }</td>
<%-- 				<td>${HeadStaff.headStaffPw }</td> --%>
				<td><a href = "/headStaffDetail?headStaffId=${HeadStaff.headStaffId}">${HeadStaff.headStaffName }</a></td>
				<td>${HeadStaff.headStaffLevel }</td>
				<td>${HeadStaff.headStaffDep }</td>
				<td>${HeadStaff.headStaffJoin }</td> 
<%-- 				<td>${HeadStaff.headStaffRegitDate }</td> --%>
<%-- 				<td>${HeadStaff.headStaffRegitId }</td> --%>
<%-- 				<td>${HeadStaff.headStaffResign }</td> --%>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="/addHeadStaff"><input type="button" value="���� ���"></a>
		<a href="/"><input id="modifyHeadStaff" type="button" value="�ǵ��� ����"></a>
	</div>
</div>
</body>
</html>