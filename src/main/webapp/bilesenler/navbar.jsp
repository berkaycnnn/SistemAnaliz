<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<style type="text/css">
.form-control.btn-lg {
	font-size: 1.25rem;
	padding: 0.5rem 1rem;
}

.btn.btn-lg {
	font-size: 1.25rem;
	padding: 0.5rem 1rem;
}

.navbar-nav .nav-item {
	margin-right: 15px;
}

.navbar-nav .nav-link {
	color: #333;
	font-weight: bold;
	text-decoration: none;
	transition: color 0.3s ease;
	font-size: 1.25rem;
}

.navbar-nav .nav-link:hover {
	color: #007bff;
}

.navbar-nav .nav-link.disabled {
	color: #999;
}

.btn-giris {
    background-color: #28a745; 
    border-color: #28a745;
    border-radius: 20px;
    font-size: 1.25rem !important; 
    padding: 15px 20px !important;
    color: #fff; 
}

.btn-giris:hover {
    background-color: #218838; 
    border-color: #218838;
}

.btn-kayit {
    background-color: #007bff; 
    border-color: #007bff;
    border-radius: 20px;
    font-size: 1.25rem !important; 
    padding: 15px 20px !important;
    color: #fff; 
}

.btn-kayit:hover {
    background-color: #800000; 
    border-color: #800000;
}

.btn-giris:hover, .btn-kayit:hover {
    color: #fff; 
}
.bg-custom {
    background-color: #468499; 
}
.btn-arabuton {
    background-color: #007bff; 
    border-color: #007bff;
    border-radius: 20px;
    font-size: 1.25rem !important; 
    padding: 12px 15px !important;
    color: #fff; 
}

.btn-arabuton:hover {
    background-color: #0056b3; 
    border-color: #0056b3;
}
 .top-section {
        height: 10px; 
        background-color: #3d2b1f; 
    }
    .navbar {
        padding-top: 10px; 
        padding-bottom: 10px; 
    }
</style>

<div class="container-fluid"
	style="height: 12px; background-color: #468499;"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row align-items-center">
		<div class="col-md-3">
			<h2>
				<i class="fab fa-gg"></i> Kafeuyg-App
			</h2>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="ara.jsp" method="post">
				<input class="form-control mr-sm-2 btn-lg" type="search" name="ara"
					placeholder="Aramak istediğiniz kelimeyi giriniz"
					aria-label="Search">
				<button class="btn btn-arabuton my-2 my-sm-0 btn-lg" type="submit">Ara</button>
			</form>
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-3">
				<a href="odeme.jsp"><i class="fas fa-shopping-cart fa-2x"></i></a> <a
					href="giris.jsp" class="btn btn-giris btn-lg"><i
					class="fas fa-user-plus"></i> ${userobj.ad} </a> <a href="#"
					class="btn btn-kayit btn-lg text-white" data-toggle="modal"
					data-target="#confirmLogoutModal"> <i
					class="fas fa-arrow-right-to-bracket"></i> Çıkış Yap
				</a>
			</div>
		</c:if>

		<c:if test="${empty userobj}">
			<div class="col-md-3">
				<a href="giris.jsp" class="btn btn-giris btn-lg"><i
					class="fas fa-arrow-right-to-bracket"></i> Giriş Yap</a> <a
					href="kayit.jsp" class="btn btn-kayit btn-lg"><i
					class="fas fa-user-plus "></i> Kayıt Ol</a>
			</div>
		</c:if>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="index.jsp"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="index.jsp">Anasayfa</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="butun_mevcut_sps.jsp"><i class="fas fa-diamond"></i>
					Mevcut Ürünlerimiz</a></li>
			
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="ayarlar.jsp" class="btn btn-light my-2 my-sm-0 btn-lg"
				type="submit"> <i class="fas fa-cog"></i> Ayarlar
			</a> <a href="user_yardim.jsp"
				class="btn btn-light my-2 my-sm-0 ml-1 btn-lg"> <i
				class="fas fa-phone"></i> Bize Ulaşın
			</a>

		</form>
	</div>
</nav>

<div class="modal fade" id="confirmLogoutModal" tabindex="-1"
	role="dialog" aria-labelledby="confirmLogoutModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmLogoutModalLabel">Çıkış
					Yapma İsteği</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Çıkış yapmak istediğinizden emin misiniz?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">İptal</button>
				<a href="cikisyap" class="btn btn-primary">Çıkış Yap</a>
			</div>
		</div>
	</div>
</div>
