<%@page import="java.util.List"%>
<%@page import="com.entity.Kart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.KartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ödeme Sayfası</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style>
	body {
		background-color: #f0f1f2;
		font-family: Arial, sans-serif;
	}

	.card {
		border: none;
		border-radius: 15px;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	}

	.alert {
		border-radius: 10px;
	}

	.card-body {
		padding: 20px;
	}

	.table {
		font-size: 0.9rem;
	}

	.table th,
	.table td {
		vertical-align: middle;
		text-align: center;
	}

	.btn-form {
		width: 100%;
		border-radius: 20px;
	}

	.btn-form-group {
		margin-top: 20px;
	}

	.btn-back {
		margin-top: 20px;
		width: 100%;
		border-radius: 20px;
	}

	.form-group label {
		font-weight: bold;
	}

	.text-danger {
		font-size: 0.8rem;
	}

	.form-control {
		border-radius: 20px;
	}

	.btn-warning,
	.btn-success {
		border-radius: 20px;
		padding: 10px 20px;
	}

	.btn-form-group {
		text-align: center;
	}

	.btn-back {
		border-radius: 20px;
		padding: 10px 20px;
	}

	.btn-warning:hover,
	.btn-success:hover,
	.btn-back:hover {
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}

	.card-header {
		background-color: #007bff;
		color: #fff;
		border-radius: 15px 15px 0 0;
	}

	.card-header h3 {
		font-weight: bold;
		margin: 0;
		padding: 20px 0;
		text-align: center;
	}

	.card-body h3 {
		font-weight: bold;
		margin-bottom: 20px;
	}

	.table th {
		background-color: #007bff;
		color: #fff;
		font-weight: bold;
	}

	.table td {
		font-size: 1rem;
	}

	.btn-danger {
		background-color: #dc3545;
		border-color: #dc3545;
		color: #fff;
		padding: 8px 16px;
		font-size: 0.9rem;
		border-radius: 20px;
	}

	.btn-danger:hover {
		background-color: #bd2130;
		border-color: #bd2130;
	}
</style>
</head>
<body>

<%@include file="bilesenler/navbar.jsp"%>

<c:if test="${empty userobj}">
	<c:redirect url="giris.jsp"></c:redirect>
</c:if>

<c:if test="${not empty basarilimsg}">
	<div class="alert alert-success" role="alert">${basarilimsg }</div>
	<c:remove var="basarilimsg" scope="session" />
</c:if>

<c:if test="${not empty basarisizmsg}">
	<div class="alert alert-danger text-center" role="alert">${basarisizmsg }</div>
	<c:remove var="basarisizmsg" scope="session" />
</c:if>

<div class="container py-5">
	<div class="row">
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<h3>Seçilen Siparişler</h3>
				</div>
				<div class="card-body">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Sipariş Adı</th>
								<th scope="col">Ürün Türü</th>
								<th scope="col">Fiyat</th>
								<th scope="col">İşlem</th>
							</tr>
						</thead>
						<tbody>
							<%
							User u =(User)session.getAttribute("userobj");
							KartDAOImpl dao = new KartDAOImpl(DBConnect.getConn());
							List<Kart> kart= dao.getSpsByUser(u.getId());
							Double total_fiyat=0.00;
							for(Kart k : kart) {
								total_fiyat = k.getTotal_fiyat();
							%>
							<tr>
								<td><%=k.getSpsad()%></td>
								<td><%=k.getSpstür()%></td>
								<td><%=k.getFiyat()%></td>
								<td>
									<a href="sps_kaldir?spsid=<%=k.getSpsid()%>&userid=<%=k.getUserid()%>" class="btn btn-danger">Kaldır</a>
								</td>
							</tr>
							<%
							}
							%>
							<tr>
								<td colspan="2" class="text-right font-weight-bold">Toplam Fiyat:</td>
								<td colspan="2"><%=total_fiyat%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<h3>Sipariş Detayları</h3>
				</div>
				<div class="card-body">
					<form action="odeme" method="post">
						<input type="hidden" value="${userobj.id}" name="id">
						<div class="form-group">
							<label for="ad">Ad:</label>
							<input type="text" name="ad" class="form-control" id="ad" value="${userobj.ad}" required>
						</div>
						<div class="form-group">
							<label for="email">Email:</label>
							<input type="email" name="email" class="form-control" id="email" value= "${userobj.email}" required>
						</div>
						<div class="form-group">
							<label for="telno">Telefon Numarası:</label>
							<input name="telno" type="number" class="form-control" id="telno" value="${userobj.telno}" required>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="adres">Adres:</label>
								<input type="text" name="adres" class="form-control" id="adres" required>
							</div>
							<div class="form-group col-md-6">
								<label for="bolge">Bölge:</label>
								<input type="text" name="bolge" class="form-control" id="bolge" required>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="sehir">Şehir:</label>
								<input type="text" name="sehir" class="form-control" id="sehir" required>
							</div>
							<div class="form-group col-md-6">
								<label for="ilce">İlçe:</label>
								<input type="text" name="ilce" class="form-control" id="ilce" required>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="pinkodu">Posta Kodu:</label>
								<input type="text" name="pinkodu" class="form-control" id="pinkodu" required>
							</div>
							<div class="form-group col-md-6">
								<label for="odemeturu">Ödeme Türü:</label>
								<select class="form-control" name="odemeturu" id="odemeturu" required>
									<option value="noselect">--Seçiniz--</option>
									<option value="Online">Online Ödeme</option>
								</select>
							</div>
						</div>
						<div class="btn-form-group">
							<button class="btn btn-warning btn-form" type="submit">Sipariş Ver</button>
						</div>
					</form>
					<a href="index.jsp" class="btn btn-success btn-back">Anasayfa Dön</a> 
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
