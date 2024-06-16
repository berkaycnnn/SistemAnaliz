package com.admin.servlet;

import java.io.IOException;

import com.DAO.SpsDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/spssil")
public class SpsSilServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			SpsDAOImpl dao = new SpsDAOImpl(DBConnect.getConn());
			boolean f = dao.spssilbtn(id);
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("basarilimsg", "Sipariş Başarıyla Silindi");
				resp.sendRedirect("admin/spsgrntl.jsp");
			} else {
				session.setAttribute("basarisizmsg", "Sipariş Silme Başarısız!");
				resp.sendRedirect("admin/spsgrntl.jsp");
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	
}