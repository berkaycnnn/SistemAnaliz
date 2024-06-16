<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kafeuyg-App : Kayit</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style>
 body {
        background-image: url('img/kayitolarkaplan.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
    }
.card {
	border-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
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

.card-body {
	padding: 40px;
	background-color: #f8f9fa;
	border-radius: 20px;
}

.form-group {
	margin-bottom: 25px;
}

label {
	font-weight: bold;
}

.form-control {
	border-radius: 20px;
	border: 2px solid #ccc;
}

.form-control:focus {
	border-color: #4CAF50;
	box-shadow: none;
}

.btn-kayit-ol {
	padding: 12px 30px;
	border-radius: 30px;
	transition: background-color 0.3s, box-shadow 0.3s;
	background-color: #FF5733;
	border: 3px solid #FF5733;
	color: #fff;
	font-weight: bold;
	text-transform: uppercase;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.btn-kayit-ol:hover {
	background-color: #FF8C42;
	border-color: #FF8C42;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
	transform: translateY(-2px);
}

.btn-kayit-ol:focus {
	outline: none;
}
</style>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="bilesenler/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-4">Kayıt Olma Sayfası</h4>

						<c:if test="${not empty basarilimsg }">
							<p class="text-center text-success">${basarilimsg }</p>
							<c:remove var="basarilimsg" scope="session" />
						</c:if>

						<c:if test="${not empty basarisizmsg } ">
							<p class="text-center text-danger">${basarisizmsg }</p>
							<c:remove var="basarisizmsg" scope="session" />
						</c:if>

						<c:if test="${not empty emailbasarisizmsg}">
							<p class="text-center text-danger">${emailbasarisizmsg}</p>
							<c:remove var="emailbasarisizmsg" scope="session" />
						</c:if>

						<form action="kayit" method="post">

							<div class="form-group">
								<label for="exampleInputFullName">Adınız ve Soyadınız</label> <input
									type="text" class="form-control" id="exampleInputFullName"
									aria-describedby="emailHelp" required="required" name="fullad"
									placeholder="Adınız ve Soyadınız">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail">E-Mail Adresiniz</label> <input
									type="email" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" required="required" name="email"
									placeholder="E-Posta Adresinizi Giriniz">
							</div>

							<div class="form-group">
								<label for="exampleInputPhone">Telefon Numarası</label> <input
									type="tel" class="form-control" id="exampleInputPhone"
									aria-describedby="emailHelp" required="required" name="telno">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword">Şifrenizi Giriniz</label> <input
									type="password" class="form-control" id="exampleInputPassword"
									name="sifre" placeholder="Şifrenizi Giriniz">
							</div>

							<div class="form-check mb-4">
								<input type="checkbox" class="form-check-input" name="kontrol"
									id="exampleCheck1" required="required"> <label
									class="form-check-label" for="exampleCheck1">Şartları &
									koşulları kabul ediyorum</label>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-kayit-ol btn-block">Kayıt
									Ol</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer
		class="container-fluid text-center text-white p-3 mt-2 fixed-bottom"
		style="background-color: #468499;">
		<h5>Ali Berkay Can & Tolga ATMACA & Serkan SARIGÖZ</h5>
	</footer>
</body>
</html>
