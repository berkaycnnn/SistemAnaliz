<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
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
<title>Bütün Yeni Ürünler</title>
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
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

</style>
</head>
<body>

<%
	User u = (User)session.getAttribute("userobj");
%>

<c:if test="${not empty ekleKart }">

<div id="toast">${ekleKart} </div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="ekleKart" scope="session"/>
</c:if>

    <%@include file="bilesenler/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row p-3">
            <% 
            SpsDAOImpl dao5 = new SpsDAOImpl(DBConnect.getConn());
            List<SpsDtls> list5 = dao5.getBtnYenisps();
            for(SpsDtls s5 : list5){
            %>

            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="spsresimler/<%=s5.getResimad()%>" style="width: 150px; height: 200px" class="img-thumblin">
                        <p><%=s5.getSpsad()%></p>
                        <p><%=s5.getSpsürün()%></p>
                        <p>Kategoriler:<%=s5.getSpstür()%></p>
                        <div class="row">
                            <div class="col text-center">
                             <% 
                                if (u == null) {
                                %>
                                <a href="giris.jsp" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                                <% 
                                } else { 
                                %>
                                <a href="kart?eid=<%=s5.getSpsId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm mt-2"><i class="fas fa-cart-plus"></i> Sepete Ekle</a>
                                <% 
                                }
                                %>
                                <a href="sps_goster.jsp?spsId=<%=s5.getSpsId()%>" class="btn btn-info btn-sm mt-2">Detaylara Bak</a>
                                <a href="" class="btn btn-warning btn-sm ml-1" style="margin-top: 6px;"><%=s5.getFiyat()%> <i class="fa-solid fa-turkish-lira-sign"></i></a>
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
