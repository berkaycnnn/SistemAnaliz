<%@page import="com.entity.SpsDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SpsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sipariş Göster</title>
<%@include file ="bilesenler/btnCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="bilesenler/navbar.jsp"%>
    
    <%
    int spsId =Integer.parseInt(request.getParameter("spsId"));
    SpsDAOImpl dao = new SpsDAOImpl(DBConnect.getConn());
    SpsDtls s = dao.getSpsById(spsId);
    %>
 
	<div class="container p-3">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="spsresimler/<%=s.getResimad()%>" style="width: 250px; height: 250px" class="img-thumblin">
				<h4 class="mt-3">
					Sipariş Adı: <span class="text-success"><%=s.getSpsad()%></span> 
				</h4>
				<h4>
					Ürün Türü: <span class="text-success"><%=s.getSpsürün()%></span>
				</h4>
				<h4>
					Kategori: <span class="text-success"><%=s.getSpstür()%></span> 
				</h4>						
			</div>
			
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=s.getSpsad()%></h2>		
				<div class="row justify-content-center">
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-money-bill fa-2x d-inline-block"></i>
						<p>Anında Teslim</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fas fa-undo-alt fa-2x d-inline-block"></i>
						<p>İade Edilebilir</p>	
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-globe fa-2x d-inline-block"></i>	
						<p>7/24 Aktif</p>
					</div>
					
					
				</div>
				
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success">Sepete Ekle</a>
					<a href="" class="btn btn-primary"><i class="fa-solid fa-turkish-lira-sign"></i>250</a>
				</div>
				
				
			
				
			</div>
		</div>
	</div>
</body>
</html>
