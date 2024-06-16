package com.DAO;

import java.util.List;

import com.entity.SpsOdeme;

public interface SpsOdemeDAO {
	
public boolean OdemeKaydet(List<SpsOdeme> sps);
	
	public List<SpsOdeme> getSps(String email);
	
	public List<SpsOdeme> getButunSiparis();

}
