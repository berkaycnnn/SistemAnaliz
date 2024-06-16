package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.SpsOdeme;

public class SpsOdemeImpl implements SpsOdemeDAO {
	
	private Connection conn;

	public SpsOdemeImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean OdemeKaydet(List<SpsOdeme> spslist) {
		boolean f=false;
		try {
			
			String sql ="insert into sps_kullanici(siparis_id,kullanici_ad,email,adres,telefon,siparis_ad,siparis_tür,fiyat,odemeturu) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(SpsOdeme sps:spslist)
			{
				ps.setString(1, sps.getSiparis_id());
				ps.setString(2, sps.getKullanici_ad());
				ps.setString(3, sps.getEmail());
				ps.setString(4, sps.getTamAdres());
				ps.setString(5, sps.getTelno());
				ps.setString(6, sps.getSiparis_ad());
				ps.setString(7, sps.getSiparis_tür());
				ps.setString(8, sps.getFiyat());
				ps.setString(9, sps.getOdemeturu());
				ps.addBatch();
			}	
			int[] count = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<SpsOdeme> getSps(String email) {
		List<SpsOdeme> list = new ArrayList<SpsOdeme>();
		SpsOdeme o = null;
		try {
			String sql="select * from sps_kullanici where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) 
			{
				o=new SpsOdeme();
				o.setId(rs.getInt(1));
				o.setSiparis_id(rs.getString(2));
				o.setKullanici_ad(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setTamAdres(rs.getString(5));
				o.setTelno(rs.getString(6));
				o.setSiparis_ad(rs.getString(7));
				o.setSiparis_tür(rs.getString(8));
				o.setFiyat(rs.getString(9));
				o.setOdemeturu(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SpsOdeme> getButunSiparis() {
		List<SpsOdeme> list = new ArrayList<SpsOdeme>();
		SpsOdeme o = null;
		try {
			String sql="select * from sps_kullanici";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) 
			{
				o=new SpsOdeme();
				o.setId(rs.getInt(1));
				o.setSiparis_id(rs.getString(2));
				o.setKullanici_ad(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setTamAdres(rs.getString(5));
				o.setTelno(rs.getString(6));
				o.setSiparis_ad(rs.getString(7));
				o.setSiparis_tür(rs.getString(8));
				o.setFiyat(rs.getString(9));
				o.setOdemeturu(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}