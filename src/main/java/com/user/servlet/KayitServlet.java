package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/kayit")
public class KayitServlet extends HttpServlet{
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
            String ad = req.getParameter("fullad");
            String email = req.getParameter("email");
            String telno = req.getParameter("telno");
            String sifre = req.getParameter("sifre");
            String kontrol = req.getParameter("kontrol");

            User us = new User();
            us.setAd(ad);
            us.setEmail(email);
            us.setTelno(telno);
            us.setSifre(sifre);

            HttpSession session = req.getSession();

            if (kontrol != null) {
                UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                boolean f2 = dao.Kullanicikontrol(email);
                if (f2) {
                    boolean f = dao.userKayit(us);
                    if (f) {
                        session.setAttribute("basarilimsg", "Kayıt Başarıyla Tamamlandı");
                        resp.sendRedirect("kayit.jsp");
                    } else {
                        session.setAttribute("basarisizmsg", "Kayıt Alma İşlemi Başarısız!");
                        resp.sendRedirect("kayit.jsp");
                    }
                } else {
                    session.setAttribute("emailbasarisizmsg", "Bu Kullanıcı Zaten Kayıtlı Başka Bir E-Posta Deneyin!");
                    resp.sendRedirect("kayit.jsp");
                }
            } else {
                session.setAttribute("basarisizmsg", "Lütfen Şartları & Koşulları Kabul Ediniz");
                resp.sendRedirect("kayit.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("basarisizmsg", "Bir hata oluştu: " + e.getMessage());
            resp.sendRedirect("kayit.jsp");
        }
    }
}


