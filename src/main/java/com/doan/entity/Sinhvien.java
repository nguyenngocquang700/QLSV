package com.doan.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.List;
import java.util.Date;

/**
 * The persistent class for the SINHVIEN database table.
 * 
 */
@Entity
@Table(name="SINHVIEN")
@NamedQuery(name="Sinhvien.findAll", query="SELECT s FROM Sinhvien s")
public class Sinhvien implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="MASV")
	private String masv;

	@Column(name="DIACHI")
	private String diachi;

	@Column(name="HOTEN")
	private String hoten;

	@Column(name="MATKHAU")
	private String matkhau;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name="NGAYSINH")
	private Date ngaysinh;

	//bi-directional many-to-one association to Bangdiem
	@OneToMany(mappedBy="sinhvien")
	private List<Bangdiem> bangdiems;

	//bi-directional many-to-one association to Lop
	@ManyToOne
	@JoinColumn(name="MALOP")
	private Lop lop;

	public Sinhvien() {
	}

	public Sinhvien(String masv, String diachi, String hoten, String matkhau, Date ngaysinh,
			List<Bangdiem> bangdiems, Lop lop) {
		super();
		this.masv = masv;
		this.diachi = diachi;
		this.hoten = hoten;
		this.matkhau = matkhau;
		this.ngaysinh = ngaysinh;
		this.bangdiems = bangdiems;
		this.lop = lop;
	}

	public String getMasv() {
		return this.masv;
	}

	public void setMasv(String masv) {
		this.masv = masv;
	}

	public String getDiachi() {
		return this.diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getHoten() {
		return this.hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getMatkhau() {
		return this.matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public Date getNgaysinh() {
		return this.ngaysinh;
	}

	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}

	public List<Bangdiem> getBangdiems() {
		return this.bangdiems;
	}

	public void setBangdiems(List<Bangdiem> bangdiems) {
		this.bangdiems = bangdiems;
	}

	public Bangdiem addBangdiem(Bangdiem bangdiem) {
		getBangdiems().add(bangdiem);
		bangdiem.setSinhvien(this);

		return bangdiem;
	}

	public Bangdiem removeBangdiem(Bangdiem bangdiem) {
		getBangdiems().remove(bangdiem);
		bangdiem.setSinhvien(null);

		return bangdiem;
	}

	public Lop getLop() {
		return this.lop;
	}

	public void setLop(Lop lop) {
		this.lop = lop;
	}

}