package com.entity;

public class SpsOdeme {
	
	private int id;
	
	private String siparis_id;
	
	private String kullanici_ad;
	
	private String email;
	
	private String telno;
	
	private String tamAdres;
	
	private String odemeturu;
	
	private String siparis_ad;
	
	private String siparis_tür;
	
	private String fiyat;

	public SpsOdeme() 
	{
		super();	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSiparis_id() {
		return siparis_id;
	}

	public void setSiparis_id(String siparis_id) {
		this.siparis_id = siparis_id;
	}

	public String getKullanici_ad() {
		return kullanici_ad;
	}

	public void setKullanici_ad(String kullanici_ad) {
		this.kullanici_ad = kullanici_ad;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getTamAdres() {
		return tamAdres;
	}

	public void setTamAdres(String tamAdres) {
		this.tamAdres = tamAdres;
	}

	public String getOdemeturu() {
		return odemeturu;
	}

	public void setOdemeturu(String odemeturu) {
		this.odemeturu = odemeturu;
	}

	public String getSiparis_ad() {
		return siparis_ad;
	}

	public void setSiparis_ad(String siparis_ad) {
		this.siparis_ad = siparis_ad;
	}

	public String getSiparis_tür() {
		return siparis_tür;
	}

	public void setSiparis_tür(String siparis_tür) {
		this.siparis_tür = siparis_tür;
	}

	public String getFiyat() {
		return fiyat;
	}

	public void setFiyat(String fiyat) {
		this.fiyat = fiyat;
	}

	@Override
	public String toString() {
		return "SpsOdeme [id=" + id + ", siparis_id=" + siparis_id + ", kullanici_ad=" + kullanici_ad + ", email="
				+ email + ", telno=" + telno + ", tamAdres=" + tamAdres + ", odemeturu=" + odemeturu + ", siparis_ad="
				+ siparis_ad + ", siparis_tür=" + siparis_tür + ", fiyat=" + fiyat + "]";
	}
	
	

}
