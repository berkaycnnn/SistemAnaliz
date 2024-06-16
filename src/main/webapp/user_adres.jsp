<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adresinizi Güncelleyin</title>
<%@include file="bilesenler/btnCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="bilesenler/navbar.jsp"%>
<style>
.card {
    border: none;
    border-radius: 20px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.card-body {
    padding: 40px;
}

.form-group label {
    font-weight: bold;
    font-size: 1.2rem;
}

.form-control {
    border-radius: 15px;
    border-color: #ccc;
    font-size: 1.1rem;
}

.btn-warning {
    background-color: #ffc107;
    border-color: #ffc107;
    border-radius: 30px;
    font-size: 1.3rem;
    padding: 15px 40px;
}

.btn-warning:hover {
    background-color: #e0a800;
    border-color: #e0a800;
}

</style>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Adresinizi Ekleyin</h3>

						<form action="">
							<div class="form-row">

								<div class="form-group col-md-6">
									<label for="inputPassword4">Adres</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Bölge</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>

							<div class="form-row">

								<div class="form-group col-md-4">
									<label for="inputPassword4">Şehir</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">İlçe</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Posta Kodu</label> <input
										type="text" class="form-control" id="inputPassword4">
								</div>
							</div>

							<div class="text-center">
								<button class="btn btn-warning text-white">Adres Ekle</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>