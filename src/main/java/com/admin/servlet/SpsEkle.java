package com.admin.servlet;

import java.io.File;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.SpsDAOImpl;
import com.DB.DBConnect;
import com.entity.SpsDtls;
@WebServlet("/spsekle")
@MultipartConfig
public class SpsEkle extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String spsad = req.getParameter("spsad");
			String spsürün = req.getParameter("spsürün");
			String fiyat = req.getParameter("spsfiyat");
			String spstür = req.getParameter("spstür");
			String kontrol = req.getParameter("spskontrol");
			Part part = req.getPart("resim");
			String fileName=part.getSubmittedFileName();
			
			SpsDtls s = new SpsDtls(spsad, spsürün, fiyat, spstür, kontrol, fileName, "admin");
			
			SpsDAOImpl dao = new SpsDAOImpl(DBConnect.getConn());			
			
			boolean f = dao.spsekle(s);
			
			HttpSession session = req.getSession();
			
			if (f) 
			{
				 String path=getServletContext().getRealPath("")+"spsresimler";
				 
				 File file = new File(path);
				 
				 part.write(path + File.separator + fileName); 	/* Burada etkinlik ekleden klasöre resim taşıma işlemini yaptım! */
				 
				 session.setAttribute("basarilimsg", "Sipariş başarıyla eklendi!");
				 resp.sendRedirect("admin/spsekle.jsp");
			}
			else 
			{
				session.setAttribute("basarisizmsg", "Sipariş oluşturulamadı!");
				resp.sendRedirect("admin/spsekle.jsp");
			}
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
