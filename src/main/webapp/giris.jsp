<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kafeuyg-App : Giriş</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style>
.login-section {
	background-image: url('img/bg.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-attachment: fixed;
	background-color: #f0f1f2;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	padding-top: 50px;
	min-height: calc(100vh - 160px);
	
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
.login-section .card {
	border: none;
	border-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	transition: transform 0.3s;
}

.login-section .card:hover {
	transform: translateY(-5px);
}

.login-section .card-body {
	padding: 40px;
}

.login-section .form-group {
	margin-bottom: 30px;
}

.login-section .text-center {
	text-align: center;
}

.login-section .btn-primary {
	background-color: #4CAF50;
	border: none;
	padding: 12px 24px;
	border-radius: 25px;
	transition: background-color 0.3s, box-shadow 0.3s;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	color: #fff;
	font-weight: bold;
	text-transform: uppercase;
}

.login-section .btn-primary:hover {
	background-color: #45a049;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	transform: translateY(-2px);
}

.login-section .btn-register {
	color: #fff;
	background-color: #007bff;
	border: none;
	padding: 12px 24px;
	border-radius: 25px;
	transition: background-color 0.3s, box-shadow 0.3s;
	box-shadow: 0 4px 8px rgba(0, 123, 255, 0.1);
	text-decoration: none;
	display: inline-block;
	font-weight: bold;
	text-transform: uppercase;
}

.login-section .btn-register:hover {
	background-color: #0056b3;
	box-shadow: 0 6px 12px rgba(0, 123, 255, 0.2);
	transform: translateY(-2px);
}

.fixed-bottom {
	position: fixed;
	bottom: 0;
	width: 100%;
	background-color: #00695c;
	color: #fff;
	z-index: 9999;
}

footer {
	background-color: #00695c;
	color: #fff;
	text-align: center;
	padding: 10px 0;
	width: 100%;
	position: absolute;
	bottom: 0;
}
</style>
</head>
<body>
	<%@include file="bilesenler/navbar.jsp"%>
	<div class="container-fluid login-section">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-4">Giriş Ekranı</h3>

						<c:if test="${not empty basarisizmsg }">
							<div class="alert alert-danger text-center" role="alert">${basarisizmsg}</div>
							<c:remove var="basarisizmsg" scope="session" />
						</c:if>

						<c:if test="${not empty basarilimsg }">
							<div class="alert alert-success text-center" role="alert">${basarilimsg}</div>
							<c:remove var="basarilimsg" scope="session" />
						</c:if>

						<form action="giris" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email Adresiniz</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Şifreniz</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="sifre">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-block">Giriş
									Yap</button>
								<hr>
								<a href="kayit.jsp" class="btn btn-register btn-block">Hesap
									Oluştur</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div
			class="container-fluid text-center text-white p-3 mt-2 fixed-bottom"
			style="background-color: #468499;">
			<h5>Ali Berkay CAN & Tolga ATMACA & Serkan SARIGÖZ</h5>
		</div>
	</footer>
</body>
</html>
