package com.entity;

public class SpsDtls {
	
	private int spsId;
	
	private String spsad;
	
	private String spsürün;
	
	private String fiyat;
	
	private String spstür;
	
	private String kontrol;
	
	private String resimad;
	
	private String email;

	public SpsDtls() 
	{
		super();
	}

	public SpsDtls(String spsad, String spsürün, String fiyat, String spstür, String kontrol,
			String resimad, String email) {
		super();
		this.spsad = spsad;
		this.spsürün = spsürün;
		this.fiyat = fiyat;
		this.spstür = spstür;
		this.kontrol = kontrol;
		this.resimad = resimad;
		this.email = email;
	}

	public int getSpsId() {
		return spsId;
	}

	public void setSpsId(int spsId) {
		this.spsId = spsId;
	}

	public String getSpsad() {
		return spsad;
	}

	public void setSpsad(String spsad) {
		this.spsad = spsad;
	}

	public String getSpsürün() {
		return spsürün;
	}

	public void setSpsürün(String spsürün) {
		this.spsürün = spsürün;
	}

	public String getFiyat() {
		return fiyat;
	}

	public void setFiyat(String fiyat) {
		this.fiyat = fiyat;
	}

	public String getSpstür() {
		return spstür;
	}

	public void setSpstür(String spstür) {
		this.spstür = spstür;
	}

	public String getKontrol() {
		return kontrol;
	}

	public void setKontrol(String kontrol) {
		this.kontrol = kontrol;
	}

	public String getResimad() {
		return resimad;
	}

	public void setResim(String resimad) {
		this.resimad = resimad;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "SpsDtls [spsId=" + spsId + ", spsad=" + spsad + ", spskasiyer=" + spsürün + ", fiyat=" + fiyat
				+ ", spstür=" + spstür + ", kontrol=" + kontrol + ", resimad=" + resimad + ", email=" + email + "]";
	}
	
	
	
}
