<%@page import="com.entity.SpsOdeme"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SpsOdemeImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Siparişi Göster</title>
<%@include file="bilesenler/btnCss.jsp"%>
<style>
body {
    background-color: #f8f9fa;
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
h3 {
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
    font-size: 32px;
}
.table-responsive {
    border-radius: 20px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

.table {
    border-radius: 10px;
    overflow: hidden;
}

.bg-success {
    background-color: #28a745 !important;
}

.text-white {
    color: #fff !important;
}

th, td {
    font-size: 18px; 
    padding: 15px; 
}

tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

tbody tr:hover {
    background-color: #e9ecef;
}

.table-responsive {
    overflow-x: auto;
}

.table-striped tbody tr:nth-child(odd) {
    background-color: #f8f9fa;
}

.table-hover tbody tr:hover {
    background-color: #e9ecef;
}

.table th, .table td {
    white-space: nowrap;
    text-align: center;
}

.table th {
    background-color: #007bff;
    color: #fff;
    font-weight: bold;
}

.table th:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>

    <c:if test="${empty userobj}">
        <c:redirect url="giris.jsp"></c:redirect>
    </c:if>

    <%@include file="bilesenler/navbar.jsp"%>
    <div class="container-fluid p-1">
        <br>
        <h3 class="text-center">Siparişi Göster & Detayları</h3>
        <div class="table-responsive">
            <table class="table table-striped table-hover mt-3">
                <thead class="bg-success text-white">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Sipariş Id</th>
                        <th scope="col">Kullanıcı Adı</th>
                        <th scope="col">Sipariş Adı</th>
                        <th scope="col">Sipariş Türü</th>
                        <th scope="col">Fiyat</th>
                        <th scope="col">Ödeme Türü</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    User u = (User) session.getAttribute("userobj");
                    SpsOdemeImpl dao = new SpsOdemeImpl(DBConnect.getConn());
                    List<SpsOdeme> spslist = dao.getSps(u.getEmail());
                    int rowCount = 1; 
                    for (SpsOdeme sps : spslist) {
                    %>
                    <tr>
                        <th scope="row"><%=rowCount++%></th>
                        <td><%=sps.getSiparis_id()%></td>
                        <td><%=sps.getKullanici_ad()%></td>
                        <td><%=sps.getSiparis_ad()%></td>
                        <td><%=sps.getSiparis_tür()%></td>
                        <td><%=sps.getFiyat()%></td>
                        <td><%=sps.getOdemeturu()%></td>
                    </tr>
                    <%
                    }
                    %>

                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
