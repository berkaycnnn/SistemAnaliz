package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import com.DAO.SpsOdemeImpl;
import com.DAO.KartDAOImpl;
import com.DB.DBConnect;
import com.entity.SpsOdeme;
import com.entity.Kart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/odeme")
public class OdemeServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	try {
		HttpSession session = req.getSession();
		int id=Integer.parseInt(req.getParameter("id"));
		
		String ad = req.getParameter("ad");
		String email = req.getParameter("email");
		String telno = req.getParameter("telno");
		String adres = req.getParameter("adres");
		String bolge = req.getParameter("bolge");
		String sehir = req.getParameter("sehir");
		String ilce = req.getParameter("ilce");
		String pinkod = req.getParameter("pinkodu");
		String odemeturu = req.getParameter("odemeturu");
		
		String tamAdres=adres+","+bolge+","+sehir+","+ilce+","+pinkod;
		
		/*System.out.println(ad+" "+email+" "+telno+" "+tamAdres+" "+" "+odemeturu);*/
		
		KartDAOImpl dao = new KartDAOImpl(DBConnect.getConn());
		
		List<Kart> spslist = dao.getSpsByUser(id);
		
		if(spslist.isEmpty()) 
		{
			session.setAttribute("basarisizmsg", "Etkinlik Sepetiniz Boş Lütfen Etkinlik Ekleyin");
			resp.sendRedirect("odeme.jsp" );
		} else {
			SpsOdemeImpl dao2= new SpsOdemeImpl(DBConnect.getConn());
			
			SpsOdeme o = null;
			
			ArrayList<SpsOdeme> siparisliste = new ArrayList<SpsOdeme>();
			Random r = new Random();
			for(Kart k:spslist)
			{
				o = new SpsOdeme();
				o.setSiparis_id("SIPARIS-NO-00" + r.nextInt(1000));
				o.setKullanici_ad(ad);
				o.setEmail(email);
				o.setTelno(telno);
				o.setTamAdres(tamAdres);
				o.setSiparis_ad(k.getSpsad());
				o.setSiparis_tür(k.getSpstür());
				o.setFiyat(k.getFiyat()+"");
				o.setOdemeturu(odemeturu);
				siparisliste.add(o);
				
			}
			
			if("noselect".equals(odemeturu))
			{
				session.setAttribute("basarisizmsg", "Lütfen Bir Ödeme Yöntemi Seçiniz");
				resp.sendRedirect("odeme.jsp");
			} else {
				boolean f = dao2.OdemeKaydet(siparisliste);
				
				if (f) {
					resp.sendRedirect("odeme_basarili.jsp");
				} else {
					session.setAttribute("basarisizmsg", "Siparişiniz Başarısız");
					resp.sendRedirect("odeme.jsp");
				}
			}
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
		
	}

}
