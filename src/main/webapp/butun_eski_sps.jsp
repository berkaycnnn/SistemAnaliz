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
<title>Bütün Eski Siparisler</title>
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
    <%@include file="bilesenler/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row p-3">
            <% 
            SpsDAOImpl dao6 = new SpsDAOImpl(DBConnect.getConn());
            List<SpsDtls> list = dao6.getBtnEskisps();
            for(SpsDtls s6 : list){
            %>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="spsresimler/<%=s6.getResimad()%>" style="width: 150px; height: 200px" class="img-thumblin">
                        <p><%=s6.getSpsad()%></p>
                        <p><%=s6.getSpsürün()%></p>
                        <p>Kategoriler:<%=s6.getSpstür()%></p>
                        <div class="row">
                            <div class="col text-center">
                                <a href="sps_goster.jsp?spsId=<%=s6.getSpsId()%>" class="btn btn-info btn-sm mt-2">Detaylara Bak</a>
                                <a href="" class="btn btn-warning btn-sm ml-1" style="margin-top: 6px;"><%=s6.getFiyat()%>
                                    <i class="fa-solid fa-turkish-lira-sign"></i>
                                </a>
                            </div>
                        </div>
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
