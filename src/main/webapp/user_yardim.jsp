<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Çağrı Merkezi</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }
    .container {
        padding-top: 50px;
    }
    .fa-phone-square-alt {
        color: #28a745; 
    }
   .btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 20px;
	font-size: 1rem;
	padding: 10px 20px;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}
.btn-success {
    background-color: #28a745;
    border-color: #28a745;
    border-radius: 20px;
    font-size: 1rem;
    padding: 10px 20px;
    color: #fff; 
}

.btn-success:hover {
    background-color: #218838;
    border-color: #218838;
}
    .card {
        border-radius: 20px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        padding: 30px;
        background-color: #fff; /
    }
    .card-title {
        font-size: 24px;
        color: #007bff; 
        text-transform: uppercase; 
    }
    .card-subtitle {
        font-size: 18px;
        color: #6c757d; 
    }
    .card-text {
        font-size: 16px;
    }
    .card-text a {
        color: #007bff; 
        text-decoration: none; 
        transition: color 0.3s; 
    }
    .card-text a:hover {
        color: #0056b3; 
    }
</style>
</head>
<body>
<%@include file="bilesenler/navbar.jsp"%>
  
<div class="container">

  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card text-center">
        <div class="text-success">
          <i class="fas fa-phone-square-alt fa-5x"></i>
        </div>
        <h3 class="card-title mt-4">24/7 Ulaşabilirsiniz</h3>
        <h4 class="card-subtitle mt-3">Çağrı Merkezi Telefonu</h4>
        <h5 class="mt-3">Ali Berkay CAN : +90 545 813 40 14</h5>
        <h5 class="mt-3">Tolga ATMACA   : +90 539 815 38 40</h5>
        <h5 class="mt-3">Serkan SARIGÖZ : +90 530 797 46 04</h5>
        <div class="mt-4">
          <p class="card-text">Anasayfaya dönmek için <a href="index.jsp">buraya</a> tıklayın.</p>
        </div>
        <div class="mt-4">
          <a href="index.jsp" class="btn btn-primary">Anasayfa Dön</a>
        </div>
      </div>
    </div>
  </div>

</div>
</body>
</html>
