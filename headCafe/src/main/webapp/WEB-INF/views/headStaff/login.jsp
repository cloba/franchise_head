<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	//로그인 메서드
	$(document).ready(function() {
		if( 'fail' == $('#result').val() ){
			alert('아이디와 비밀번호를 다시 확인해주세요');
		}
		
		$('#loginBtn').click(function() {
			console.log('로그인버튼 클릭');
			if ($('#headStaffId').val() == "") {
				alert('아이디를 입력하세요.');
			} else if ($('#headStaffPw').val() == "") {
				alert('비밀번호를 입력하세요.');
			}else{
				$('#loginForm').attr('action','/loginAction.go');  //바꿈
				$('#loginForm').submit();
			}
		});
	});
</script>	
	<input type="text" id="result" value="${result }"/>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form action="" id="loginForm" role="form" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Enter ID" id="headStaffId" name="headStaffId" value="head_staff_id1" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Enter password" id="headStaffPw" name="headStaffPw" type="password" value="0000">
                                </div>
                                <input type="button" class="btn btn-outline btn-primary btn-lg btn-block" id="loginBtn" value="Login"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
</body>

</html>
