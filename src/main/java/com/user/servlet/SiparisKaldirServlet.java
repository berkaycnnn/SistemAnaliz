package com.user.servlet;

import java.io.IOException;

import com.DAO.KartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sps_kaldir")
public class SiparisKaldirServlet extends HttpServlet {
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	        int spsid = Integer.parseInt(req.getParameter("spsid"));
	        int userid = Integer.parseInt(req.getParameter("userid"));
	        KartDAOImpl dao = new KartDAOImpl(DBConnect.getConn());
	        boolean f = dao.siparissil(spsid,userid);
	        HttpSession session = req.getSession();
	        
	        
	        if (f) 
	        {
	            session.setAttribute("basarilimsg", "Sipariş Sepetten Başarıyla Kaldırıldı!");
	            resp.sendRedirect("odeme.jsp");
	        } else {
	            session.setAttribute("basarisizmsg", "İşlem Sırasında Hata Oluştu!");
	            resp.sendRedirect("odeme.jsp");
	        }
	    }
	}