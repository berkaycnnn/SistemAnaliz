package com.entity;

public class User {

	private int id;
	private String ad;
	private String email;
	private String telno;
	private String sifre;
	private String adres;
	private String bolge;
	private String sehir;
	private String ilce;
	private String kod;
	
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
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
	public String getSifre() {
		return sifre;
	}
	public void setSifre(String sifre) {
		this.sifre = sifre;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getBolge() {
		return bolge;
	}
	public void setBolge(String bolge) {
		this.bolge = bolge;
	}
	public String getSehir() {
		return sehir;
	}
	public void setSehir(String sehir) {
		this.sehir = sehir;
	}
	public String getIlce() {
		return ilce;
	}
	public void setIlce(String ilce) {
		this.ilce = ilce;
	}
	public String getKod() {
		return kod;
	}
	public void setKod(String kod) {
		this.kod = kod;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", ad=" + ad + ", email=" + email + ", telno=" + telno + ", sifre=" + sifre
				+ ", adres=" + adres + ", bolge=" + bolge + ", sehir=" + sehir + ", ilce=" + ilce + ", kod=" + kod
				+ "]";
	}
	
	
	
	
}
	
	
	
	
	
