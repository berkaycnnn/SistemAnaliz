package com.user.servlet;

import com.DAO.SpsDAOImpl;

import java.io.IOException;

import com.DAO.KartDAOImpl;
import com.DB.DBConnect;
import com.entity.SpsDtls;
import com.entity.Kart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/kart")
public class KartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {		
			int spsid = Integer.parseInt(req.getParameter("spsid"));
			int userid = Integer.parseInt(req.getParameter("userid"));
			
			SpsDAOImpl dao = new SpsDAOImpl(DBConnect.getConn());
			SpsDtls s = dao.getSpsById(spsid);
			
			Kart k = new Kart();
			k.setSpsid(spsid);
			k.setUserid(userid);
			k.setSpsad(s.getSpsad());
			k.setSpstür(s.getSpstür());
			k.setFiyat(Double.parseDouble(s.getFiyat()));
			k.setTotal_fiyat(Double.parseDouble(s.getFiyat()));
			
			KartDAOImpl dao2 = new KartDAOImpl(DBConnect.getConn());
			boolean f = dao2.ekleKart(k);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("ekleKart","Sipariş Karta Başarıyla Eklendi");
				resp.sendRedirect("butun_yeni_sps.jsp");
			} else {
				session.setAttribute("basarisiz", "İşlem Başarısız!");
				resp.sendRedirect("butun_yeni_sps.jsp");
			}
			
			
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

}


