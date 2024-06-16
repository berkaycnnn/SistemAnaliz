package com.DAO;

import java.util.List;
import com.entity.SpsDtls;

public interface SpsDAO 
{
public boolean spsekle(SpsDtls e);
	
	public List<SpsDtls> getbütünsps();
	
	public SpsDtls getSpsById(int id);
	
	public boolean spsduzenlebtn(SpsDtls e);
	
	public boolean spssilbtn(int id);
	
	public List<SpsDtls> getsimdikisps();
	
	public List<SpsDtls> getyenisps();

	public List<SpsDtls> geteskisps();
	
	public List<SpsDtls> getBtnSimdikisps();
	
	public List<SpsDtls> getBtnYenisps();
	
	public List<SpsDtls> getBtnEskisps();
	
	public List<SpsDtls> getSpsByAra (String ara);

	}


