package com.DAO;

import com.entity.User;

public interface UserDAO {
	
	public boolean userKayit(User us);
	
	public User giris(String email,String sifre);
	
	public boolean sifrekontrol (int id,String ps);
	
	public boolean profilguncelle (User us);
	
	public boolean Kullanicikontrol (String kntrl);

}
