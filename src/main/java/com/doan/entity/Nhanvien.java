package com.doan.entity;

import java.io.Serializable;
import javax.persistence.*;

import java.util.Arrays;
import java.util.List;


/**
 * The persistent class for the NHANVIEN database table.
 * 
 */
@Entity
@Table(name="NHANVIEN")
@NamedQuery(name="Nhanvien.findAll", query="SELECT n FROM Nhanvien n")
public class Nhanvien implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MANV")
	private String manv;

	@Column(name="EMAIL")
	private String email;

	@Column(name="HOTEN")
	private String hoten;

	@Column(name="LUONG")
	private byte[] luong;

	@Column(name="MATKHAU")
	private byte[] matkhau;

	@Column(name="PUBKEY")
	private String pubkey;

	@Column(name="TENDN")
	private String tendn;
	
	@Column(name="CHANGEPW")
	private int changepw;

	//bi-directional many-to-one association to Lop
	@OneToMany(mappedBy="nhanvien")
	private List<Lop> lops;

	public Nhanvien() {
	}



	public Nhanvien(String manv, String email, String hoten, byte[] luong, byte[] matkhau, String pubkey, String tendn,
			int changepw, List<Lop> lops) {
		super();
		this.manv = manv;
		this.email = email;
		this.hoten = hoten;
		this.luong = luong;
		this.matkhau = matkhau;
		this.pubkey = pubkey;
		this.tendn = tendn;
		this.changepw = changepw;
		this.lops = lops;
	}



	public String getManv() {
		return this.manv;
	}

	public void setManv(String manv) {
		this.manv = manv;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHoten() {
		return this.hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public byte[] getLuong() {
		return this.luong;
	}

	public void setLuong(byte[] luong) {
		this.luong = luong;
	}

	public byte[] getMatkhau() {
		return this.matkhau;
	}

	public void setMatkhau(byte[] matkhau) {
		this.matkhau = matkhau;
	}

	public String getPubkey() {
		return this.pubkey;
	}

	public void setPubkey(String pubkey) {
		this.pubkey = pubkey;
	}

	public String getTendn() {
		return this.tendn;
	}

	public void setTendn(String tendn) {
		this.tendn = tendn;
	}

	public List<Lop> getLops() {
		return this.lops;
	}

	public void setLops(List<Lop> lops) {
		this.lops = lops;
	}
	
	

	public int getChangepw() {
		return changepw;
	}



	public void setChangepw(int changepw) {
		this.changepw = changepw;
	}



	public Lop addLop(Lop lop) {
		getLops().add(lop);
		lop.setNhanvien(this);

		return lop;
	}

	public Lop removeLop(Lop lop) {
		getLops().remove(lop);
		lop.setNhanvien(null);

		return lop;
	}



	@Override
	public String toString() {
		return "Nhanvien [manv=" + manv + ", email=" + email + ", hoten=" + hoten + ", luong=" + Arrays.toString(luong)
				+ ", matkhau=" + Arrays.toString(matkhau) + ", pubkey=" + pubkey + ", tendn=" + tendn + ", changepw="
				+ changepw + ", lops=" + lops + "]";
	}



	

}