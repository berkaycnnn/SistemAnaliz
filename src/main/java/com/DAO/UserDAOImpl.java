package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO{
	
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userKayit(User us) 
	{
		boolean f=false;
		
	try 
	{
		String sql="insert into user(ad,email,telno,sifre) values(?,?,?,?)";
		PreparedStatement ps =conn.prepareStatement(sql);
		ps.setString(1, us.getAd());
		ps.setString(2, us.getEmail());
		ps.setString(3, us.getTelno());
		ps.setString(4, us.getSifre());
		
		int i=ps.executeUpdate();
		if (i==1) 
		{
			f=true;
		}
	} 
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	return f;
	}

	@Override
	public User giris(String email, String sifre) {
		User us=null;
		try {
			String sql="select * from user where email=? and sifre=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, sifre);
			
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				us = new User();
				us.setId(rs.getInt(1));
				us.setAd(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setTelno(rs.getString(4));
				us.setSifre(rs.getString(5));
				us.setAdres(rs.getString(6));
				us.setBolge(rs.getString(7));
				us.setSehir(rs.getString(8));
				us.setIlce(rs.getString(9));
				us.setKod(rs.getString(10));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}

	@Override
	public boolean sifrekontrol(int id,String ps) {
		
		boolean f=false;
		try {
			
			String sql ="select * from user where id=? and sifre=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean profilguncelle(User us) {
		boolean f=false;
		
		try 
		{
			String sql="update user set ad=?,email=?,telno=? where id=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, us.getAd());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getTelno());
			ps.setInt(4, us.getId());
			
			int i=ps.executeUpdate();
			if (i==1) 
			{
				f=true;
			}
		} 
			catch(Exception e) 
			{
				e.printStackTrace();
			}
		return f;
	}

	
	public boolean Kullanicikontrol(String kntrl) {
		boolean f = true;
		
		try {
			String sql = "SELECT * FROM `user` WHERE email=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, kntrl);

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				f=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	
	
}
		
