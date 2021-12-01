package com.doan.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the LOP database table.
 * 
 */
@Entity
@Table(name="LOP")
@NamedQuery(name="Lop.findAll", query="SELECT l FROM Lop l")
public class Lop implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MALOP")
	private String malop;

	@Column(name="TENLOP")
	private String tenlop;

	//bi-directional many-to-one association to Nhanvien
	@ManyToOne
	@JoinColumn(name="MANV")
	private Nhanvien nhanvien;

	//bi-directional many-to-one association to Sinhvien
	@OneToMany(fetch = FetchType.EAGER, mappedBy="lop", cascade = CascadeType.ALL)
	private List<Sinhvien> sinhviens;

	public Lop() {
	}

	public Lop(String malop, String tenlop, Nhanvien nhanvien, List<Sinhvien> sinhviens) {
		super();
		this.malop = malop;
		this.tenlop = tenlop;
		this.nhanvien = nhanvien;
		this.sinhviens = sinhviens;
	}

	public String getMalop() {
		return this.malop;
	}

	public void setMalop(String malop) {
		this.malop = malop;
	}

	public String getTenlop() {
		return this.tenlop;
	}

	public void setTenlop(String tenlop) {
		this.tenlop = tenlop;
	}

	public Nhanvien getNhanvien() {
		return this.nhanvien;
	}

	public void setNhanvien(Nhanvien nhanvien) {
		this.nhanvien = nhanvien;
	}

	public List<Sinhvien> getSinhviens() {
		return this.sinhviens;
	}

	public void setSinhviens(List<Sinhvien> sinhviens) {
		this.sinhviens = sinhviens;
	}

	public Sinhvien addSinhvien(Sinhvien sinhvien) {
		getSinhviens().add(sinhvien);
		sinhvien.setLop(this);

		return sinhvien;
	}

	public Sinhvien removeSinhvien(Sinhvien sinhvien) {
		getSinhviens().remove(sinhvien);
		sinhvien.setLop(null);

		return sinhvien;
	}

//	@Override
//	public String toString() {
//		return "Lop [malop=" + malop + ", tenlop=" + tenlop + ", nhanvien=" + nhanvien + ", sinhviens=" + sinhviens
//				+ "]";
//	}

	
}