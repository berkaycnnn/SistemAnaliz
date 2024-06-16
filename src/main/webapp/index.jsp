<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.SpsDtls"%>
<%@page import="com.DAO.SpsDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kafeuyg-App</title>
<%@include file ="bilesenler/btnCss.jsp"%>
<style type="text/css">
.back-img {
    height: 60vh;
    width: 100%;
    position: relative;
    overflow: hidden;
}

.slider-container {
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
}

.slider-image {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 100%;
    background-size: cover;
    background-position: center;
    transition: left 1s ease;
}

.slider-image.active {
    left: 0;
}

.slider-image.prev {
    left: -100%;
}

.crd-ho:hover {
    background-color: #f7f7f7;
    box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.2);
    transform: translateY(-5px);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

h3, h2 {
    color: #333;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f7f7f7;
    padding: 20px;
    border-bottom: 3px solid #00695c;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: bold;
    margin-bottom: 30px;
    box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1);
}

.card {
    border: none;
    border-radius: 10px;
    box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease;
}

.card-body {
    padding: 20px;
}

.btn {
    border-radius: 5px;
    padding: 8px 20px;
    font-size: 14px;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #c5965e;
}
</style>
</head>
<body style="background-color:#f7f7f7;">

<%
	User u = (User)session.getAttribute("userobj");
%>

<%@include file="bilesenler/navbar.jsp"%>
<div class="container-fluid back-img">
    <div class="slider-container">
        <div class="slider-image active" style="background-image: url('img/arkaplan.png');"></div>
        <div class="slider-image" style="background-image: url('img/arkaplan2.jpg');"></div>
        <div class="slider-image" style="background-image: url('img/arkaplan3.png');"></div>
    </div>
</div>

<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slider-image');

    setInterval(() => {
        slides[currentSlide].classList.remove('active');
        slides[currentSlide].classList.add('prev');
        currentSlide = (currentSlide + 1) % slides.length;
        slides[currentSlide].classList.add('active');
        slides[currentSlide].classList.remove('prev');
    }, 3000); // 3 saniye aralıklarla slayt değişimi
</script>

<br>

<div class="container">
    <h3 class="text-center">İçeceklerimiz</h3>
    <div class="row justify-content-center">
        <% 
        SpsDAOImpl dao=new SpsDAOImpl(DBConnect.getConn());
        List<SpsDtls> list = dao.getBtnSimdikisps(); // 
        for(SpsDtls s : list){
            if("İçecekler".equals(s.getSpstür())) { 
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="spsresimler/<%=s.getResimad()%>" style="width: 150px; height: 200px" class="img-thumblin">
                    <h4><%=s.getSpsad()%></h4>
                    <p><%=s.getSpsürün()%></p>
                    <p>Kategoriler: <%=s.getSpstür()%></p>
                    <div class="row">
                        <div class="col text-center">
                            <% if (u == null) { %>
                                <a href="giris.jsp" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                            <% } else { %>
                                <a href="kart?spsid=<%=s.getSpsId()%>&&userid=<%=u.getId()%>" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                            <% } %>
                            <a href="sps_goster.jsp?spsId=<%=s.getSpsId()%>" class="btn btn-info btn-sm mt-2">Detaylara Bak</a>   
                            <a href="" class="btn btn-warning btn-sm mt-2"><%=s.getFiyat()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                        </div>
                    </div>                            
                </div>
            </div>
        </div>
        <% 
            } 
        } 
        %>
    </div>
</div>
<hr>
<div class="text-center mt-1">
<a href="butun_simdiki_sps.jsp" class="btn btn-success btn-sm text-white">Hepsini Gor</a>
</div>
<hr>

<div class="container">
    <h3 class="text-center">Tatlılar</h3>
    <div class="row justify-content-center">
        <% 
        SpsDAOImpl dao2=new SpsDAOImpl(DBConnect.getConn());
        List<SpsDtls> list2 = dao2.getBtnYenisps(); 
        for(SpsDtls s2 : list2){
            if("Tatlılar".equals(s2.getSpstür())) { 
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="spsresimler/<%=s2.getResimad()%>" style="width: 150px; height: 200px" class="img-thumblin">
                    <h4><%=s2.getSpsad()%></h4>
                    <p><%=s2.getSpsürün()%></p>
                    <p>Kategoriler: <%=s2.getSpstür()%></p>
                    <div class="row">
                        <div class="col text-center">
                            <% if (u == null) { %>
                                <a href="giris.jsp" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                            <% } else { %>
                                <a href="kart?spsid=<%=s2.getSpsId()%>&&userid=<%=u.getId()%>" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                            <% } %>
                            <a href="sps_goster.jsp?spsId=<%=s2.getSpsId()%>" class="btn btn-info btn-sm mt-2">Detaylara Bak</a>   
                            <a href="" class="btn btn-warning btn-sm mt-2"><%=s2.getFiyat()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                        </div>
                    </div>                            
                </div>
            </div>
        </div>
        <% 
            } 
        } 
        %>
    </div>
</div>
<hr>
<div class="text-center mt-1">
<a href="butun_yeni_sps.jsp" class="btn btn-success btn-sm text-white">Hepsini Gor</a>
</div>
<hr>

<div class="container">
    <h3 class="text-center">Aperatifler</h3>
    <div class="row justify-content-center">
        <% 
        List<SpsDtls> list3 = dao.getBtnEskisps(); 
        for(SpsDtls s3 : list3){
            if("Aperatifler".equals(s3.getSpstür())) { 
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="spsresimler/<%=s3.getResimad()%>" style="width: 150px; height: 200px" class="img-thumblin">
                    <h4><%=s3.getSpsad()%></h4>
                    <p><%=s3.getSpsürün()%></p>
                    <p>Kategoriler: <%=s3.getSpstür()%></p>
                    <div class="row">
                        <div class="col text-center">
                        <% if (u == null) { %>
                                <a href="giris.jsp" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                            <% } else { %>
                                <a href="kart?spsid=<%=s3.getSpsId()%>&&userid=<%=u.getId()%>" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                            <% } %>
                            <a href="sps_goster.jsp?spsId=<%=s3.getSpsId()%>" class="btn btn-info btn-sm mt-2">Detaylara Bak</a>   
                            <a href="" class="btn btn-warning btn-sm mt-2"><%=s3.getFiyat()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                        </div>
                    </div>                            
                </div>
            </div>
        </div>
        <% 
            } 
        }
        %>
    </div>
</div>
<hr>
<div class="text-center mt-1">
<a href="butun_eski_sps.jsp" class="btn btn-success btn-sm text-white">Hepsini Gor</a>
</div>
<hr>
<div class="container-fluid text-center text-white p-3 mt-2" style="background-color:#468499 !important;">
    <h5>Ali Berkay Can & Tolga ATMACA & Serkan SARIGÖZ</h5>		
</div>
</body>
</html>
