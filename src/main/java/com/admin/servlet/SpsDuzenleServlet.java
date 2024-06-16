package com.admin.servlet;

import java.io.IOException;

import com.DAO.SpsDAOImpl;
import com.DB.DBConnect;
import com.entity.SpsDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/spsduzenle")
public class SpsDuzenleServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id= Integer.parseInt(req.getParameter("id"));
			String spsad = req.getParameter("spsad");
			String spsürün = req.getParameter("spsürün");
			String fiyat = req.getParameter("spsfiyat");
			String kontrol = req.getParameter("spskontrol");
			
			SpsDtls s = new SpsDtls();
			s.setSpsId(id);
			s.setSpsad(spsad);
			s.setSpsürün(spsürün);
			s.setFiyat(fiyat);
			s.setKontrol(kontrol);
			
			SpsDAOImpl dao=new SpsDAOImpl(DBConnect.getConn());
			boolean f=dao.spsduzenlebtn(s);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("basarilimsg", "Sipariş Başarıyla Güncellendi");
				resp.sendRedirect("admin/spsgrntl.jsp");
			} else {
				session.setAttribute("basarisizmsg", "Sipariş Güncellemesi Başarısız!");
				resp.sendRedirect("admin/spsgrntl.jsp");
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	
}
