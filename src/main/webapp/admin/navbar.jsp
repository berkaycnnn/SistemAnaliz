<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<div class="contanier-fluid" style="height: 12px; background-color:#0e2f44"></div>
<style>
.bg-custom {
    background-color: #0e2f44;
}
.btn-success,
.btn-primary {
    font-size: 1.25rem !important; 
    padding: 10px 20px !important; 
}
</style>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3" text>
            <h3>
            <i class="fa-brands fa-gg"></i> Kafe Uygulaması
            </h3>
        </div>


        <div class="col-md-3">
            <c:if test="${not empty userobj}">
                <a class="btn btn-success text-white"><i class="fas fa-user"></i> ${userobj.ad}</a>
                <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white"><i
                        class="fas fa-user-plus"></i>Çıkış Yap</a>
            </c:if>
            <c:if test="${empty userobj}">
                <a href="../giris.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt"></i> Giris Yap</a>
                <a href="../kayit.jsp" class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>Kayit Ol</a>
            </c:if>

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

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> <a class="nav-link" href="anasyf.jsp">Anasayfa
                <span class="sr-only">(current)</span>
            </a></li>
        </ul>
    </div>
</nav>
