package com.doan.entity;

import java.io.Serializable;
import javax.persistence.*;
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
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MANV")
	private String manv;

	@Column(name="EMAIL")
	private String email;

	@Column(name="HOTEN")
	private String hoten;

	@Column(name="LUONG")
	private String luong;

	@Column(name="MATKHAU")
	private String matkhau;

	@Column(name="PUBKEY")
	private String pubkey;

	@Column(name="TENDN")
	private String tendn;

	//bi-directional many-to-one association to Lop
	@OneToMany(mappedBy="nhanvien")
	private List<Lop> lops;

	public Nhanvien() {
	}

	public Nhanvien(String manv, String email, String hoten, String luong, String matkhau, String pubkey, String tendn,
			List<Lop> lops) {
		super();
		this.manv = manv;
		this.email = email;
		this.hoten = hoten;
		this.luong = luong;
		this.matkhau = matkhau;
		this.pubkey = pubkey;
		this.tendn = tendn;
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

	public String getLuong() {
		return this.luong;
	}

	public void setLuong(String luong) {
		this.luong = luong;
	}

	public String getMatkhau() {
		return this.matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getPubkey() {
		return this.pubkey;
	}

	public void setPubkey(String pubkey) {
		this.pubkey = pubkey;
	}

	public Object getTendn() {
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

}