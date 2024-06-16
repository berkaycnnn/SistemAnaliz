package com.DAO;

import java.util.List;

import com.entity.Kart;

public interface KartDAO {
	
public boolean ekleKart(Kart k);
	
	public List<Kart> getSpsByUser(int userid);
	
	public boolean siparissil (int spsid,int userid);

}
