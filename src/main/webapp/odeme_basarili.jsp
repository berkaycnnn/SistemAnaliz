<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teşekkürler</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style>
    .btn-odemebtn {
        padding: 10px 25px; 
        font-size: 1.5rem; 
        border-radius: 30px; 
    }
</style>
</head>
<body>
<%@include file="bilesenler/navbar.jsp"%>

<div class="container text-center mt-5">
    <i class="fas fa-check-circle fa-5x text-success"></i>
    <h1>Teşekkürler</h1>
    <h2> Siparişiniz Başarıyla Tamamlandı</h2>
    <h5> Siparişiniz Şimdi Hazırlanmaya Başlayacaktır</h5>
    <a href="index.jsp" class="btn btn-primary btn-odemebtn mt-4">Anasayfa</a> 
    <a href="user_spsliste.jsp" class="btn btn-danger btn-odemebtn mt-4">Siparişi Gör</a>
</div> 

</body>
</html>
