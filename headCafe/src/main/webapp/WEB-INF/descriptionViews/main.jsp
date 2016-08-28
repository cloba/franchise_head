<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	<!-- Full Width Image Header -->
	<header>
       <p id="header-image"><img src="/resources/image/logo_circle.jpg"/></p>
    </header> 
    
     <!-- Page Content -->
    <div class="container">
		<br><br>
        <a href="/index"><button class="btn btn-primary btn-lg btn-block startBtn">프로그램 시작하기</button></a>
        <hr class="featurette-divider">
      
        <!-- First Featurette -->
        <div class="featurette" id="about">
            <a href="/system"><img class="featurette-image img-circle img-responsive pull-right" src="/resources/image/system.PNG"></a>
            <h2 class="featurette-heading">본사-가맹 시스템 구조도
                <span class="text-muted">System Configuration Map</span>
            </h2>
            <p class="lead">본사와 가맹점 간 판매/구매와 가맹비 관리를 중심으로 디자인한 관리 시스템입니다. 이미지를 클릭하시면 시스템 구조도를 확인하실 수 있습니다</p>
        </div>
        
         <hr class="featurette-divider">

        <!-- Second Featurette -->
        <div class="featurette" id="services">
            <a href="/viewERD"><img class="featurette-image img-circle img-responsive pull-left" src="resources/image/erd.png"></a>
            <h2 class="featurette-heading">개체-관계 모델
                <span class="text-muted">(ERD)</span>
            </h2>
            <p class="lead">본 프로젝트의 데이터 다이어그램입니다. 이미지를 클릭하시면 자세한 내용을 확인하실 수 있습니다</p>
        </div>
        
         <hr class="featurette-divider">

        <!-- Third Featurette -->
        <div class="featurette" id="contact">
            <a href="/viewEnvironment"><img class="featurette-image img-circle img-responsive pull-right" src="resources/image/logo_circle.jpg"></a>
            <h2 class="featurette-heading">개발 환경 및 팀 정보
                <span class="text-muted">를 확인해보세요</span>
            </h2>
            <p class="lead">5개월 교육 후 약 두 달 간 진행한 프로젝트입니다. 본사와 가맹 간의 관리시스템을 설계했으나 작업 기간이 짧아서 설계한 부분 중 더 중요하다고 생각 되는 본사 시스템 만을 구현했습니다. 자세한 내용은 오른쪽 이미지를 클릭하시면 확인하실 수 있습니다</p>
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
    <!-- /.container -->

    <!-- jQuery -->
    <script src="/resources/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
        
</body>
</html>