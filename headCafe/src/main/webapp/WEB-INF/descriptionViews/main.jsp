<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>
/* The Modal (background) */
 .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}


/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
 .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

 .close:hover,
 .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}


/* Modal Header */
.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

/* Modal Body */
 .modal-body {padding: 2px 16px;}

/* Modal Footer */
.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
} 

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top: -300px; opacity: 0} 
    to {top: 0; opacity: 1}
}

@keyframes animatetop {
    from {top: -300px; opacity: 0}
    to {top: 0; opacity: 1}
}
</style>
 <!-- jQuery -->
    <script src="/resources/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="/resources/bootstrap/js/jquery.js"></script>
<script>
/* $(document).ready(function(){
	

//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function() {
	console.log('보여줌')
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	console.log('가림')
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
}); */
</script>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>기린대로 2층</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/bootstrap/css/one-page-wonder.css" rel="stylesheet">
</head>
<body>
		<h1 id="project_subject" >franchise_head</h1>
		<hr id="row_project_subject">
		<h2 id="team_name">팀명: 기린대로 2층</h2>
      
		<!-- <button id="myBtn">Open Modal</button> -->
		<div id="menu_div">
			<img id="development_environment" src="/resources/image/development_environment.PNG"><!-- <br><br> -->
		</div><br>
		<div id="project_description">
				<h4 class="project_outline">본사가 가맹의 사업운영에 필요한 물품 및 서비스를</h4>
				<h4 class="project_outline">조력해 그 대가로 계약에 정한 일정한 수익배분을 약속 받는 구조를 표현하였습니다. </h4>
			<p class="lead">아래의 이미지를 클릭하시면 자세한 사항을 확인하실 수 있습니다</p><br><br>
		</div>
		<!-- <div id="img_circle">	
			<a href="/system"><img class="img-circle col-md-4" src="/resources/image/system.PNG"></a>
			<a href="/viewEnvironment"><img class=" img-circle col-md-4" src="resources/image/erd_circle.png"></a>
			<a href="/viewERD"><img class=" img-circle col-md-4" src="resources/image/erd_circle.png"></a>
			<a href="/system"><img class="featurette-image img-responsive pull-right col-md-4" src="/resources/image/coosto-thumb-1.png"></a>
		</div> -->
		 <!-- The Modal -->
		<!--<div id="myModal" class="modal">
		
		Modal content
		<div class="modal-content">
			<span class="close">x</span>
			<p>Some text in the Modal..</p>
		</div>
		
		</div> -->
		


 
    <!-- Page Content -->
    <div class="container">
		<br><br>
        <a href="/index"><button class="btn btn-primary btn-lg btn-block startBtn">프로그램 시작하기</button></a>
        <hr class="featurette-divider">
      
        <!-- First Featurette -->
        <div class="featurette" id="about">
            <a href="/system"><img class="featurette-image img-circle img-responsive pull-right" src="/resources/image/system.PNG"></a>
            <h2 class="featurette-heading"> <a href="/system">본사-가맹 시스템 구조도
                <span class="text-muted">System Configuration Map</span>
            </h2>
            <p class="lead"> <a href="/system">본사와 가맹점 간 판매/구매와 가맹비 관리를 중심으로 디자인한 관리 시스템입니다. 이미지를 클릭하시면 시스템 구조도를 확인하실 수 있습니다</a></p>
        </div>
        
         <hr class="featurette-divider">

       <!-- Second Featurette --> 
        <div class="featurette" id="services">
            <a href="/viewERD"><img class="featurette-image img-circle img-responsive pull-left" src="resources/image/erd.png"></a>
            <h2 class="featurette-heading"><a href="/viewERD">개체-관계 모델
                <span class="text-muted">(ERD)</span>
            </h2>
            <p class="lead">본 프로젝트의 데이터 다이어그램입니다. 이미지를 클릭하시면 자세한 내용을 확인하실 수 있습니다</p></a>
        </div>
        
         <hr class="featurette-divider">

        <!-- Third Featurette -->
        <div class="featurette" id="contact">
            <a href="/viewEnvironment"><img class="featurette-image img-circle img-responsive pull-right" src="resources/image/logo_circle.jpg"></a>
            <h2 class="featurette-heading"><a href="/viewEnvironment">개발 환경 및 팀 정보
                <span class="text-muted">를 확인해보세요</span>
            </h2>
            <p class="lead">5개월 교육 후 약 두 달 간 진행한 프로젝트입니다. 본사와 가맹 간의 관리시스템을 설계했으나 작업 기간이 짧아서 설계한 부분 중 더 중요하다고 생각 되는 본사 시스템 만을 구현했습니다. 자세한 내용은 오른쪽 이미지를 클릭하시면 확인하실 수 있습니다</p></a>
        </div>
        <hr class="featurette-divider">
        
         <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; 기린대로2층 2016</p>
                </div>
            </div>
        </footer>
        
        </div>

    <script src="/resources/bootstrap/js/bootstrap.min.js"></script> 
        
</body>
</html>