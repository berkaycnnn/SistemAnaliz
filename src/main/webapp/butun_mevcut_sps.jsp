<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.SpsDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SpsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bütün Mevcut Siparişler</title>
<%@include file ="bilesenler/btnCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
    background-color: #f7f7f7;
    box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.2);
    transform: translateY(-5px);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card {
    border: none;
    border-radius: 10px;
    box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.1);
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
</style>
</head>
<body>

<%
	User u = (User)session.getAttribute("userobj");
%>

    <%@include file="bilesenler/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row p-3">
            <% 
            SpsDAOImpl dao=new SpsDAOImpl(DBConnect.getConn());
            List<SpsDtls> list4 = dao.getBtnSimdikisps();
            for(SpsDtls s4:list4){
            %>
            <div class="col-md-3">
                <div class="card crd-ho mt-3">
                    <div class="card-body text-center">
                        <img alt="" src="spsresimler/<%=s4.getResimad()%>" style="width: 150px; height: 200px" class="img-thumblin">
                        <p><%=s4.getSpsad()%></p>
                        <p><%=s4.getSpsürün()%></p>
                        <p>
                        <% 
                        if(s4.getSpstür().equals("Eski"))
                        {%> 
                            <div class="row">
                                <div class="col text-center">
                                    Kategoriler:<%=s4.getSpstür()%></p>
                                    <a href="sps_goster.jsp?spsId=<%=s4.getSpsId()%>" class="btn btn-info btn-sm mt-2">Detaylara Bak</a> 
                                    <a href="" class="btn btn-warning btn-sm ml-1" style="margin-top: 6px;"><%=s4.getFiyat()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                                </div>
                            </div>
                        <%} else {
                        %>
                            <div class="row">
                                <div class="col text-center">
                                    Kategoriler:<%=s4.getSpstür()%></p>
								<% 
                                if (u == null) {
                                %>
                                <a href="giris.jsp" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                                <% 
                                } else { 
                                %>
                                <a href="kart?eid=<%=s4.getSpsId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                                <% 
                                }
                                %>                                         
                                <a href="sps_goster.jsp?spsId=<%=s4.getSpsId()%>" class="btn btn-info btn-sm mt-2">Detaylara Bak</a> 
                                <a href="" class="btn btn-warning btn-sm ml-1" style="margin-top: 6px;"><%=s4.getFiyat()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
                                </div>
                            </div>
                        <% 
                        }
                        %>                             
                    </div>
                </div>
            </div>
            <% 
            } 
            %>
        </div>
    </div>
</body>
</html>
