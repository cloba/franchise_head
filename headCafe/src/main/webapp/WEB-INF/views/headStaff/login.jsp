<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">		
<title>Home</title>
<script>
	//�α��� �޼���
	$(document).ready(function() {
		if( 'fail' == $('#result').val() ){
			alert('���̵�� ��й�ȣ�� �ٽ� Ȯ�����ּ���');
		}
		
		$('#loginBtn').click(function() {
			console.log('�α��ι�ư Ŭ��');
			if ($('#headStaffId').val() == "") {
				alert('���̵� �Է��ϼ���.');
			} else if ($('#headStaffPw').val() == "") {
				alert('��й�ȣ�� �Է��ϼ���.');
			}else{
				$('#loginForm').attr('action','/loginAction.go');  //�ٲ�
				$('#loginForm').submit();
			}
		});
	});
</script>	
</head>
<body>
	<!-- �α��� �� -->
	<div class="join">
		<input type="hidden" id="result" value="${result}"/>
		<form id="loginForm" action="" method="post" >
			<h2>�α���</h2>
			
			<div class="form-group">
				<label for="staffId">���̵� : </label>
				<input type="text" class="form-control" id="headStaffId" name="headStaffId" placeholder="Enter ID">
			</div>
			<div class="form-group">
				<label for="staffPw">��й�ȣ:</label>
				<input type="password" class="form-control" id="headStaffPw" name="headStaffPw" placeholder="Enter password">
			</div>
			<div id="right">
				<input type="button" class="btn btn-default" id="loginBtn" value="�α���"/>
			</div>
		</form>
	</div>
</body>
</html>