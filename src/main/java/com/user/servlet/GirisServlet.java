package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/giris")
public class GirisServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			String email=req.getParameter("email");
			String sifre=req.getParameter("sifre");
			
			if("admin@gmail.com".equals(email) && "admin".equals(sifre)) {
				User us = new User();
				us.setAd("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/anasyf.jsp");
			} else {
				
				User us = dao.giris(email, sifre);
				if(us!=null)
				{
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("basarisizmsg", "Email & Şifre Geçersiz!");
					resp.sendRedirect("giris.jsp");
				 }		
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
