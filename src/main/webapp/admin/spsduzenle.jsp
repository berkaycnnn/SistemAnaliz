<%@page import="com.entity.SpsDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SpsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Sps. Düzenle</title>
<%@include file="btnCss.jsp" %>
<style>
    .btn-primary, .btn-success {
        border-radius: 25px;
        font-size: 1.2rem;
        padding: 12px 25px;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
        color: #fff;
    }

    .btn-success:hover {
        background-color: #218838;
        border-color: #218838;
    }

    .card {
        border-radius: 20px;
        box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.1);
    }

    .card-body {
        padding: 40px;
    }

    .form-group {
        margin-bottom: 30px;
    }

    .form-control {
        border-radius: 20px;
        border-color: #ccc;
        font-size: 1.2rem;
        padding: 15px;
    }

    .text-center {
        text-align: center;
    }

    label {
        font-weight: bold;
        color: #333;
        font-size: 1.5rem;
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

    
    .form-control-sps-kontrol {
        border-radius: 20px;
        border-color: #ccc;
        font-size: 1.2rem;
        padding: 15px;
        height: auto; 
        min-height: 60px; 
    }
</style>
</head>
<body style="background-color: #f0f2f2;">
    <%@include file="navbar.jsp" %>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center">Sipariş Düzenleme</h2>
                        <% 
                        int id=Integer.parseInt(request.getParameter("id"));
                        SpsDAOImpl dao = new SpsDAOImpl(DBConnect.getConn());
                        SpsDtls s =dao.getSpsById(id);
                        %>
                        <form action="../spsduzenle" method="post">
                            <input type="hidden" name="id" value="<%=s.getSpsId()%>">
                            <div class="form-group">
                                <label>Sipariş Adı</label>
                                <input name="spsad" type="text" class="form-control" value="<%=s.getSpsad()%>">
                            </div>

                            <div class="form-group">
                                <label>Sipariş Ürünü</label>
                                <input name="spsürün" type="text" class="form-control" value="<%=s.getSpsürün()%>">
                            </div>

                            <div class="form-group">
                                <label>Fiyat</label>
                                <input name="spsfiyat" type="number" class="form-control" value="<%=s.getFiyat()%>">
                            </div>

                            <div class="form-group">
                                <label>Sipariş Durumu</label>
                                <select name="spskontrol" class="form-control form-control-sps-kontrol">
                                    <% 
                                    if("Aktif".equals(s.getKontrol())) {
                                    %>
                                    <option value="Aktif">Aktif</option> 
                                    <option value="Deaktif">Deaktif</option>
                                    <% 
                                    } else {
                                    %>
                                    <option value="Deaktif">Deaktif</option> 
                                    <option value="Aktif">Aktif</option>      	
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Kaydet</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div style="margin-top: 50px;">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
