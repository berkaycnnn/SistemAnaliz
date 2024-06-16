package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.SpsDtls;
import com.entity.Kart;

public class KartDAOImpl implements KartDAO {

	private Connection conn;
	
	public KartDAOImpl(Connection conn)
	{
		this.conn=conn;
	}

	@Override
	public boolean ekleKart(Kart k) {
		boolean f=false;
		try {
			
			String sql = "insert into kart(spsid,userid,spsad,spstür,fiyat,total_fiyat) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, k.getSpsid());
			ps.setInt(2, k.getUserid());
			ps.setString(3, k.getSpsad());
			ps.setString(4, k.getSpstür());
			ps.setDouble(5, k.getFiyat());
			ps.setDouble(6, k.getTotal_fiyat());
			
			int i=ps.executeUpdate();
			if (i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;	
	}

	@Override
	public List<Kart> getSpsByUser(int userid) {
		List<Kart> list=new ArrayList<Kart>();
		Kart k = null;
		double total_fiyat = 0;
		try {
			
			String sql ="select * from kart where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				k = new Kart();
				k.setKartid(rs.getInt(1));
				k.setSpsid(rs.getInt(2));
				k.setUserid(rs.getInt(3));
				k.setSpsad(rs.getString(4));
				k.setSpstür(rs.getString(5));
				k.setFiyat(rs.getDouble(6));
				
				total_fiyat = total_fiyat+rs.getDouble(7);
				k.setTotal_fiyat(total_fiyat);
				
				list.add(k);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public boolean siparissil(int spsid, int userid) {
		boolean f = false;
		
		try {
			String sql ="delete from kart where spsid=? and userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, spsid);
			ps.setInt(2, userid);	
			int i = ps.executeUpdate();
			
			if (i==1) 
			{
				f=true;
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		return f;
	}
	
	
	
	
}
