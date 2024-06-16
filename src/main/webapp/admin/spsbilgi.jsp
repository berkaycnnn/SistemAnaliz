<%@page import="com.entity.SpsOdeme"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SpsOdemeImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Bütün Katılımcılar</title>
<%@include file="btnCss.jsp"%>
<style>
    .table-container {
        margin-top: 20px;
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

    .table-header {
        background-color: #28a745; 
        color: #fff;
        font-weight: bold;
        text-align: center;
        padding: 10px;
        border-radius: 5px;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    .table th,
    .table td {
        border: 1px solid #dee2e6;
        padding: 12px; 
        text-align: center;
        font-size: 18px; 
    }

    .table th {
        background-color: #28a745; 
        color: #fff;
        font-weight: bold;
    }

    .table tbody tr:nth-child(even) {
        background-color: #ffffff; 
    }

    .table tbody tr:nth-child(odd) {
        background-color: #f2f2f2; 
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

<c:if test="${empty userobj}">
		<c:redirect url="giris.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp" %>
	<br>
	<h2 class="text-center">Merhaba Admin!</h2>
	<br>
	<table class="table table-striped">
  		<thead class="bg-success text-white">
    <tr>
      <th scope="col">Sipariş Id</th>
      <th scope="col">Ad</th>
      <th scope="col">Email</th>
      <th scope="col">Adres</th>
      <th scope="col">Tel No</th>
      <th scope="col">Sps. Ad</th>
      <th scope="col">Sps Türü</th>
      <th scope="col">Fiyat</th>
      <th scope="col">Ödeme Tipi</th>  
    </tr>
  </thead>
  <tbody>
  
  <%
  SpsOdemeImpl dao = new SpsOdemeImpl(DBConnect.getConn());
  List<SpsOdeme> spslist = dao.getButunSiparis();
  for(SpsOdeme sps:spslist)
  {%>
  
  <tr>
      <th scope="row"><%=sps.getSiparis_id()%></th>
      <td><%=sps.getKullanici_ad()%></td>
      <td><%=sps.getEmail()%></td>
      <td><%=sps.getTamAdres()%></td>
      <td><%=sps.getTelno()%></td>
      <td><%=sps.getSiparis_ad()%></td>
      <td><%=sps.getSiparis_tür()%></td>
      <td><%=sps.getFiyat()%></td>
      <td><%=sps.getOdemeturu()%></td>
    </tr>
  
  <%}
  %>
  </tbody>
</table>
<div style="margin-top:130px;">
<%@include file="footer.jsp"%></div>

	
</body>
</html>