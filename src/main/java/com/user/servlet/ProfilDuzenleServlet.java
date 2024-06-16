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
@WebServlet("/profil_duzenle")
public class ProfilDuzenleServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
            String ad = req.getParameter("fullad");
            String email = req.getParameter("email");
            String telno = req.getParameter("telno");
            String sifre = req.getParameter("sifre");
            
            User us = new User();
            us.setId(id);
            us.setAd(ad);
            us.setEmail(email);
            us.setTelno(telno);
            
            HttpSession session = req.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            
            boolean f = dao.sifrekontrol(id, sifre);
            if(f) {
            	boolean f2 =dao.profilguncelle(us);
            	if(f2) {
            		session.setAttribute("basarilimsg", "Profil Başarıyla Güncellendi");
                    resp.sendRedirect("user_profilduzenle.jsp");
            	} else {
            		session.setAttribute("basarisizmsg", "Güncelleme İşlemi Sırasında Hata Oluştu");
                    resp.sendRedirect("user_profilduzenle.jsp");
            	}
            	
            } else {
            	session.setAttribute("basarisizmsg", "Şifreniz Hatalı!");
                resp.sendRedirect("user_profilduzenle.jsp");
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
