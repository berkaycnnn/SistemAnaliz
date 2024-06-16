<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil Düzenleme</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style>
    body {
        background-color: #f0f1f2; 
    }
    .card {
        border-radius: 30px;
        box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
    }
    .card-body {
        padding: 60px;
    }
    .form-group {
        margin-bottom: 35px;
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
    .btn-save {
        padding: 12px 24px; 
        border-radius: 30px;
        transition: background-color 0.3s, box-shadow 0.3s;
        background-color: #007bff;
        border: 3px solid #007bff; 
        color: #fff;
        font-weight: bold;
        text-transform: uppercase;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); 
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3); 
    }
    .btn-save:hover {
        background-color: #0056b3;
        border-color: #0056b3; 
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2); 
        transform: translateY(-2px);
    }
    .btn-save:focus {
        outline: none; 
    }
    .btn-text {
        font-size: 18px;
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
<body>
<%@include file="bilesenler/navbar.jsp"%>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-primary">Profil Düzenleme</h3>
                    
                    <c:if test="${not empty basarisizmsg }">
                        <h5 class="text-center text-danger">${basarisizmsg}</h5>
                        <c:remove var="basarisizmsg" scope="session" />
                    </c:if>
                    
                    <c:if test="${not empty basarilimsg }">
                        <h5 class="text-center text-success">${basarilimsg}</h5>
                        <c:remove var="basarilimsg" scope="session" />
                    </c:if>
                    
                    <form action="profil_duzenle" method="post">
                        <input type="hidden" value="${userobj.id }" name="id">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Adınız ve Soyadınız</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" 
                                   aria-describedby="emailHelp" required="required" name ="fullad" 
                                   value="${userobj.ad}">
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">E-Mail Adresiniz</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" 
                                   aria-describedby="emailHelp" required="required" name ="email" 
                                   value="${userobj.email}">
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">Telefon Numarası</label>
                            <input type="number" class="form-control" id="exampleInputEmail1"
                                aria-describedby="emailHelp" required="required" name ="telno"
                                value="${userobj.telno}">
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputPassword1">Şifrenizi Giriniz</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" 
                                   name="sifre" placeholder="Şifrenizi Giriniz">
                        </div>                 
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn-save btn-lg btn-text">Değişiklikleri Kaydet</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
