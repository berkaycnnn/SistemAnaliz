<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Sps. Ekle</title>
<%@include file="btnCss.jsp" %>
<style>
    body {
    background-color: #f0f2f2;
    font-family: Arial, sans-serif;
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
.container {
    margin-top: 20px;
}

.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.card-body {
    padding: 30px;
}

.card-title {
    text-align: center;
    font-size: 1.8rem;
    font-weight: bold;
    margin-bottom: 20px;
    color: #007bff;
}

.form-group label {
    font-weight: bold;
}

.btn-primary.ekle {
    background-color: #007bff;
    border-color: #007bff;
    border-radius: 20px;
    font-size: 1rem;
    padding: 10px 30px;
    display: block;
    margin: 0 auto;
}

.btn-primary.ekle:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}
h2 {
    color: #333;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f7f7f7;
    padding: 20px;
    border-bottom: 3px solid #00695c;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: bold;
    margin-bottom: 30px;
    box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.1);
    }


</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj }">
    <c:redirect url="../giris.jsp" />
</c:if>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h2 class="text-center">Ürün Ekle</h2>
                    <c:if test="${not empty basarilimsg }">
                        <p class="text-center text-success">${basarilimsg }</p>
                        <c:remove var="basarilimsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty basarisizmsg }">
                        <p class="text-center text-danger">${basarisizmsg }</p>
                        <c:remove var="basarisizmsg" scope="session" />
                    </c:if>
                    <form action="../spsekle" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Ürün Adı</label>
                            <input name="spsad" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Ürün Kategorisi</label>
                            <input name="spsürün" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Fiyat</label>
                            <input name="spsfiyat" type="number" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="form-group">
                            <label for="inputState">Sipariş Türleri</label>
                            <select id="inputState" name="spstür" class="form-control">
                                <option selected>--Seçiniz--</option>
                                <option value="İçecekler">İçecekler</option>
                                <option value="Tatlılar">Tatlılar</option>
                                <option value="Aperatifler">Aperatifler</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputState">Sipariş Durumu</label>
                            <select id="inputState" name="spskontrol" class="form-control">
                                <option selected>--Seçiniz--</option>
                                <option value="Aktif">Aktif</option>
                                <option value="Deaktif">Deaktif</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlFile1">Fotoğraf Yükle</label>
                            <input name="resim" type="file" class="form-control-file" id="exampleFormControlFile1">
                        </div>
                        <button type="submit" class="btn btn-primary ekle">Ekle</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
