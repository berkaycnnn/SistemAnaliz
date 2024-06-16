<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Anasayfa</title>
<%@include file="btnCss.jsp" %>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.card {
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out;
}

.card:hover {
	transform: scale(1.05);
}

.card-body {
	padding: 20px;
}

.card-body i {
	font-size: 3rem;
	margin-bottom: 10px;
}

.card-title {
	font-size: 1.5rem;
	font-weight: bold;
	margin-bottom: 10px;
}

.card-title::after {
	content: '';
	display: block;
	width: 30px;
	height: 2px;
	background-color: #007bff;
	margin: 10px auto;
}

.modal-title {
	font-size: 1.5rem;
	font-weight: bold;
}

.modal-body {
	text-align: center;
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
.btn-secondary {
	background-color: #6c757d;
	border-color: #6c757d;
	border-radius: 20px;
	font-size: 1rem;
	padding: 10px 20px;
}

.btn-secondary:hover {
	background-color: #5a6268;
	border-color: #5a6268;
}
</style>

</head>
<body style="background-color:#f0f1f2;">
<%@include file="navbar.jsp" %>

	<c:if test="${empty userobj }">
		<c:redirect url="../giris.jsp" />
	</c:if>

<div class="container">
    <div class="row p-5">
        <div class="col-md-3">
        <a href="spsekle.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fas fa-plus square fa-3x text-success"></i><br>
                    <h4 class="card-title"> Ürün Ekle</h4>
                    ---------------
                </div>
            </div>
            </a>
        </div>
      
        
        <div class="col-md-3">
        <a href="spsgrntl.jsp">
            <div class="card">
                <div class="card-body  text-center">
                    <i class="fa-solid fa-eye text-warning" style="font-size: 50px"></i><br>
                    <h4 class="card-title"> Sps. Görüntüle</h4>
                    ---------------
                </div>
            </div>
           </a>
        </div>
        
        
        <div class="col-md-3">
        <a href="spsbilgi.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fa-solid fa-circle-user text-info" style="font-size: 50px"></i><br>
                    <h4 class="card-title"> Ödeme Bilgileri</h4>
                    ---------------
                </div>
            </div>
            </a>
        </div>
        
        <div class="col-md-3">
            <div class="card">
            <a data-toggle="modal" data-target="#exampleModalCenter">
                <div class="card-body text-center">
                    <i class="fas fa-sign-out-alt fa-3x text-danger"></i><br>
                    <h4 class="card-title"> Çıkış Yap</h4>
                    ---------------
                </div>
            </div>
        </div>
    </div>
    
</div>

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalCenterTitle">Çıkış Yapma Ekranı</h1>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <div class="text-center">
                <h4>Çıkış yapmak istediğinizden emin misiniz?</h4>
                <br>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">İptal</button>
                <a href="../cikisyap" type="button" class="btn btn-primary text-white">Çıkış yap</a>         
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<div style="margin-top:80px;">
<%@include file="footer.jsp" %></div>

</body>
</html>
