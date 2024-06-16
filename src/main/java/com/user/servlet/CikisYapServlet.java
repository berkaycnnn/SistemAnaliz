package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cikisyap")
public class CikisYapServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			session.removeAttribute("userobj");
		
			HttpSession session2 = req.getSession();
			session.setAttribute("basarilimsg","Başarıyla Çıkış Yapıldı!");
			resp.sendRedirect("giris.jsp");
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}	
	}
	
	
}
