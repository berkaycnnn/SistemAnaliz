<%@page import="com.entity.SpsDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SpsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Görüntüle</title>
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

    
    .edit-button {
        background-color: #007bff;
        border-color: #007bff;
        border-radius: 5px;
        padding: 8px 16px;
        font-size: 14px;
        color: #fff;
    }

    .delete-button {
        background-color: #dc3545;
        border-color: #dc3545;
        border-radius: 5px;
        padding: 8px 16px;
        font-size: 14px;
        color: #fff;
    }

    .edit-button:hover,
    .delete-button:hover {
        opacity: 0.8;
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
    <br>
    <h2 class="text-center">Merhaba Admin!</h2>
    <br>
  
    <c:if test="${not empty basarilimsg }">
    	<h5 class="text-center text-success">${basarilimsg }</h5>
        <c:remove var="basarilimsg" scope="session" />
    </c:if>
    
    <c:if test="${not empty basarisizmsg }">
        <h5 class="text-center text-danger">${basarisizmsg }</h5>
        <c:remove var="basarisizmsg" scope="session" />
    </c:if>
    
    <div class="table-container">
        <table class="table table-striped">
            <thead class="bg-success text-white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Resim</th>
                    <th scope="col">Sps. Adı</th>
                    <th scope="col">Sps. Ürünü</th>
                    <th scope="col">Fiyat</th>
                    <th scope="col">Kategori</th>
                    <th scope="col">Durum</th>
                    <th scope="col">Kontrol</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SpsDAOImpl dao = new SpsDAOImpl(DBConnect.getConn());
                    List<SpsDtls> list = dao.getbütünsps();
                        for (SpsDtls s : list) {  
                %>
                <tr>
                    <td><%=s.getSpsId()%></td>
                    <td><img src="../spsresimler/<%=s.getResimad()%>" style="width:50px; height:50px;"></td>
                    <td><%=s.getSpsad()%></td>
                    <td><%=s.getSpsürün()%></td>
                    <td><%=s.getFiyat()%></td>
                    <td><%=s.getSpstür()%></td>
                    <td><%=s.getKontrol()%></td>
                    <td>
                        <a href="spsduzenle.jsp?id=<%=s.getSpsId()%>" class="btn btn-sm edit-button"><i class="fas fa-edit"></i> Düzenle</a>
                        <a href="../spssil?id=<%=s.getSpsId()%>" class="btn btn-sm delete-button"><i class="fas fa-trash-alt"></i> Sil</a>
                    </td>
                </tr>
                <%
                }                 
                %>
            </tbody>
        </table>
    </div>
    <div style="margin-top: 30px;">
    	<%@include file="footer.jsp"%>
    </div>
</body>
</html>
