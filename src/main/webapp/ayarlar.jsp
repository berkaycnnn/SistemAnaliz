<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kullanıcı Ayarlar Sayfası</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style type="text/css">
a{
    text-decoration: none;
    color: black;
}
a:hover{
    text-decoration:none;
}
.card {
    border: 1px solid #dee2e6;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease;
    background-color: #ffffff;
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

.card:hover {
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    transform: translateY(-5px);
}

.card-body {
    padding: 30px;
}

.card-body h4 {
    margin-top: 20px;
    font-weight: bold;
    font-size: 1.5rem;
    color: #333333;
}

.card-body p {
    margin-top: 15px;
    font-size: 1.1rem;
    color: #666666;
}

.card i {
    font-size: 5rem;
    margin-bottom: 25px;
}

.card:hover {
    transform: translateY(-5px);
}

.card-header {
    background-color: #f8f9fa;
    padding: 20px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}

.card-header h4 {
    margin: 0;
    font-weight: bold;
    color: #333333;
}

.card-footer {
    background-color: #f8f9fa;
    padding: 20px;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
}

.card-footer p {
    margin: 0;
    font-size: 1rem;
    color: #666666;
}

.card-footer a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease;
}

.card-footer a:hover {
    color: #0056b3;
}
.card:hover {
    transform: translateY(-5px);
    
}
h3 {
    color: #333;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    padding: 20px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: bold;
    margin-bottom: 30px;
    box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.1);
   }
</style>
</head>
<body style="background-color: #f7f7f7;">
    <%@include file="bilesenler/navbar.jsp"%>
    
    <div class="container">
    <br>
        <h3 class="text-center text-primary"> Kullanıcı Ayarlar Sayfası </h3>
        <div class="row p-5">
       -
            <div class="col-md-12">
                <a href="user_profilduzenle.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="text-success">
                                <i class="fa-solid fa-circle-user fa-4x"></i>
                          </div>
                                <h4> Profil Düzenleme </h4>
                            	<p> Ayarlarınızı düzenleyin </p>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4 mt-3">
                <a href="user_adres.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="text-warning">
                                <i class="fa-solid fa-location-dot fa-3x"></i>
                            </div>
                                <h4>Mevcut Adresim</h4>
                                <p>Adresinizi düzenleyin </p>
                        </div>
                    </div>
                </a>
            </div>
            
             <div class="col-md-4 mt-3">
                <a href="user_spsliste.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="text-danger">
                                <i class="fa-solid fa-thumbtack fa-3x"></i>
                            </div>
                                <h4>Siparişlerim</h4>
                                <p> Bütün siparişleri listeler </p>
                        </div>
                    </div>
                </a>
            </div>
            
             <div class="col-md-4 mt-3">
                <a href="user_yardim.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="text-info">
                                <i class="fa-solid fa-phone-flip fa-3x"></i>
                            </div>
                                <h4>Çağrı Merkezi</h4>
                                <p> 7/24 Aktif </p>
                        </div>
                    </div>
                </a>
            </div>
            
        </div>
    </div> 
    
    <div class="container-fluid text-center text-white p-3 mt-2 fixed-bottom" style="background-color:#468499;">
        <h5>Ali Berkay CAN & Tolga ATMACA & Serkan SARIGÖZ</h5>        
    </div>
    
</body>
</html>
